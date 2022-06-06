Create schema basededatos_ovni_vinos;
use basededatos_ovni_vinos;

create table administrador
(
	correo_admin char(30) primary key not null,
	nombre_admin char(30),
	apellido_admin char(30),
	direccion_admin char(40),
	telefono_admin char(12),
	password_admin char(20)
);

create table compra
(
	codigo_compra int primary key not null auto_increment,
	precio_compra double, 
	cantidad_compra int, 
	fecha_compra date,
  correo_admin char(30) not null
);


create table cliente
( 
	correo_cliente char(30) primary key not null,
	nombre_cliente char(30),
	apellido_cliente char(30),
	direccion_cliente char(40),
	telefono_cliente char(12),
  password_cliente char(20)
);
create table venta 
(
	codigo_venta int primary key not null auto_increment,
  correo_cliente char(30) not null,
  precio_venta double,
  fecha_venta date
);


create table producto 
(
	codigo_producto int primary key not null auto_increment,
	nombre_producto char(25),
	precio_producto double,
	precio_productoProveedor double,
	descripcion_producto varchar(60)
);

create table venta_cliente
(
	id_puente int primary key not null auto_increment,
  codigo_venta int not null,
  codigo_producto int not null,
  cantidad_producto int,
  id_registro_contabilidad_diaria int not null
);
  
create table contabilidad_diaria 
(
	id_registro_contabilidad_diaria int primary key not null auto_increment,
  ventas_contabilidad_diaria double,
  egresos_contabilidad_diaria double,
	ingresos_contabilidad_diaria double,
  id_registro_contabilidad_mensual int,
  fecha date
);
create table contabilidad_mensual 
(
	id_registro_contabilidad_mensual int primary key not null auto_increment,
  ventas_contabilidad_mensual double, 
  egresos_contabilidad_mensual double,
	ingresos_contabilidad_mensual double,
  id_registro_contabilidad_anual int,
  fecha date
);

create table contabilidad_anual
(
	id_registro_contabilidad_anual int primary key not null auto_increment, 
  ventas_contabilidad_anual double, 
  egresos_contabilidad_anual double, 
  ingresos_contabilidad_anual double,
  fecha date
); 

