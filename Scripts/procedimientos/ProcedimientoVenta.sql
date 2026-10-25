-- Procedimiento: Agrega un producto a una venta y actualiza su total
CREATE OR REPLACE PROCEDURE PR_SUMAR_COMPRA (
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

    -- Validar producto y obtener precio
    BEGIN
        SELECT PRECIO
        INTO   V_VALOR
        FROM   PRODUCTO
        WHERE  ID = P_PRODUCTO_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20006, 'El producto ' || P_PRODUCTO_ID || ' no existe.');
    END;

    -- Validar stock en la sucursal
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

    -- Validar disponibilidad
    IF V_STOCK < 1 THEN
        RAISE_APPLICATION_ERROR(-20001,
            'Stock insuficiente para el producto ID ' || P_PRODUCTO_ID);
    END IF;

    -- Registrar producto en venta (dispara trigger de stock)
    BEGIN
        INSERT INTO N_N_VENTA_PRODUCTO (VENTA_ID, PRODUCTO_ID)
        VALUES (P_VENTA_ID, P_PRODUCTO_ID);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RAISE_APPLICATION_ERROR(-20007,
                'El producto ID ' || P_PRODUCTO_ID || ' ya está registrado en la venta ID ' || P_VENTA_ID || '.');
    END;

    -- Actualizar monto total de la venta
    UPDATE VENTA
    SET    TOTAL = TOTAL + V_VALOR
    WHERE  ID = P_VENTA_ID;

END PR_SUMAR_COMPRA;
/
