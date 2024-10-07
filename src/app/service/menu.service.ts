import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { MenuItem } from '../models/menu-item.models'; // Modelo de menú

@Injectable({
  providedIn: 'root'
})
export class MenuService {
  private apiUrl = 'http://localhost:3000/menu'; // La URL de tu API REST

  constructor(private http: HttpClient) { }

  // Obtener todos los platos
  getMenuItems(): Observable<MenuItem[]> {
    return this.http.get<MenuItem[]>(this.apiUrl);
  }

  // Agregar nuevo item al menú
  addMenuItem(item: MenuItem): Observable<MenuItem> {
    return this.http.post<MenuItem>(this.apiUrl, item);
  }

  //Actualizar item del menú
  updateMenuItem(id: number, item: MenuItem): Observable<MenuItem> {
    return this.http.put<MenuItem>(this.apiUrl + id, item);
  }

  // Eliminar item del menú
  deleteMenuItem(id: number): Observable<MenuItem> {
    return this.http.delete<MenuItem>(this.apiUrl + id);
  }

}
