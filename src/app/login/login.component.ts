import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent {
  email: string = ''; // Email de usuario
  password: string = ''; // Contraseña de usuario
  errorMessage: string = ''; // Para almacenar el mensaje de error

  constructor(private router: Router){}

  onSubmit(): void{
    // Verificamos si los campos están vacíos
    if (!this.email || !this.password) {
      this.errorMessage = 'Por favor, rellena todos los campos';
      return;
    }

    // Simulación de datos correctos para probar
    const validUser = { email: 'josedavid.ricard@gmai.com', password: 'D@vid2005'};

    // Validación de credenciales
    if (this.email === validUser.email && this.password === validUser.password) {
      // Inicio de sesión exitoso
      this.errorMessage= ''; // Limpiar el mensaje de error

      // Redirigir a la página de Inicio 'Home'
      this.router.navigate(['/inicio']);
    } else {
      this.errorMessage = 'Email o contraseña son incorrectos.';
    }
  }
}
