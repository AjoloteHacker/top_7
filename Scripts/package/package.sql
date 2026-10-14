CREATE OR REPLACE PACKAGE PKG_TOP7_VENTA
--SPEC
as  FUNCTION F_CALCULAR_TOTAL_VENDIDO_EMPLEADO_POR_MES(
        P_ID_EMPLEADO   NUMBER,
        P_MES           NUMBER,
        P_ANIO          NUMBER
    )RETURN varchar2;

    procedure PR_SUMAR_COMPRA (
    P_PRODUCTO_ID IN NUMBER,
    P_VENTA_ID    IN NUMBER
    );
END PKG_TOP7_VENTA;
/

--BODY
CREATE OR REPLACE PACKAGE BODY PKG_TOP7_VENTA AS
    FUNCTION F_CALCULAR_TOTAL_VENDIDO_EMPLEADO_POR_MES(
        P_ID_EMPLEADO NUMBER,
        P_MES NUMBER,
        P_ANIO NUMBER
    )RETURN varchar2 IS
        V_NOMBRE_COMPLETO varchar2(50);
        V_TOTAL_VENDIDO NUMBER(10);
    BEGIN
        SELECT
            (
                E.PRIMER_NOMBRE||' '||E.SEGUNDO_NOMBRE||' '||
                E.PRIMER_APELLIDO||' '||E.SEGUNDO_APELLIDO
            ),
            SUM(V.TOTAL)
        INTO V_NOMBRE_COMPLETO, V_TOTAL_VENDIDO
        FROM VENTA V 
        INNER JOIN SUCURSAL S ON S.ID=V.SUCURSAL_ID
        INNER JOIN EMPLEADO E ON S.ID=E.SUCURSAL_ID
        WHERE   extract(YEAR FROM V.FECHA_VENTA)=P_ANIO
            AND extract(MONTH FROM V.FECHA_VENTA)=P_MES
            AND E.ID = P_ID_EMPLEADO
        GROUP BY (
                E.PRIMER_NOMBRE||' '||E.SEGUNDO_NOMBRE||' '||
                E.PRIMER_APELLIDO||' '||E.SEGUNDO_APELLIDO
            );

        RETURN V_NOMBRE_COMPLETO||': $'||V_TOTAL_VENDIDO;
    EXCEPTION when NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('RUT INEXISTENTE');
    END F_CALCULAR_TOTAL_VENDIDO_EMPLEADO_POR_MES;

    PROCEDURE PR_SUMAR_COMPRA (
        P_PRODUCTO_ID IN NUMBER,
        P_VENTA_ID    IN NUMBER
    ) AS
        V_VALOR       PRODUCTO.PRECIO%TYPE;
        V_STOCK       STOCK.STOCK_DISPONIBLE%TYPE;
        V_SUCURSAL_ID VENTA.SUCURSAL_ID%TYPE;
    BEGIN
        -- Sucursal de la venta (también valida que la venta exista)
        BEGIN
            SELECT SUCURSAL_ID
            INTO   V_SUCURSAL_ID
            FROM   VENTA
            WHERE  ID = P_VENTA_ID;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20005, 'La venta ' || P_VENTA_ID || ' no existe.');
        END;

        -- Precio del producto
        BEGIN
            SELECT PRECIO
            INTO   V_VALOR
            FROM   PRODUCTO
            WHERE  ID = P_PRODUCTO_ID;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20006, 'El producto ' || P_PRODUCTO_ID || ' no existe.');
        END;

        -- Stock del producto en la sucursal de la venta
        BEGIN
            SELECT STOCK_DISPONIBLE
            INTO   V_STOCK
            FROM   STOCK
            WHERE  PRODUCTO_ID = P_PRODUCTO_ID
            AND  SUCURSAL_ID = V_SUCURSAL_ID;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20002,
                    'No existe registro de stock para el producto ID ' || P_PRODUCTO_ID ||
                    ' en la sucursal de la venta.');
        END;

        IF V_STOCK < 1 THEN
            RAISE_APPLICATION_ERROR(-20001,
                'Stock insuficiente para el producto ID ' || P_PRODUCTO_ID);
        END IF;

        -- Primero el INSERT (aquí actúa el trigger), después el total
        INSERT INTO N_N_VENTA_PRODUCTO (VENTA_ID, PRODUCTO_ID)
        VALUES (P_VENTA_ID, P_PRODUCTO_ID);

        UPDATE VENTA
        SET    TOTAL = TOTAL + V_VALOR
        WHERE  ID = P_VENTA_ID;
    END PR_SUMAR_COMPRA;

END PKG_TOP7_VENTA;
/
commit;