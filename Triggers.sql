--Crear trigger para registrar historial de compras y disminuición de stock al hacer una compra

CREATE OR REPLACE TRIGGER tgr_historial_compras
AFTER INSERT ON COMPRA FOR EACH ROW
WHEN (NEW.id_compra IS NOT NULL)
BEGIN
    INSERT INTO VENTA (id_venta, fecha_venta, total, nro_boleta, id_cliente, id_empleado, id_metodo_pago)
    VALUES (:NEW.id_compra)
    
END tgr_historial_compras;
/
