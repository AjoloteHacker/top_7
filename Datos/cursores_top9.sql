SET SERVEROUTPUT ON;
DECLARE
    -- Definimos el RECORD con los tipos de datos directos
    TYPE tr_juego IS RECORD (
        nombre VARCHAR2(100),
        precio NUMBER,
        stock NUMBER,
        categoria VARCHAR2(50),
        marca VARCHAR2(100)
    );
    v_juego tr_juego;
    
    -- ID del juego que el trabajador intenta buscar
    v_busqueda_id NUMBER := 1; 
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- BUSCADOR RÁPIDO DE JUEGOS ---');
    
    -- ¡CORRECCIÓN APLICADA AQUÍ!: Sumamos el stock con SUM y GROUP BY para evitar error TOO_MANY_ROWS
    SELECT p.nombre_producto, p.precio, SUM(s.cantidad_producto), c.nombre_categoria, m.nombre_marca
    INTO v_juego.nombre, v_juego.precio, v_juego.stock, v_juego.categoria, v_juego.marca
    FROM PRODUCTO p
    JOIN STOCK s ON p.id_producto = s.id_producto
    JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
    JOIN MARCA m ON p.id_marca = m.id_marca
    WHERE p.id_producto = v_busqueda_id
    GROUP BY p.nombre_producto, p.precio, c.nombre_categoria, m.nombre_marca;
    
    -- Imprimimos el resumen
    DBMS_OUTPUT.PUT_LINE('Juego: ' || v_juego.nombre);
    DBMS_OUTPUT.PUT_LINE('Categoría: ' || v_juego.categoria);
    DBMS_OUTPUT.PUT_LINE('Marca: ' || v_juego.marca);
    DBMS_OUTPUT.PUT_LINE('Precio: $' || v_juego.precio);
    DBMS_OUTPUT.PUT_LINE('Stock total: ' || v_juego.stock || ' unidades (todas las sucursales)');
    
EXCEPTION
    -- Manejo de error si el cajero ingresa un juego que no existe
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('Oye, este juego no está en el catálogo.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se encontró más de un registro para el juego consultado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;
/

DECLARE
    -- Definir el VARRAY con capacidad máxima de 5 compartimentos
    TYPE t_edades IS VARRAY(5) OF VARCHAR2(30);
    v_categorias_edad t_edades;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- REPORTE DE EDADES PARA PUBLICIDAD ---');
    
    -- Llenar la "cajita" con las clasificaciones de la tienda
    v_categorias_edad := t_edades('Bebés (0-3)', 'Niños (4-8)', 'Preadolescentes (9-12)', 'Adolescentes (13-17)', 'Adultos (18+)');
    
    DBMS_OUTPUT.PUT_LINE('Categorías de público objetivo actual:');
    
    -- Intentamos recorrer la cajita hasta la posición 6 para forzar el error
    FOR i IN 1..6 LOOP
        DBMS_OUTPUT.PUT_LINE(i || '. ' || v_categorias_edad(i));
    END LOOP;
    
EXCEPTION
    -- Atrapamos el error predefinido de límite del arreglo
    WHEN SUBSCRIPT_OUTSIDE_LIMIT THEN 
        DBMS_OUTPUT.PUT_LINE('¡Alarma! El código intentó buscar una categoría en un compartimento que no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;
/

DECLARE
    v_fecha_busqueda DATE := TO_DATE('15-09-2026', 'DD-MM-YYYY');
   
    -- ¡CORRECCIÓN APLICADA AQUÍ!: Uso de TRUNC(fecha_inicio)
    CURSOR c_torneos (p_fecha DATE) IS
        SELECT id_evento, nombre_evento
        FROM EVENTO
        WHERE TRUNC(fecha_inicio) = p_fecha;
       
    -- Segundo cursor (Interno con parámetro)
    CURSOR c_inscritos (p_id_evento NUMBER) IS
        SELECT c.primer_nombre, c.primer_apellido
        FROM INSCRIPCION i
        JOIN CLIENTE c ON i.id_cliente = c.id_cliente
        WHERE i.id_evento = p_id_evento;
       
    ex_evento_vacio EXCEPTION;
    v_cantidad_inscritos NUMBER;
    v_torneos_encontrados NUMBER := 0;
   
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- LISTA DE ASISTENCIA A TORNEOS ---');
    DBMS_OUTPUT.PUT_LINE('Fecha consultada: ' || TO_CHAR(v_fecha_busqueda, 'DD-MM-YYYY'));
   
    FOR reg_torneo IN c_torneos(v_fecha_busqueda) LOOP
        v_torneos_encontrados := v_torneos_encontrados + 1;
        DBMS_OUTPUT.PUT_LINE('==================================');
        DBMS_OUTPUT.PUT_LINE('Torneo: ' || reg_torneo.nombre_evento);
        DBMS_OUTPUT.PUT_LINE('Jugadores Inscritos:');
       
        v_cantidad_inscritos := 0;
       
        FOR reg_jugador IN c_inscritos(reg_torneo.id_evento) LOOP
            DBMS_OUTPUT.PUT_LINE('- ' || reg_jugador.primer_nombre || ' ' || reg_jugador.primer_apellido);
            v_cantidad_inscritos := v_cantidad_inscritos + 1;
        END LOOP;
       
        -- Si el contador quedó en cero, disparamos nuestra excepción
        IF v_cantidad_inscritos = 0 THEN
            RAISE ex_evento_vacio;
        END IF;
       
    END LOOP;
   
    IF v_torneos_encontrados = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No hay torneos programados para esta fecha.');
    END IF;
   
EXCEPTION
    WHEN ex_evento_vacio THEN
        DBMS_OUTPUT.PUT_LINE('¡Ojo, este evento está vacío, mejor cancélenlo!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;
/
