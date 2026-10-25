-- Paquete de gestión de ventas y reportería
CREATE OR REPLACE PACKAGE PKG_TOP7_VENTA AS
    -- Funcion publica con parametros: Total vendido por la sucursal de un empleado en un mes
    FUNCTION F_CALCULAR_TOTAL_VENDIDO_EMPLEADO_POR_MES(
        P_ID_EMPLEADO IN NUMBER,
        P_MES         IN NUMBER,
        P_ANIO        IN NUMBER
    ) RETURN VARCHAR2;

    -- Funcion publica sin parametros: Recaudacion total historica
    FUNCTION F_TOTAL_VENTAS_HISTORICO RETURN NUMBER;

    -- Procedimiento publico con parametros: Registrar compra y actualizar total
    PROCEDURE PR_SUMAR_COMPRA(
        P_PRODUCTO_ID IN NUMBER,
        P_VENTA_ID    IN NUMBER
    );

    -- Procedimiento publico sin parametros: Reporte masivo de stock critico
    PROCEDURE PR_REPORTE_STOCK_CRITICO;
END PKG_TOP7_VENTA;
/

CREATE OR REPLACE PACKAGE BODY PKG_TOP7_VENTA AS

    -- Subprograma privado: Obtener y validar precio de producto
    FUNCTION F_OBTENER_PRECIO(P_PRODUCTO_ID IN NUMBER) RETURN NUMBER IS
        V_VALOR PRODUCTO.PRECIO%TYPE;
    BEGIN
        SELECT PRECIO
        INTO   V_VALOR
        FROM   PRODUCTO
        WHERE  ID = P_PRODUCTO_ID;

        RETURN V_VALOR;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20006, 'El producto ' || P_PRODUCTO_ID || ' no existe.');
    END F_OBTENER_PRECIO;

    -- Subprograma privado: Validar existencia y disponibilidad de stock en sucursal
    FUNCTION F_VALIDAR_STOCK_SUCURSAL(
        P_PRODUCTO_ID IN NUMBER,
        P_SUCURSAL_ID IN NUMBER
    ) RETURN NUMBER IS
        V_STOCK STOCK.STOCK_DISPONIBLE%TYPE;
    BEGIN
        SELECT STOCK_DISPONIBLE
        INTO   V_STOCK
        FROM   STOCK
        WHERE  PRODUCTO_ID = P_PRODUCTO_ID
          AND  SUCURSAL_ID = P_SUCURSAL_ID;

        IF V_STOCK < 1 THEN
            RAISE_APPLICATION_ERROR(-20001,
                'Stock insuficiente para el producto ID ' || P_PRODUCTO_ID);
        END IF;

        RETURN V_STOCK;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20002,
                'No existe registro de stock para el producto ID ' || P_PRODUCTO_ID ||
                ' en la sucursal de la venta.');
    END F_VALIDAR_STOCK_SUCURSAL;

    -- Implementacion: F_CALCULAR_TOTAL_VENDIDO_EMPLEADO_POR_MES
    FUNCTION F_CALCULAR_TOTAL_VENDIDO_EMPLEADO_POR_MES(
        P_ID_EMPLEADO IN NUMBER,
        P_MES         IN NUMBER,
        P_ANIO        IN NUMBER
    ) RETURN VARCHAR2 IS
        V_NOMBRE_COMPLETO VARCHAR2(150 CHAR);
        V_TOTAL_VENDIDO   NUMBER(15);
    BEGIN
        -- Obtener nombre del empleado
        SELECT TRIM(
                   E.PRIMER_NOMBRE || ' ' || 
                   NVL2(E.SEGUNDO_NOMBRE, E.SEGUNDO_NOMBRE || ' ', '') || 
                   E.PRIMER_APELLIDO || 
                   NVL2(E.SEGUNDO_APELLIDO, ' ' || E.SEGUNDO_APELLIDO, '')
               )
        INTO   V_NOMBRE_COMPLETO
        FROM   EMPLEADO E
        WHERE  E.ID = P_ID_EMPLEADO;

        -- Sumar ventas del período
        SELECT NVL(SUM(V.TOTAL), 0)
        INTO   V_TOTAL_VENDIDO
        FROM   VENTA V 
        INNER JOIN SUCURSAL S ON S.ID = V.SUCURSAL_ID
        INNER JOIN EMPLEADO E ON S.ID = E.SUCURSAL_ID
        WHERE  EXTRACT(YEAR FROM V.FECHA_VENTA) = P_ANIO
          AND  EXTRACT(MONTH FROM V.FECHA_VENTA) = P_MES
          AND  E.ID = P_ID_EMPLEADO;

        RETURN V_NOMBRE_COMPLETO || ': $' || V_TOTAL_VENDIDO;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Empleado ID ' || P_ID_EMPLEADO || ' no encontrado en el sistema.';
        WHEN OTHERS THEN
            RETURN 'Error al calcular ventas: ' || SQLERRM;
    END F_CALCULAR_TOTAL_VENDIDO_EMPLEADO_POR_MES;

    -- Implementacion: F_TOTAL_VENTAS_HISTORICO
    FUNCTION F_TOTAL_VENTAS_HISTORICO RETURN NUMBER IS
        V_TOTAL NUMBER(15);
    BEGIN
        SELECT NVL(SUM(TOTAL), 0) INTO V_TOTAL FROM VENTA;
        RETURN V_TOTAL;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END F_TOTAL_VENTAS_HISTORICO;

    -- Implementacion: PR_SUMAR_COMPRA
    PROCEDURE PR_SUMAR_COMPRA (
        P_PRODUCTO_ID IN NUMBER,
        P_VENTA_ID    IN NUMBER
    ) AS
        V_VALOR       PRODUCTO.PRECIO%TYPE;
        V_STOCK       STOCK.STOCK_DISPONIBLE%TYPE;
        V_SUCURSAL_ID VENTA.SUCURSAL_ID%TYPE;
    BEGIN
        -- Validar venta y obtener sucursal
        BEGIN
            SELECT SUCURSAL_ID
            INTO   V_SUCURSAL_ID
            FROM   VENTA
            WHERE  ID = P_VENTA_ID;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20005, 'La venta ' || P_VENTA_ID || ' no existe.');
        END;

        -- Validar producto y stock mediante subprogramas privados
        V_VALOR := F_OBTENER_PRECIO(P_PRODUCTO_ID);
        V_STOCK := F_VALIDAR_STOCK_SUCURSAL(P_PRODUCTO_ID, V_SUCURSAL_ID);

        -- Registrar detalle en tabla asociativa (dispara trigger de stock)
        BEGIN
            INSERT INTO N_N_VENTA_PRODUCTO (VENTA_ID, PRODUCTO_ID)
            VALUES (P_VENTA_ID, P_PRODUCTO_ID);
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                RAISE_APPLICATION_ERROR(-20007,
                    'El producto ID ' || P_PRODUCTO_ID || ' ya está registrado en la venta ID ' || P_VENTA_ID || '.');
        END;

        -- Actualizar total en la cabecera de la venta
        UPDATE VENTA
        SET    TOTAL = TOTAL + V_VALOR
        WHERE  ID = P_VENTA_ID;

    END PR_SUMAR_COMPRA;

    -- Implementacion: PR_REPORTE_STOCK_CRITICO
    PROCEDURE PR_REPORTE_STOCK_CRITICO IS
        CURSOR c_stock_critico IS
            SELECT p.nombre_producto,
                   s.stock_disponible,
                   s.stock_minimo,
                   suc.nombre AS nombre_sucursal
            FROM   STOCK s
            JOIN   PRODUCTO p ON s.PRODUCTO_id = p.id
            JOIN   SUCURSAL suc ON s.SUCURSAL_id = suc.id
            WHERE  s.stock_disponible <= s.stock_minimo
            ORDER BY suc.nombre, p.nombre_producto;

        v_contador NUMBER := 0;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('--- PKG: REPORTE MASIVO DE STOCK CRITICO ---');

        FOR reg IN c_stock_critico LOOP
            v_contador := v_contador + 1;
            DBMS_OUTPUT.PUT_LINE(v_contador || '. [' || reg.nombre_sucursal || '] ' ||
                                 reg.nombre_producto || ' | Stock: ' || reg.stock_disponible ||
                                 ' (Minimo: ' || reg.stock_minimo || ')');
        END LOOP;

        IF v_contador = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No hay productos bajo stock critico.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Total alertas en paquete: ' || v_contador);
        END IF;
    END PR_REPORTE_STOCK_CRITICO;

-- Bloque de inicializacion (constructor de sesion del paquete)
BEGIN
    DBMS_OUTPUT.PUT_LINE('Inicializacion: PKG_TOP7_VENTA cargado en memoria de sesion.');
END PKG_TOP7_VENTA;
/

-- Pruebas de paquete
SET SERVEROUTPUT ON;

-- 1. Prueba funcion empaquetada con parametros
SELECT PKG_TOP7_VENTA.F_CALCULAR_TOTAL_VENDIDO_EMPLEADO_POR_MES(1, 7, 2026) AS RESULTADO FROM DUAL;

-- 2. Prueba funcion empaquetada sin parametros
SELECT PKG_TOP7_VENTA.F_TOTAL_VENTAS_HISTORICO() AS TOTAL_HISTORICO FROM DUAL;

-- 3. Prueba procedimiento empaquetado sin parametros
BEGIN
    PKG_TOP7_VENTA.PR_REPORTE_STOCK_CRITICO;
END;
/
