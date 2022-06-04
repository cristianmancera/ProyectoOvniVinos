Create schema basededatos_ovni_vinos;
use basededatos_ovni_vinos;

create table administrador
(
	correoAdmin char(30) primary key not null,
	nombreAdmin char(30),
	apellidoAdmin char(30),
	direccionAdmin char(40),
	telefonoAdmin char(12),
	passwordAdmin char(20)
);

create table compra
(
	codigoCompra int primary key not null auto_increment,
	precioCompra double, 
	cantidadCompra int, 
	fechaCompra date,
    correoAdmin char(30) not null
);


create table cliente
( 
	correoCliente char(30) primary key not null,
	nombreCliente char(30),
	apellidoCliente char(30),
	direccionCliente char(40),
	telefonoCliente char(12),
    passwordCliente char(20)
);
create table venta 
(
	codigoVenta int primary key not null auto_increment,
    correoCliente char(30) not null,
    precioVenta double,
    fechaVenta date
);


create table producto 
(
	codigoProducto int primary key not null auto_increment,
	nombreProducto char(25),
	precioProducto double,
	precioProductoProveedor double,
	descripcionProducto varchar(60)
);

create table ventaCliente
(
	idPuente int primary key not null auto_increment,
    codigoVenta int not null,
    codigoProducto int not null,
    cantidadProducto int,
    idRegistroContabilidadDiaria int not null
);
  
create table contabilidadDiaria 
(
	idRegistroContabilidadDiaria int primary key not null auto_increment,
    ventasContabilidadDiaria double,
    egresosContabilidadDiaria double,
	ingresosContabilidadDiaria double,
    idRegistroContabilidadMensual int,
    fecha date
);
create table contabilidadMensual 
(
	idRegistroContabilidadMensual int primary key not null auto_increment,
    ventasContabilidadMensual double, 
    egresosContabilidadMensual double,
	ingresosContabilidadMensual double,
    idRegistroContabilidadAnual int,
    fecha date
);

create table contabilidadAnual
(
	idRegistroContabilidadAnual int primary key not null auto_increment, 
    ventasContabilidadAnual double, 
    egresosContabilidadAnual double, 
    ingresosContabilidadAnual double,
    fecha date
); 

