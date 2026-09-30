/* Funcion que permita calcular lo total vendido por un empleado en un rango de fechas determinado. */
CREATE OR REPLACE FUNCTION F_CALCULAR_TOTAL_VENDIDO_EMPLEADO_POR_MES(
    P_ID_EMPLEADO NUMBER,
    P_MES NUMBER,
    P_ANIO NUMBER
)RETURN NUMBER IS
    V_TOTAL_VENIDOD NUMBER;
BEGIN
    NULL;
END;
/
SELECT * FROM EMPLEADO;