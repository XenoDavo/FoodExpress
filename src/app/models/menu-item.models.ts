export interface MenuItem{
    nombre: string;
    categoria: 'entradas' | 'platos fuertes' | 'comida rápida' | 'bebidas' | 'postres';
    precio: number;
}