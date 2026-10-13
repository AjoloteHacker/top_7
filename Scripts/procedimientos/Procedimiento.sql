CREATE OR REPLACE PROCEDURE pr_cantidad_de_jugadores(
    p_cantidad_buscada IN NUMBER
)
IS
    CURSOR cursor_cant_jugadores IS
        SELECT nombre_producto, min_jugadores
        FROM PRODUCTO
        WHERE min_jugadores = p_cantidad_buscada;

    v_nombre_producto    PRODUCTO.NOMBRE_PRODUCTO%TYPE;
    v_cantidad_jugadores PRODUCTO.MIN_JUGADORES%TYPE;
BEGIN
    OPEN cursor_cant_jugadores;
    LOOP
        FETCH cursor_cant_jugadores INTO v_nombre_producto, v_cantidad_jugadores;
        EXIT WHEN cursor_cant_jugadores%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('NOMBRE: ' || v_nombre_producto);
        DBMS_OUTPUT.PUT_LINE('CANTIDAD: ' || v_cantidad_jugadores);
    END LOOP;
    CLOSE cursor_cant_jugadores;
END;
/

DECLARE
    v_cantidad_jugadores NUMBER := 3;
BEGIN
    pr_cantidad_de_jugadores(v_cantidad_jugadores);
END;
