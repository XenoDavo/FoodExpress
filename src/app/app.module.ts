import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';

// Componentes globales
import { NavbarMenuComponent } from './global-comp/navbar-menu/navbar-menu.component';
import { FooterComponent } from './global-comp/footer/footer.component';

// Componentes de página inicio
import { HomeComponent } from './home-pag/home/home.component';
import { VideoContentComponent } from './home-pag/video-content/video-content.component';
import { NosotrosComponent } from './home-pag/nosotros/nosotros.component';
import { FoodRestComponent } from './home-pag/food-rest/food-rest.component';
import { PideYaComponent } from './home-pag/pide-ya/pide-ya.component';
import { ReservaYaComponent } from './home-pag/reserva-ya/reserva-ya.component';
import { ContactameComponent } from './home-pag/contactame/contactame.component';
import { InfoRestComponent } from './home-pag/info-rest/info-rest.component';

// Componentes de páginas de ingreso y registro
import { LoginComponent } from './login/login.component';
import { RegistroComponent } from './registro/registro.component';



// Componentes de página menú
import { MenuComponent } from './menu-pag/menu/menu.component';




// Componentes de página reservas
import { DomiciliosComponent } from './domicilio-pag/domicilios/domicilios.component';




// Componente de página no encontrada
import { PagenotfoundComponent } from './pagenotfound/pagenotfound.component';





const routes: Routes = [

  // Ruta del path de inicio
  { path: 'inicio', component: HomeComponent },
  { path: '', redirectTo: '/inicio', pathMatch: 'full'},

  // Ruta de redirección hacia la página del Menú de la aplicación (Menú y domicilios es igual)
  {path: 'menu', component: MenuComponent},

  // Ruta de redirección hacia la página de Reservas
  {path: 'domicilios', component: DomiciliosComponent},

  // Ruta de redirección a la página Acceso/Login o Inicio de Sesión
  {path: 'acceso', component: LoginComponent},


  // Ruta del path no encontrado
  { path: '**', component: PagenotfoundComponent},

];

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    MenuComponent,
    DomiciliosComponent,
    PagenotfoundComponent,
    RegistroComponent,
    VideoContentComponent,
    NosotrosComponent,
    FoodRestComponent,
    PideYaComponent,
    ReservaYaComponent,
    ContactameComponent,
    InfoRestComponent,
    NavbarMenuComponent,
    FooterComponent,




  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(routes),
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
