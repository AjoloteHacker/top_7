-- 1. Trigger a nivel de fila (Row-level): Descuenta stock de la sucursal al vender un producto
CREATE OR REPLACE TRIGGER tgr_modificar_stock
BEFORE INSERT ON N_N_VENTA_PRODUCTO
FOR EACH ROW
DECLARE
    v_id_sucursal  STOCK.SUCURSAL_ID%TYPE;
    v_stock_actual STOCK.STOCK_DISPONIBLE%TYPE;
    v_cantidad     CONSTANT NUMBER := 1;
BEGIN
    -- Obtener sucursal de la venta
    SELECT SUCURSAL_ID
    INTO   v_id_sucursal
    FROM   VENTA
    WHERE  ID = :NEW.VENTA_ID;

    -- Bloquear fila y leer stock disponible
    SELECT STOCK_DISPONIBLE
    INTO   v_stock_actual
    FROM   STOCK
    WHERE  PRODUCTO_ID = :NEW.PRODUCTO_ID
      AND  SUCURSAL_ID = v_id_sucursal
    FOR UPDATE;

    -- Validar stock
    IF v_stock_actual < v_cantidad THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Stock insuficiente para el producto ID ' || :NEW.PRODUCTO_ID ||
            '. Disponible: ' || v_stock_actual || ', Solicitado: ' || v_cantidad
        );
    END IF;

    -- Descontar stock
    UPDATE STOCK
    SET    STOCK_DISPONIBLE = STOCK_DISPONIBLE - v_cantidad
    WHERE  PRODUCTO_ID = :NEW.PRODUCTO_ID
      AND  SUCURSAL_ID = v_id_sucursal;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'No existe registro de stock para el producto ID ' || :NEW.PRODUCTO_ID ||
            ' en la sucursal de la venta.'
        );
END tgr_modificar_stock;
/

-- 2. Trigger a nivel de sentencia (Statement-level): Auditoria y notificacion tras operaciones en VENTA
CREATE OR REPLACE TRIGGER tgr_auditoria_ventas_sentencia
AFTER INSERT OR UPDATE ON VENTA
DECLARE
    v_total_ventas NUMBER;
BEGIN
    -- En un trigger de sentencia si se puede consultar la tabla VENTA sin error de tabla mutante
    SELECT COUNT(*) INTO v_total_ventas FROM VENTA;
    DBMS_OUTPUT.PUT_LINE('Notificacion (Trigger Sentencia): Lote procesado en VENTA. Total de boletas registradas: ' || v_total_ventas);
END tgr_auditoria_ventas_sentencia;
/

-- Pruebas de verificación
SET SERVEROUTPUT ON;

-- Consultar stock previo
SELECT ID, PRODUCTO_ID, SUCURSAL_ID, STOCK_DISPONIBLE FROM STOCK WHERE PRODUCTO_ID = 1 AND SUCURSAL_ID = 1;
SELECT ID, TOTAL FROM VENTA WHERE ID = 1;

-- Ejecutar venta (activa trigger de fila tgr_modificar_stock y trigger de sentencia tgr_auditoria_ventas_sentencia)
BEGIN
    PR_SUMAR_COMPRA(1, 1);
END;
/

-- Verificar stock descontado y total actualizado
SELECT ID, PRODUCTO_ID, SUCURSAL_ID, STOCK_DISPONIBLE FROM STOCK WHERE PRODUCTO_ID = 1 AND SUCURSAL_ID = 1;
SELECT ID, TOTAL FROM VENTA WHERE ID = 1;
