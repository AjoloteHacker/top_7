--Crear trigger para registrar historial de compras y disminuición de stock al hacer una compra

CREATE OR REPLACE TRIGGER tgr_historial_compras
AFTER INSERT ON DETALLE_VENTA 
FOR EACH ROW
DECLARE
    v_id_sucursal STOCK.ID_SUCURSAL%TYPE;
    v_stock_actual STOCK.CANTIDAD_PRODUCTO%TYPE;
BEGIN
   SELECT e.id_sucursal
   INTO v_id_sucursal
   FROM VENTA v
   INNER JOIN EMPLEADO e ON v.id_empleado = e.id_empleado
   WHERE v.id_venta = :NEW.id_venta;

   SELECT cantidad_producto
   INTO v_stock_actual
   FROM STOCK
   WHERE id_producto = :NEW.id_producto
    AND id_sucursal = v_id_sucursal;

    IF v_stock_actual < :NEW.cantidad THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Stock insuficiente para el producto ID ' || :NEW.id_producto ||
            'Disponible: ' || v_stock_actual || ', Solicitado: ' || :NEW.cantidad
        );
    END IF;

    UPDATE STOCK
    SET cantidad_producto = cantidad_producto - :NEW.cantidad
    WHERE id_producto = :NEW.id_producto
        AND id_sucursal = v_id_sucursal;

     INSERT INTO HISTORIAL_STOCK (
            id_producto,
            id_sucursal,
            cantidad_descontada,
            stock_anterior,
            stock_nuevo,
            id_venta
        ) VALUES (
            :NEW.id_producto,
            v_id_sucursal,
            :NEW.cantidad,
            v_stock_actual,
            v_stock_actual - :NEW.cantidad,
            :NEW.id_venta
        );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'No Existe registro de stock para el produicto ID ' || :NEW.id_producto ||
            'en la sucursal correspondiente.'
        );
END tgr_historial_compras;
/
