--Crear trigger para disminuición de stock al hacer una compra
ROLLBACK;

CREATE OR REPLACE TRIGGER tgr_modificar_stock
BEFORE INSERT ON N_N_VENTA_PRODUCTO
FOR EACH ROW
DECLARE
    v_id_sucursal  STOCK.SUCURSAL_ID%TYPE;
    v_stock_actual STOCK.STOCK_DISPONIBLE%TYPE;
    v_cantidad     CONSTANT NUMBER := 1;
BEGIN
    SELECT SUCURSAL_ID
    INTO   v_id_sucursal
    FROM   VENTA
    WHERE  ID = :NEW.VENTA_ID;

    SELECT STOCK_DISPONIBLE
    INTO   v_stock_actual
    FROM   STOCK
    WHERE  PRODUCTO_ID = :NEW.PRODUCTO_ID
      AND  SUCURSAL_ID = v_id_sucursal
    FOR UPDATE;

    IF v_stock_actual < v_cantidad THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Stock insuficiente para el producto ID ' || :NEW.PRODUCTO_ID ||
            '. Disponible: ' || v_stock_actual || ', Solicitado: ' || v_cantidad
        );
    END IF;

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

/*====================================== ejemplo ============================*/

SELECT STOCK_DISPONIBLE, PRODUCTO_ID FROM STOCK WHERE ID=1;
SELECT ID,TOTAL FROM VENTA WHERE ID=1;
/
begin
    PR_SUMAR_COMPRA(1,1);
END;
