require('dontenv').config();
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');


const app = express();
app.use(cors({ origin: 'http://localhost:4200' })); // Configuramos CORS para permitir solicitudes desde Angular
app.use(express.json()); // Permitimos el uso de JSON en los requests


// Configurar la conexión con la base de datos MySQL
const db = mysql.createConnection({
  host: process.env.DB_HOST || 'localhost', // Cambia por el host de tu base de datos MySQL
  user: process.env.DB_USER || 'root', // Cambia por tu usuario de MySQL
  password: process.env.DB_PASSWORD || 'D@vid2005', // Cambia por tu contraseña de MySQL
  database: process.env.DB_NAME ||'foodexpress' // Cambia por el nombre de tu base de datos
});

// Conexión a la base de datos MySQL
db.connect(err => {
  if (err) {
    console.error('Error de conexión con MySQL:', err);
    process.exit(1); // Salir si no hay conexión
  }
  console.log('Conexión con base de datos MySQL establecida');
});


// Ruta para obtener datos de la base de datos
app.get('/api/data', (req, res) => {
  const sql = 'SELECT * FROM tabla_ejemplo'; // Cambia 'tabla_ejemplo' por tu tabla
  db.query(sql, (err, result) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.json(result); // Enviar los datos como JSON al frontend
    }
  });
});


// Ruta para inserción de datos
app.post('/api/datos', (req, res) => {
    const { campo1, campo2 } = req.body;
    if (!campo1 || !campo2) {
        return res.status(400).json({ message: 'Todos los campos son requeridos' });
    }


    const sql = 'INSERT INTO tabla_ejemplo (campo1, campo2) VALUES (?, ?)';
    const values = [campo1, campo2];


    db.query(sql, values, (err, result) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.json({ message: 'Datos insertados correctamente', id: result.insertId });
    });
});



// Servidor en escucha
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`El servidor está corriendo en el puerto ${port}`);
});