create table inventario_general
(
	id_registro int primary key not null auto_increment,
  codigo_producto int,
  cantidad_producto int,
  fecha_ultimo_ingreso_inventario date
);
create table inventario_detalles
(
	idDetalles int primary key not null auto_increment,
  id_registro int,
  codigo_producto int,
  cantidad_producto int
);
create table compra_admin
(
	id_puente int primary key not null auto_increment,
  codigo_compra int not null,
  codigo_producto int not null,
  cantidad_producto int,
  id_registro_contabilidad_diaria int not null
);
ALTER TABLE `basededatos_ovni_vinos`.`compra_admin` 
ADD INDEX `fk_compra_admin_id_registro_contabilidad_diaria_idx` (`id_registro_contabilidad_diaria` ASC) ;
;
ALTER TABLE `basededatos_ovni_vinos`.`compra_admin` 
ADD CONSTRAINT `fk_compra_admin_id_registro_contabilidad_diaria`
  FOREIGN KEY (`id_registro_contabilidad_diaria`)
  REFERENCES `basededatos_ovni_vinos`.`contabilidad_diaria` (`id_registro_contabilidad_diaria`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `basededatos_ovni_vinos`.`compra_admin` 
ADD INDEX `fk_compra_admin_codigo_producto_idx` (`codigo_producto` ASC) ;
;
ALTER TABLE `basededatos_ovni_vinos`.`compra_admin` 
ADD CONSTRAINT `fk_compra_admin_codigo_producto`
  FOREIGN KEY (`codigo_producto`)
  REFERENCES `basededatos_ovni_vinos`.`producto` (`codigo_producto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `basededatos_ovni_vinos`.`compra_admin` 
ADD INDEX `fk_compra_admin_codigo_compra_idx` (`codigo_compra` ASC) ;
;
ALTER TABLE `basededatos_ovni_vinos`.`compra_admin` 
ADD CONSTRAINT `fk_compra_admin_codigo_compra`
  FOREIGN KEY (`codigo_compra`)
  REFERENCES `basededatos_ovni_vinos`.`compra` (`codigo_compra`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `basededatos_ovni_vinos`.`inventario_general` 
ADD INDEX `fk_inventario_codigo_producto_idx` (`codigo_producto` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`inventario_general` 
ADD CONSTRAINT `fk_inventario_codigo_producto`
  FOREIGN KEY (`codigo_producto`)
  REFERENCES `basededatos_ovni_vinos`.`producto` (`codigo_producto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `basededatos_ovni_vinos`.`venta_cliente` 
ADD INDEX `fk_venta_cliente_codigo_venta_idx` (`codigo_venta` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`venta_cliente` 
ADD CONSTRAINT `fk_venta_cliente_codigo_venta`
  FOREIGN KEY (`codigo_venta`)
  REFERENCES `basededatos_ovni_vinos`.`venta` (`codigo_venta`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `basededatos_ovni_vinos`.`venta_cliente` 
ADD INDEX `fk_venta_cliente_codigo_producto_idx` (`codigo_producto` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`venta_cliente` 
ADD CONSTRAINT `fk_venta_cliente_codigo_producto`
  FOREIGN KEY (`codigo_producto`)
  REFERENCES `basededatos_ovni_vinos`.`producto` (`codigo_producto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  ALTER TABLE `basededatos_ovni_vinos`.`venta` 
ADD INDEX `fk_venta_correo_cliente_idx` (`correo_cliente` ASC);
;

ALTER TABLE `basededatos_ovni_vinos`.`venta` 
ADD CONSTRAINT `fk_venta_correo_cliente`
  FOREIGN KEY (`correo_cliente`)
  REFERENCES `basededatos_ovni_vinos`.`cliente` (`correo_cliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  ALTER TABLE `basededatos_ovni_vinos`.`compra` 
ADD INDEX `fk_compra_correo_admin_idx` (`correo_admin` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`compra` 
ADD CONSTRAINT `fk_compra_correo_admin`
  FOREIGN KEY (`correo_admin`)
  REFERENCES `basededatos_ovni_vinos`.`administrador` (`correo_admin`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  ALTER TABLE `basededatos_ovni_vinos`.`inventario_detalles` 
ADD INDEX `fk_inventario_detalles_id_registro_idx` (`id_registro` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`inventario_detalles` 
ADD CONSTRAINT `fk_inventario_detalles_id_registro`
  FOREIGN KEY (`id_registro`)
  REFERENCES `basededatos_ovni_vinos`.`inventario_general` (`id_registro`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  ALTER TABLE `basededatos_ovni_vinos`.`venta_cliente` 
ADD INDEX `fk_venta_cliente_id_registro_contabilidad_diaria_idx` (`id_registro_contabilidad_diaria` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`venta_cliente` 
ADD CONSTRAINT `fk_venta_cliente_id_registro_contabilidad_diaria`
  FOREIGN KEY (`id_registro_contabilidad_diaria`)
  REFERENCES `basededatos_ovni_vinos`.`contabilidad_diaria` (`id_registro_contabilidad_diaria`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  ALTER TABLE `basededatos_ovni_vinos`.`contabilidad_diaria` 
ADD INDEX `fk_contabilidad_diaria_id_registro_contabilidad_mensual_idx` (`id_registro_contabilidad_mensual` ASC) ;
;
ALTER TABLE `basededatos_ovni_vinos`.`contabilidad_diaria` 
ADD CONSTRAINT `fk_contabilidad_diaria_id_registro_contabilidad_mensual`
  FOREIGN KEY (`id_registro_contabilidad_mensual`)
  REFERENCES `basededatos_ovni_vinos`.`contabilidad_mensual` (`id_registro_contabilidad_mensual`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
ALTER TABLE `basededatos_ovni_vinos`.`contabilidad_mensual` 
ADD INDEX `fk_contabilidad_mensual_id_registro_contabilidad_anual_idx` (`id_registro_contabilidad_anual` ASC) ;
;
ALTER TABLE `basededatos_ovni_vinos`.`contabilidad_mensual` 
ADD CONSTRAINT `fk_contabilidad_mensual_id_registro_contabilidad_anual`
  FOREIGN KEY (`id_registro_contabilidad_anual`)
  REFERENCES `basededatos_ovni_vinos`.`contabilidad_anual` (`id_registro_contabilidad_anual`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

