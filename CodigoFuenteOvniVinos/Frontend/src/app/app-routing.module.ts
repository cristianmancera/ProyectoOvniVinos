import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CatalogoComponent } from './Components/Index/catalogo/catalogo.component';

const routes: Routes = [
  { path: 'catalogo', component: CatalogoComponent },
  { path: '**', pathMatch: 'full', redirectTo: '/catalogo' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
