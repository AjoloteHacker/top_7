--tablas principales sin llaves foraneas

CREATE TABLE SUCURSAL(
  id_sucursal NUMBER GENERATED ALWAYS AS IDENTITY,

  nombre VARCHAR2(50) NOT NULL,

  direccion VARCHAR2(100) NOT NULL,
  
  CONSTRAINT pk_sucursal PRIMARY KEY (id_sucursal)
);

CREATE TABLE CARGO (

  id_cargo NUMBER GENERATED ALWAYS AS IDENTITY,

  nombre_cargo VARCHAR2(50) NOT NULL,
  
  CONSTRAINT pk_cargo PRIMARY KEY (id_cargo)
);

-- Ya que la tienda maneja productos en varios idiomas
-- existiran redundacias de los mismos

CREATE TABLE IDIOMA (
  
  id_idioma NUMBER GENERATED ALWAYS AS IDENTITY,
  
  nombre VARCHAR2(50) NOT NULL,
  
  CONSTRAINT pk_idioma PRIMARY KEY (id_idioma)

);

CREATE TABLE PAIS (

    id_pais NUMBER GENERATED ALWAYS AS IDENTITY,
  
    nombre_pais VARCHAR2(100) NOT NULL,
  
    CONSTRAINT pk_pais PRIMARY KEY (id_pais),
  
    CONSTRAINT uq_nombre_pais UNIQUE (nombre_pais)

);

CREATE TABLE CIUDAD (
    id_ciudad NUMBER GENERATED ALWAYS AS IDENTITY,

    nombre_ciudad VARCHAR2(100) NOT NULL,

    id_pais NUMBER NOT NULL,
    
    CONSTRAINT pk_ciudad PRIMARY KEY (id_ciudad),

    CONSTRAINT fk_ciudad_pais FOREIGN KEY (id_pais) REFERENCES PAIS(id_pais)
    
);

-- Esta tabla esta dedicada al armado de boletas

CREATE TABLE CLIENTE (

  id_cliente NUMBER GENERATED ALWAYS AS IDENTITY,
  
  primer_nombre VARCHAR2(50) NOT NULL,

  segundo_nombre VARCHAR2(50),

  primer_apellido VARCHAR2(50) NOT NULL,

-- En algunos paises las personas no tienen 2 apellidos

  segundo_apellido VARCHAR2(50),

  rut VARCHAR2(12) NOT NULL,

-- Los clientes no estan obligados a dar estos datos,
-- ya que no son requeridos para la boleta

  email VARCHAR2(100),

  telefono VARCHAR2(15),

  direccion VARCHAR2(150),

  CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)

);

CREATE TABLE PROVEEDOR (

  id_proveedor NUMBER GENERATED ALWAYS AS IDENTITY,

  nombre_proveedor VARCHAR2(100) NOT NULL,

  telefono VARCHAR2(15) NOT NULL,

  email VARCHAR2(100) NOT NULL,

-- El SII tiene varias leyes que tienen que ver con
-- las transacciones con el extranjero, por lo tanto es obligatorio
-- saber de donde son para facilitar el cumplimiento de estas regulaciones

  id_pais NUMBER NOT NULL,

  id_ciudad NUMBER NOT NULL,

-- Las direcciones en este contexto apenas se repetiran,
-- ya que no manejaremos envios, por ende no tendremos
-- problemas por datos redundantes

  direccion VARCHAR2(100) NOT NULL,

  CONSTRAINT pk_proveedor PRIMARY KEY (id_proveedor),

  CONSTRAINT fk_id_pais FOREIGN KEY (id_pais) REFERENCES PAIS(id_pais),

  CONSTRAINT fk_id_ciudad FOREIGN KEY (id_ciudad) REFERENCES CIUDAD(id_ciudad)

);

-- Categoria se refiere a la naturaleza del producto
-- Ejemplo, Sobres de cartas, Cartas "sueltas", juegos de mesa,
-- libros, figuritas, dados, juegos de dados, etc

