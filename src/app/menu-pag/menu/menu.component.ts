import { Component, OnInit } from '@angular/core';
import { MenuService } from 'src/app/service/menu.service';
import { MenuItem } from 'src/app/models/menu-item.models';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {
  menuItems: MenuItem[] = [];

  // Variables para búsqueda y filtro
  searchTerm: string = '';
  selectedCategory: string = 'todos';

  constructor(private menuService: MenuService) {}

  ngOnInit(): void {
      // Obtener los items del menu desde la API cuando el componente sea iniciado
      this.menuService.getMenuItems().subscribe((items)=>{
        this.menuItems = items;
      });
  }

  // Filtro del menú
  get filteredMenuItems(): MenuItem[]{
    return this.menuItems
    .filter(item => 
      this.selectedCategory === 'todos' || item.categoria === this.selectedCategory)
    .filter(item => item.nombre.toLowerCase().includes(this.searchTerm.toLowerCase()));
  }

}
