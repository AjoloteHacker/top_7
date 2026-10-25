SET SERVEROUTPUT ON;

-- Procedimiento con parametros: Consulta juegos segun minimo de jugadores
CREATE OR REPLACE PROCEDURE pr_cantidad_de_jugadores(
    p_cantidad_buscada IN NUMBER
)
IS
    CURSOR cursor_cant_jugadores IS
        SELECT nombre_producto, min_jugadores
        FROM   PRODUCTO
        WHERE  min_jugadores = p_cantidad_buscada;

    v_nombre_producto    PRODUCTO.NOMBRE_PRODUCTO%TYPE;
    v_cantidad_jugadores PRODUCTO.MIN_JUGADORES%TYPE;
    v_encontrados        NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Búsqueda para ' || p_cantidad_buscada || ' jugadores ---');

    OPEN cursor_cant_jugadores;
    LOOP
        FETCH cursor_cant_jugadores INTO v_nombre_producto, v_cantidad_jugadores;
        EXIT WHEN cursor_cant_jugadores%NOTFOUND;

        v_encontrados := v_encontrados + 1;
        DBMS_OUTPUT.PUT_LINE(v_encontrados || '. ' || v_nombre_producto || ' (Mínimo: ' || v_cantidad_jugadores || ')');
    END LOOP;
    CLOSE cursor_cant_jugadores;

    IF v_encontrados = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron productos para ' || p_cantidad_buscada || ' jugadores.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Total encontrados: ' || v_encontrados);
    END IF;
END pr_cantidad_de_jugadores;
/

-- Procedimiento sin parametros: Reporte masivo de productos en stock critico
CREATE OR REPLACE PROCEDURE pr_reporte_stock_critico
IS
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
    DBMS_OUTPUT.PUT_LINE('--- ALERTA MASIVA DE STOCK CRITICO ---');

    FOR reg IN c_stock_critico LOOP
        v_contador := v_contador + 1;
        DBMS_OUTPUT.PUT_LINE(v_contador || '. [' || reg.nombre_sucursal || '] ' ||
                             reg.nombre_producto || ' | Stock: ' || reg.stock_disponible ||
                             ' (Minimo: ' || reg.stock_minimo || ')');
    END LOOP;

    IF v_contador = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No hay productos bajo stock critico.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Total de alertas de reposicion: ' || v_contador);
    END IF;
END pr_reporte_stock_critico;
/

-- Pruebas
BEGIN
    -- Prueba procedimiento con parametros
    pr_cantidad_de_jugadores(3);

    -- Prueba procedimiento sin parametros
    pr_reporte_stock_critico;
END;
/