CREATE TABLE CATEGORIA (

  id_categoria NUMBER GENERATED ALWAYS AS IDENTITY,

  nombre_categoria VARCHAR2(50) NOT NULL,
  
  descripcion VARCHAR2(255) NOT NULL,
  
  CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)

);


-- Debemos tener atributos de contacto con la editorial, en caso de tener problemas 
-- con las distribuidoras

CREATE TABLE EDITORIAL (

  id_editorial NUMBER GENERATED ALWAYS AS IDENTITY,

  nombre_editorial VARCHAR2(100) NOT NULL,

  telefono VARCHAR2(15),

  email VARCHAR2(100),
  
  CONSTRAINT pk_editorial PRIMARY KEY (id_editorial)

);

-- Debemos tener atributos de contacto con la marca, en caso de tener problemas
-- con las distribuidoras

CREATE TABLE MARCA (

  id_marca NUMBER GENERATED ALWAYS AS IDENTITY,

  nombre_marca VARCHAR2(100) NOT NULL,

  telefono VARCHAR2(15),

  email VARCHAR2(100),

  CONSTRAINT pk_marca PRIMARY KEY (id_marca)

);


CREATE TABLE METODO_PAGO (

  id_metodo_pago NUMBER GENERATED ALWAYS AS IDENTITY,

  nombre VARCHAR2(50) NOT NULL,
  
  CONSTRAINT pk_metodo_pago PRIMARY KEY (id_metodo_pago)

);

-- Evento abarca la reserva de salas, campañas de descuentos y 

CREATE TABLE EVENTO (

  id_evento NUMBER GENERATED ALWAYS AS IDENTITY,

  nombre_evento VARCHAR2(100) NOT NULL,

  tipo_evento VARCHAR2(50) NOT NULL,

  fecha_inicio DATE NOT NULL,
  
  fecha_final DATE NOT NULL,
  
  cupo_maximo NUMBER NOT NULL,

  -- Ciertos eventos estan ligados a una sucursal

  id_sucursal NUMBER,
  
  CONSTRAINT pk_evento PRIMARY KEY (id_evento),

  CONSTRAINT fk_sucursal_evento FOREIGN KEY (id_sucursal) REFERENCES SUCURSAL(id_sucursal)
);

--tablas que tienen llaves foraneas


CREATE TABLE EMPLEADO (

  id_empleado NUMBER GENERATED ALWAYS AS IDENTITY,

  rut VARCHAR2(12) NOT NULL,

  primer_nombre VARCHAR2(50) NOT NULL,

  segundo_nombre VARCHAR2(50),

  primer_apellido VARCHAR2(50),

  segundo_apellido VARCHAR2(50),

-- Este sueldo esta en bruto

  sueldo NUMBER NOT NULL,

  email VARCHAR2(100) NOT NULL,

  direccion VARCHAR2(150) NOT NULL,

  id_cargo NUMBER NOT NULL,

  id_sucursal NUMBER NOT NULL,

  CONSTRAINT pk_empleado PRIMARY KEY (id_empleado),

  CONSTRAINT fk_empleado_cargo FOREIGN KEY (id_cargo) REFERENCES CARGO(id_cargo),

  CONSTRAINT fk_sucursal_empleado FOREIGN KEY (id_sucursal) REFERENCES SUCURSAL(id_sucursal)
);



