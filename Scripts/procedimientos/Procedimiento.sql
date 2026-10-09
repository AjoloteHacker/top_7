/* Crear un procedure */
/* */
CREATE OR REPLACE PROCEDURE pr_cantidad_de_jugadores(
    p_cantidad_buscada IN NUMBER
)
IS
    -- Decimos producto porque
    CURSOR cursor_cant_jugadores IS 
    SELECT nombre_producto, min_jugadores
    FROM PRODUCTO
    v_nombre_producto PRODUCTO.NOMBRE_PRODUCTO%TYPE;
    v_cantidad_jugadores PRODUCTO.min_jugadores%TYPE;

BEGIN
    SELECT
    INTO 
    FROM PRODUCTO
    WHERE min_jugadores = p_cantidad_buscada;
END;
/
