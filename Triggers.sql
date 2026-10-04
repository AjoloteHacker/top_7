/* CReacion de la tabla historial stock */
DROP TABLE HISTORIAL_STOCK;
/
CREATE TABLE HISTORIAL_STOCK(
    ID                  NUMBER GENERATED ALWAYS AS identity,
    ID_PRODUCTO         NUMBER NOT NULL,
    ID_SUCURSAL         NUMBER NOT NULL,
    cantidad_descontada number NOT NULL,
    stock_anterior      NUMBER NOT NULL,
    stock_nuevo         NUMBER NOT NULL,
    id_venta            NUMBER NOT NULL,
    CONSTRAINT FK_ID_PRODUCTO FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO),
    CONSTRAINT FK_ID_SUCURSAL foreign KEY (id_sucursal) REFERENCES SUCURSAL(id_sucursal),
    CONSTRAINT FK_ID_VENTA foreign KEY (ID_VENTA) REFERENCES VENTA(ID_VENTA)

);
commit;
/
--Crear trigger para registrar historial de compras y disminuición de stock al hacer una compra
CREATE OR REPLACE TRIGGER tgr_historial_compras
before INSERT ON DETALLE_VENTA 
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
            'No Existe registro de stock para el producto ID ' || :NEW.id_producto ||
            ' en la sucursal correspondiente.'
        );
END tgr_historial_compras;
/


/* pruebas */
select * from HISTORIAL_STOCK;

select * from stock;

INSERT INTO VENTA(FECHA_VENTA,TOTAL,NRO_BOLETA,ID_CLIENTE,ID_EMPLEADO,ID_METODO_PAGO) VALUES(sysdate,5990,'BOL-1031', 19, 1, 3);
INSERT INTO DETALLE_VENTA(CANTIDAD, PRECIO_UNITARIO, ID_VENTA, ID_PRODUCTO) VALUES(1, 5990, 46,1);
