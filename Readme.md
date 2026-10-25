# Proyecto Top 7: Sistema de Base de Datos Relacional y Automatización PL/SQL

Solución integral de base de datos desarrollada para la tienda comercial **Top 7**, especializada en juegos de mesa, cartas coleccionables (TCG) y juegos de rol. El sistema centraliza la operación de ventas en sala, facturación, control concurrente de inventario multitienda, gestión comunitaria de eventos y administración laboral bajo el motor **Oracle Database** (compatible con versiones 12c, 19c, 21c y 23c).

---

## 1. Arquitectura del Sistema

* **28 Tablas en Tercera Forma Normal (3NF)**: Esquema normalizado organizado en 6 niveles de dependencia estricta para garantizar consistencia referencial absoluta.
* **Control de Concurrencia y Triggers**: Disparador a nivel de fila (`BEFORE INSERT ... FOR EACH ROW`) con bloqueo `FOR UPDATE` para control de stock atómico, y disparador a nivel de sentencia (`AFTER INSERT OR UPDATE`) para auditoría de transacciones.
* **Modularización PL/SQL y Encapsulamiento**: Paquete corporativo `PKG_TOP7_VENTA` con subprogramas públicos y privados, constructor de sesión y funciones de reportería.
* **Procedimientos y Funciones Almacenadas**: Implementaciones con y sin parámetros orientadas al procesamiento masivo de datos e invocables desde SQL y bloques PL/SQL.
* **Banco de Pruebas Realista**: Simulación operativa multitienda con 3 sucursales chilenas (Top 7 Providencia, Top 7 Viña del Mar y Top 7 Concepción), 12 colaboradores, 20 productos emblemáticos y 45 ventas transaccionales.

---

## 2. Orden Estricto de Ejecución de Scripts

Para inicializar la base de datos sin conflictos de dependencias foráneas ni interferencia de disparadores durante la carga de datos, ejecute los scripts en el siguiente orden:

```
1. 0 - Creacion usuario desarrollador.sql      -> Configura usuario, cuota y privilegios en Oracle.
2. Scripts/Tablas/creacion_tablas_top_7.sql    -> Crea las 28 tablas relacionales con PKs e IDENTITY.
3. Scripts/pobla/poblar_tablas.sql             -> Carga masiva del banco de datos inicial.
4. Scripts/triggers/Triggers.sql               -> Compila triggers de fila y de sentencia.
5. Scripts/procedimientos/Procedimiento.sql    -> Compila procedimientos (con y sin parámetros).
6. Scripts/procedimientos/ProcedimientoVenta.sql -> Compila el procedimiento PR_SUMAR_COMPRA.
7. Scripts/funciones/funcion.sql               -> Compila funciones (con y sin parámetros).
8. Scripts/package/package.sql                 -> Compila el paquete PKG_TOP7_VENTA (Spec y Body).
9. Scripts/cursores/cursores_top7.sql          -> Ejecuta pruebas de cursores, VARRAY y excepciones.
```

---

## 3. Componentes PL/SQL Principales

### Triggers (Nivel de Fila y Sentencia)
* **Trigger a Nivel de Fila (`tgr_modificar_stock`)**:
  * Evento: `BEFORE INSERT ON N_N_VENTA_PRODUCTO FOR EACH ROW`.
  * Mecanismo: Identifica la sucursal emisora y ejecuta `SELECT ... FOR UPDATE` sobre `STOCK`. Si las existencias son insuficientes, aborta con `RAISE_APPLICATION_ERROR(-20001)`. Descuenta el stock de forma atómica.
* **Trigger a Nivel de Sentencia (`tgr_auditoria_ventas_sentencia`)**:
  * Evento: `AFTER INSERT OR UPDATE ON VENTA` (Statement-level).
  * Mecanismo: Audita lotes masivos de transacciones sin incurrir en error de tabla mutante (`ORA-04091`), emitiendo control global sobre el volumen de boletas emitidas.

### Procedimientos Almacenados (Con y Sin Parámetros)
* **Procedimiento con Parámetros (`pr_cantidad_de_jugadores`)**:
  * Firma: `pr_cantidad_de_jugadores(p_cantidad_buscada IN NUMBER)`.
  * Uso: Cursor explícito parametrizado que filtra títulos por cantidad mínima de participantes.
* **Procedimiento sin Parámetros (`pr_reporte_stock_critico`)**:
  * Firma: `pr_reporte_stock_critico`.
  * Uso: Recorrido masivo de existencias multitienda que alerta sobre productos donde `stock_disponible <= stock_minimo`.
* **Procedimiento de Transacción (`PR_SUMAR_COMPRA`)**:
  * Orquesta la adición de productos a ventas, validando venta, producto, stock y actualizando el total.

### Funciones Almacenadas (Con y Sin Parámetros)
* **Función con Parámetros (`F_CALCULAR_TOTAL_VENDIDO_EMPLEADO_POR_MES`)**:
  * Cruza ventas, sucursales y colaboradores según mes y año, devolviendo el nombre formateado y monto.
* **Función sin Parámetros (`F_TOTAL_VENTAS_HISTORICO`)**:
  * Firma: `F_TOTAL_VENTAS_HISTORICO RETURN NUMBER`.
  * Uso: Retorna la facturación histórica global y puede consumirse directamente en sentencias `SELECT` de SQL.

### Paquete Corporativo `PKG_TOP7_VENTA`
* **Subprogramas Públicos**: Expone en su especificación las funciones de reportería (`F_CALCULAR_TOTAL...`, `F_TOTAL_VENTAS_HISTORICO`) y los procedimientos operativos (`PR_SUMAR_COMPRA`, `PR_REPORTE_STOCK_CRITICO`).
* **Subprogramas Privados (Encapsulamiento)**: Funciones auxiliares internas en el cuerpo (`F_OBTENER_PRECIO`, `F_VALIDAR_STOCK_SUCURSAL`) no accesibles fuera del paquete.
* **Constructor de Sesión**: Bloque de inicialización que se ejecuta al instanciar el paquete en la sesión Oracle.

### Consultas Avanzadas y Estructuras (`cursores_top7.sql`)
1. **Buscador con Registro (RECORD)**: Agregación multitienda `SUM(s.stock_disponible)` con `GROUP BY`.
2. **Colección VARRAY**: Demuestra segmentación en memoria y captura de excepción `SUBSCRIPT_OUTSIDE_LIMIT`.
3. **Cursores Anidados**: Cursor maestro por fecha y cursor interno de asistencia con excepción de negocio `ex_evento_vacio`.

---

## 4. Entregables Adicionales

* **Presentación Ejecutiva**: `Presentacion_Top7_Base_de_Datos.pptx` (15 diapositivas panorámicas 16:9, diseño corporativo sin emojis).
* **Informe Técnico**: `Informe top_7.docx` (Documento estructurado con problemática, diccionario relacional, casos de prueba y justificaciones).
* **Diagrama Relacional**: `modelo_relacional_crop.png` (Exportación en alta resolución desde Oracle SQL Developer Data Modeler).
