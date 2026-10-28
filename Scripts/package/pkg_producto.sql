-- Paquete de consultas de productos
CREATE OR REPLACE PACKAGE pkg_producto AS
    -- Procedimiento: Lista los productos segun la cantidad minima de jugadores
    PROCEDURE pr_cantidad_de_jugadores(
        p_cantidad_buscada IN NUMBER
    );
END pkg_producto;
/

CREATE OR REPLACE PACKAGE BODY pkg_producto AS

    -- Implementacion: pr_cantidad_de_jugadores
    PROCEDURE pr_cantidad_de_jugadores(
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

END pkg_producto;
/

-- Pruebas de paquete
SET SERVEROUTPUT ON;

BEGIN
    pkg_producto.pr_cantidad_de_jugadores(2);
END;
/