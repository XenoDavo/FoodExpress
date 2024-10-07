import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RegistroService {
  private apiUrl = 'http://tuservidor.com/api/registro'; // Cambia esto a tu URL de API

  constructor(private http: HttpClient) { }

  registrarUsuario(data: any): Observable<any> {
    return this.http.post(this.apiUrl, data);
  }
}