create table inventarioGeneral
(
	idRegistro int primary key not null auto_increment,
    codigoProducto int,
    cantidadProducto int,
    fechaUltimoIngresoInventario date
);
create table inventario_detalles
(
	idDetalles int primary key not null auto_increment,
    idRegistro int,
    codigoProducto int,
    cantidadProducto int
);
create table compraAdmin
(
	idPuente int primary key not null auto_increment,
    codigoCompra int not null,
    codigoProducto int not null,
    cantidadProducto int,
    idRegistroContabilidadDiaria int not null
);
ALTER TABLE `basededatos_ovni_vinos`.`compraadmin` 
ADD INDEX `fk_compraadmin_idregistrocontabilidaddiaria_idx` (`idRegistroContabilidadDiaria` ASC) ;
;
ALTER TABLE `basededatos_ovni_vinos`.`compraadmin` 
ADD CONSTRAINT `fk_compraadmin_idregistrocontabilidaddiaria`
  FOREIGN KEY (`idRegistroContabilidadDiaria`)
  REFERENCES `basededatos_ovni_vinos`.`contabilidaddiaria` (`idRegistroContabilidadDiaria`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `basededatos_ovni_vinos`.`compraadmin` 
ADD INDEX `fk_compraadmin_codigoProducto_idx` (`codigoProducto` ASC) ;
;
ALTER TABLE `basededatos_ovni_vinos`.`compraadmin` 
ADD CONSTRAINT `fk_compraadmin_codigoProducto`
  FOREIGN KEY (`codigoProducto`)
  REFERENCES `basededatos_ovni_vinos`.`producto` (`codigoProducto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `basededatos_ovni_vinos`.`compraadmin` 
ADD INDEX `fk_compraadmin_codigoCompra_idx` (`codigoCompra` ASC) ;
;
ALTER TABLE `basededatos_ovni_vinos`.`compraadmin` 
ADD CONSTRAINT `fk_compraadmin_codigoCompra`
  FOREIGN KEY (`codigoCompra`)
  REFERENCES `basededatos_ovni_vinos`.`compra` (`codigoCompra`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `basededatos_ovni_vinos`.`inventarioGeneral` 
ADD INDEX `fk_inventario_codigoProducto_idx` (`codigoProducto` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`inventarioGeneral` 
ADD CONSTRAINT `fk_inventario_codigoProducto`
  FOREIGN KEY (`codigoProducto`)
  REFERENCES `basededatos_ovni_vinos`.`producto` (`codigoProducto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `basededatos_ovni_vinos`.`ventacliente` 
ADD INDEX `fk_ventaCliente_codigoVenta_idx` (`codigoVenta` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`ventacliente` 
ADD CONSTRAINT `fk_ventaCliente_codigoVenta`
  FOREIGN KEY (`codigoVenta`)
  REFERENCES `basededatos_ovni_vinos`.`venta` (`codigoVenta`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `basededatos_ovni_vinos`.`ventacliente` 
ADD INDEX `fk_ventaCliente_codigoProducto_idx` (`codigoProducto` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`ventacliente` 
ADD CONSTRAINT `fk_ventaCliente_codigoProducto`
  FOREIGN KEY (`codigoProducto`)
  REFERENCES `basededatos_ovni_vinos`.`producto` (`codigoProducto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  ALTER TABLE `basededatos_ovni_vinos`.`venta` 
ADD INDEX `fk_venta_correoCliente_idx` (`correoCliente` ASC);
;

ALTER TABLE `basededatos_ovni_vinos`.`venta` 
ADD CONSTRAINT `fk_venta_correoCliente`
  FOREIGN KEY (`correoCliente`)
  REFERENCES `basededatos_ovni_vinos`.`cliente` (`correoCliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  ALTER TABLE `basededatos_ovni_vinos`.`compra` 
ADD INDEX `fk_compra_correoAdmin_idx` (`correoAdmin` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`compra` 
ADD CONSTRAINT `fk_compra_correoAdmin`
  FOREIGN KEY (`correoAdmin`)
  REFERENCES `basededatos_ovni_vinos`.`administrador` (`correoAdmin`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  ALTER TABLE `basededatos_ovni_vinos`.`inventario_detalles` 
ADD INDEX `fk_inventario_detalles_idregistro_idx` (`idRegistro` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`inventario_detalles` 
ADD CONSTRAINT `fk_inventario_detalles_idregistro`
  FOREIGN KEY (`idRegistro`)
  REFERENCES `basededatos_ovni_vinos`.`inventariogeneral` (`idRegistro`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  ALTER TABLE `basededatos_ovni_vinos`.`ventacliente` 
ADD INDEX `fk_ventaCliente_idRegistroContabilidadDiaria_idx` (`idRegistroContabilidadDiaria` ASC);
;
ALTER TABLE `basededatos_ovni_vinos`.`ventacliente` 
ADD CONSTRAINT `fk_ventaCliente_idRegistroContabilidadDiaria`
  FOREIGN KEY (`idRegistroContabilidadDiaria`)
  REFERENCES `basededatos_ovni_vinos`.`contabilidaddiaria` (`idRegistroContabilidadDiaria`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  ALTER TABLE `basededatos_ovni_vinos`.`contabilidaddiaria` 
ADD INDEX `fk_contabilidaddiaria_idRegistroContabilidadMensual_idx` (`idRegistroContabilidadMensual` ASC) ;
;
ALTER TABLE `basededatos_ovni_vinos`.`contabilidaddiaria` 
ADD CONSTRAINT `fk_contabilidaddiaria_idRegistroContabilidadMensual`
  FOREIGN KEY (`idRegistroContabilidadMensual`)
  REFERENCES `basededatos_ovni_vinos`.`contabilidadmensual` (`idRegistroContabilidadMensual`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
ALTER TABLE `basededatos_ovni_vinos`.`contabilidadmensual` 
ADD INDEX `fk_contabilidadMensual_idRegistroContabilidadAnual_idx` (`idRegistroContabilidadAnual` ASC) ;
;
ALTER TABLE `basededatos_ovni_vinos`.`contabilidadmensual` 
ADD CONSTRAINT `fk_contabilidadMensual_idRegistroContabilidadAnual`
  FOREIGN KEY (`idRegistroContabilidadAnual`)
  REFERENCES `basededatos_ovni_vinos`.`contabilidadanual` (`idRegistroContabilidadAnual`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

