SET SERVEROUTPUT ON;

-- 1. Buscador con tipo RECORD y agregación multitienda
DECLARE
    TYPE tr_juego IS RECORD (
        nombre    VARCHAR2(100),
        precio    NUMBER,
        stock     NUMBER,
        categoria VARCHAR2(50),
        marca     VARCHAR2(50)
    );
    v_juego tr_juego;
    v_busqueda_id NUMBER := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Búsqueda de juego (ID: ' || v_busqueda_id || ') ---');

    SELECT p.nombre_producto, p.precio, SUM(s.stock_disponible), c.nombre, m.nombre
    INTO   v_juego.nombre, v_juego.precio, v_juego.stock, v_juego.categoria, v_juego.marca
    FROM   PRODUCTO p
    JOIN   STOCK s ON p.id = s.PRODUCTO_id
    JOIN   CATEGORIA_PRODUCTO c ON p.CATEGORIA_PRODUCTO_id = c.id
    JOIN   MARCA m ON p.MARCA_id = m.id
    WHERE  p.id = v_busqueda_id
    GROUP BY p.nombre_producto, p.precio, c.nombre, m.nombre;

    DBMS_OUTPUT.PUT_LINE('Juego:        ' || v_juego.nombre);
    DBMS_OUTPUT.PUT_LINE('Categoría:    ' || v_juego.categoria);
    DBMS_OUTPUT.PUT_LINE('Marca:        ' || v_juego.marca);
    DBMS_OUTPUT.PUT_LINE('Precio:       $' || v_juego.precio);
    DBMS_OUTPUT.PUT_LINE('Stock Global: ' || v_juego.stock || ' unidades');

EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('Aviso: El producto ID ' || v_busqueda_id || ' no existe.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se encontró más de un registro.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;
/

-- 2. Colección VARRAY y control de índice fuera de rango
DECLARE
    TYPE t_edades IS VARRAY(5) OF VARCHAR2(30);
    v_categorias_edad t_edades;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Clasificación de edades ---');

    v_categorias_edad := t_edades('Bebés (0-3)', 'Niños (4-8)', 'Preadolescentes (9-12)', 'Adolescentes (13-17)', 'Adultos (18+)');

    -- Se itera hasta 6 para probar el control de excepción
    FOR i IN 1..6 LOOP
        DBMS_OUTPUT.PUT_LINE(i || '. ' || v_categorias_edad(i));
    END LOOP;

EXCEPTION
    WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN 
        DBMS_OUTPUT.PUT_LINE('Captura preventiva: Índice fuera del límite del VARRAY.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;
/

-- 3. Cursores anidados con parámetros y excepción personalizada
DECLARE
    v_fecha_busqueda DATE := TO_DATE('18-09-2026', 'DD-MM-YYYY');
   
    CURSOR c_torneos (p_fecha DATE) IS
        SELECT e.id AS id_evento, e.nombre AS nombre_evento
        FROM   EVENTO e
        JOIN   TIPO_EVENTO te ON e.TIPO_EVENTO_id = te.id
        WHERE  TRUNC(te.inicio_evento) = p_fecha;
       
    CURSOR c_inscritos (p_id_evento NUMBER) IS
        SELECT i.id AS id_inscripcion, i.fecha_inscripcion, i.asistio
        FROM   INSCRIPCION i
        WHERE  i.EVENTO_id = p_id_evento;
       
    ex_evento_vacio       EXCEPTION;
    v_cantidad_inscritos  NUMBER;
    v_torneos_encontrados NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Control de asistencia (' || TO_CHAR(v_fecha_busqueda, 'DD-MM-YYYY') || ') ---');

    FOR reg_torneo IN c_torneos(v_fecha_busqueda) LOOP
        v_torneos_encontrados := v_torneos_encontrados + 1;
        DBMS_OUTPUT.PUT_LINE('Evento: ' || reg_torneo.nombre_evento || ' (ID: ' || reg_torneo.id_evento || ')');
       
        v_cantidad_inscritos := 0;
       
        FOR reg_inscripcion IN c_inscritos(reg_torneo.id_evento) LOOP
            DBMS_OUTPUT.PUT_LINE('  - Inscripción #' || reg_inscripcion.id_inscripcion || 
                                 ' | Asistencia: ' || reg_inscripcion.asistio || 
                                 ' | Fecha: ' || TO_CHAR(reg_inscripcion.fecha_inscripcion, 'YYYY-MM-DD HH24:MI'));
            v_cantidad_inscritos := v_cantidad_inscritos + 1;
        END LOOP;
       
        IF v_cantidad_inscritos = 0 THEN
            RAISE ex_evento_vacio;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Total registrados: ' || v_cantidad_inscritos);
        END IF;
    END LOOP;
   
    IF v_torneos_encontrados = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No hay torneos programados para esta fecha.');
    END IF;

EXCEPTION
    WHEN ex_evento_vacio THEN
        DBMS_OUTPUT.PUT_LINE('Alerta: El evento no registra inscripciones.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;
/