CREATE TABLE PRODUCTO (

  id_producto NUMBER GENERATED ALWAYS AS IDENTITY,

  sku_producto VARCHAR2(50),

  nombre_producto VARCHAR2(100) NOT NULL,

  min_jugadores NUMBER NOT NULL,

  precio NUMBER NOT NULL,

  id_categoria NUMBER NOT NULL,

  id_proveedor NUMBER NOT NULL,

  id_editorial NUMBER,

  id_marca NUMBER NOT NULL,
  
  id_idioma NUMBER NOT NULL,
  
  CONSTRAINT pk_producto PRIMARY KEY (id_producto),

  CONSTRAINT fk_prod_categoria FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),

  CONSTRAINT fk_prod_proveedor FOREIGN KEY (id_proveedor) REFERENCES PROVEEDOR(id_proveedor),

  CONSTRAINT fk_prod_editorial FOREIGN KEY (id_editorial) REFERENCES EDITORIAL(id_editorial),

  CONSTRAINT fk_prod_marca FOREIGN KEY (id_marca) REFERENCES MARCA(id_marca),
  
  CONSTRAINT fk_idioma_producto FOREIGN KEY (id_idioma) REFERENCES IDIOMA(id_idioma)

);

CREATE TABLE STOCK(
  id_stock NUMBER GENERATED ALWAYS AS IDENTITY,
  
  id_sucursal NUMBER NOT NULL,

  id_producto NUMBER NOT NULL,

  cantidad_producto NUMBER NOT NULL,

  CONSTRAINT pk_stock PRIMARY KEY (id_stock),

  CONSTRAINT fk_stock_sucursal FOREIGN KEY (id_sucursal) REFERENCES SUCURSAL(id_sucursal),

  CONSTRAINT fk_stock_producto FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);


CREATE TABLE VENTA (

  id_venta NUMBER GENERATED ALWAYS AS IDENTITY,

  fecha_venta DATE NOT NULL,

  total NUMBER NOT NULL,

  nro_boleta VARCHAR2(20),

  id_cliente NUMBER NOT NULL,

  id_empleado NUMBER NOT NULL,

  id_metodo_pago NUMBER NOT NULL,

  CONSTRAINT pk_venta PRIMARY KEY (id_venta),

  CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),

  CONSTRAINT fk_venta_empleado FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado),

  CONSTRAINT fk_venta_metodo FOREIGN KEY (id_metodo_pago) REFERENCES METODO_PAGO(id_metodo_pago)

);



CREATE TABLE DETALLE_VENTA (

  id_detalle NUMBER GENERATED ALWAYS AS IDENTITY,

  cantidad NUMBER NOT NULL,

  precio_unitario NUMBER NOT NULL,

  id_venta NUMBER NOT NULL,

  id_producto NUMBER NOT NULL,

  CONSTRAINT pk_detalle_venta PRIMARY KEY (id_detalle),

  CONSTRAINT fk_detalle_venta FOREIGN KEY (id_venta) REFERENCES VENTA(id_venta),

  CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)

);



CREATE TABLE INSCRIPCION (

  id_inscripcion NUMBER GENERATED ALWAYS AS IDENTITY,

  fecha_inscripcion DATE NOT NULL,

  asistio CHAR(1) NOT NULL, -- Puede ser 'S' o 'N'

  id_cliente NUMBER NOT NULL,

  id_evento NUMBER NOT NULL,

  CONSTRAINT pk_inscripcion PRIMARY KEY (id_inscripcion),

  CONSTRAINT fk_inscripcion_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),

  CONSTRAINT fk_inscripcion_evento FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento)

);

--Reseña
CREATE TABLE REVIEW (

  id_review NUMBER GENERATED ALWAYS AS IDENTITY,

  descripcion VARCHAR2(500) NOT NULL,

  id_cliente NUMBER NOT NULL,

  id_producto NUMBER,

  id_evento NUMBER,

  CONSTRAINT pk_review PRIMARY KEY (id_review),

  CONSTRAINT fk_review_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),

  CONSTRAINT fk_review_producto FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto),

  CONSTRAINT fk_review_evento FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento),

  CONSTRAINT chk_review_objetivo CHECK (

    (id_producto IS NOT NULL AND id_evento IS NULL) OR

    (id_producto IS NULL AND id_evento IS NOT NULL)

  )
);