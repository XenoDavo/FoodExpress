import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DatosService {

  private apiUrl = 'http://localhost:3000/api/datos';

  constructor(private http: HttpClient) { }

  // Obtener datos
  obtenerDatos(): Observable<any> {
    return this.http.get(this.apiUrl);
  }

  // Insertar datos
  insertarDatos(datos: any): Observable<any> {
    return this.http.post(this.apiUrl, datos);
  }
}