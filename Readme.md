**FUNCIONAMIENTO TRIGGER**
-- 
``tgr_modificar_stock`` El trigger se ejecuta después de insertar algún dato de la tabla N_N_VENTA_PRODUCTO (Tabla pivote entre PRODUCTO y VENTA), lo que hace es modificar el stock asociado a una venta en la misma tabla, el trigger funciona de mejor manera cuando se usa el procedure ``PR_SUMAR_COMPRA`` ya que estos fueron diseñados para que se usen en conjunto, pero de todas maneras el trigger mismo tiene medidas de seguridad en caso de que se sue de manera independiente.

**FUNCIOMIENTO PACKAGE**
--
``PKG_TOP7_VENTA`` El package organiza todo el procedure ``PR_SUMAR_COMPRA`` y la función ``F_CALCULAR_TOTAL_VENDIDO_EMPLEADO_POR_MES`` siendo estos los encargados de administrar o revisar los datos asociados a las ventas y los empleados.

 - Es importante aclarar el funcionamiento del procedure ``PR_SUMAR_COMPRA``, el funcionamiento de este procedure es que al momento de registrar una venta se necesita agregar datos a la tabla pivote N_N_VENTA_PRODUCTO, y de sumar el precio del producto comprado a la tabla VENTA, para que el usuario no tenga que hacerlo y así se evitan errores humanos.