import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './Components/Index/header/header.component';
import { FooterComponent } from './Components/Index/footer/footer.component';
import { RegistroComponent } from './Components/Client/registro/registro.component';
import { InventarioGeneralComponent } from './Components/Admin/inventario-general/inventario-general.component';
import { AgregarExistenciasComponent } from './Components/Admin/agregar-existencias/agregar-existencias.component';
import { EditarDatosComponent } from './Components/Client/editar-datos/editar-datos.component';
import { CatalogoComponent } from './Components/Index/catalogo/catalogo.component';
import { ClientesComponent } from './Components/Admin/clientes/clientes.component';
import { EditarProductoComponent } from './Components/Admin/editar-producto/editar-producto.component';
import { InventarioDetallesComponent } from './Components/Admin/inventario-detalles/inventario-detalles.component';
import { IniciarSesionComponent } from './Components/Index/iniciar-sesion/iniciar-sesion.component';
import { ProductosComponent } from './Components/Admin/productos/productos.component';
import { ContabilidadComponent } from './Components/Admin/contabilidad/contabilidad.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    RegistroComponent,
    InventarioGeneralComponent,
    AgregarExistenciasComponent,
    EditarDatosComponent,
    CatalogoComponent,
    ClientesComponent,
    EditarProductoComponent,
    InventarioDetallesComponent,
    IniciarSesionComponent,
    ProductosComponent,
    ContabilidadComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
