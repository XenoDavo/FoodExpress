-- Crear la base de datos
CREATE DATABASE foodexpress;
USE foodexpress;

-- Tabla para usuario restaurante
CREATE TABLE restaurante(
	id_admin INT PRIMARY KEY, 					-- Identificador único del admin
	nombre VARCHAR(100) NOT NULL,               -- Nombre del restaurante
	email VARCHAR(100) UNIQUE NOT NULL,         -- Correo electrónico, debe ser único
	contraseña VARCHAR(255) NOT NULL,           -- Contraseña cifrada
	telefono VARCHAR(20),                       -- Número de telefono del restaurante
	dirección VARCHAR(255)                      -- Dirección del restaurante
);

-- Tabla para almacenar información de los usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único de cada usuario
    nombre VARCHAR(100) NOT NULL,               -- Nombre del usuario
    email VARCHAR(100) UNIQUE NOT NULL,         -- Correo electrónico, debe ser único
    contraseña VARCHAR(255) NOT NULL,           -- Contraseña cifrada
    telefono VARCHAR(20),                       -- Número de telefono del usuario
    dirección VARCHAR(255)                      -- Dirección del usuario
);

-- Tabla de categorias del menu/carta
CREATE TABLE categoria_menu(
	id_ctg INT AUTO_INCREMENT PRIMARY KEY, 		-- Identificador de catregoria
	nombre_ctg VARCHAR(100) NOT NULL UNIQUE 	-- Nombre de categoria
);

INSERT INTO categoria_menu (nombre_ctg)
VALUES
('Pasabocas'),
('Desayunos'),
('Almuerzos'),
('Comida rápida'),
('Bebidas'),
('Postres');

-- Tabla para gestionar el menu del restaurante
CREATE TABLE menu (
    id_plato INT AUTO_INCREMENT PRIMARY KEY,    -- Identificador único de cada plato
    nombre_plato VARCHAR(100) NOT NULL,         -- Nombre del plato
    descripcion TEXT,                           -- descripcion del plato
    precio DECIMAL(10, 2) NOT NULL,             -- Precio del plato
    id_ctg INT, 								-- ID de la categoría
    imagen VARCHAR(255),                        -- URL de la imagen del plato
    FOREIGN KEY (id_ctg) REFERENCES categoria_menu(id_ctg) -- Relacionamos la tabla menu con la tabla categoria_menu a través del 'id_ctg'
);

INSERT INTO menu (nombre_plato, descripcion, precio, categoria, imagen)
VALUES
	-- Pasabocas
    ('Patacones', 'Crujientes porciones de plátano verde frito, acompañadas de hogao o guacamole, perfectas para compartir.', 10000, 1, ''),
    ('Tequeños', 'Deliciosos palitos de queso envueltos en masa y fritos hasta dorarse, ideales para picar en cualquier momento.', 12000, 1, ''),
    ('Ceviche de camarón', 'Camarones frescos marinados en limón, con cebolla morada, cilantro, aguacate y galletas saladas como acompañante.', 15000, 1, ''),
    ('Ceviche de atún', 'Atún fresco marinado en jugo de limón, mezclado con cebolla, cilantro y aguacate, servido con galletas saladas.', 15000, 1, ''),
    ('Nachos con queso', 'Crujientes nachos cubiertos con una deliciosa salsa de queso y acompañados de guacamole y pico de gallo.', 9000, 1, ''),
    ('Bastoncillos de yuca', 'Porciones de yuca frita crujiente, servidas con la salsa de tu preferencia para un toque especial.', 8000, 1, ''),

    -- Desayunos
    ('Pandebonos', 'Suaves y esponjosos panecillos de queso y yuca, ideales para acompañar un café en la mañana.', 6000, 2, ''),
    ('Carimañolas', 'Masa de yuca rellena de carne o pollo, fritas hasta dorarse y perfectas para disfrutar como aperitivo.', 7000, 2, ''),
    ('Buñuelos', 'Deliciosas bolas de masa frita, crujientes por fuera y suaves por dentro, hechas con queso.', 5000, 2, ''),
    ('Arepa con queso', 'Arepa caliente rellena de queso, servida con un delicioso chocolate caliente para un desayuno tradicional.', 7000, 2, ''),
    ('Calentado', 'Sustancioso calentado de arroz y frijoles, acompañado de carne, arepa y huevos al gusto.', 12000, 2, ''),
    ('Huevos revueltos con arepa', 'Huevos revueltos con cebolla y tomate, acompañados de una arepa fresca y queso.', 8000, 2, ''),
    ('Arepa de Choclo', 'Arepa dulce de maíz, perfecta para disfrutar con cuajada fresca.', 6000, 2, ''),
    ('Empanada', 'Empanada dorada rellena de carne, pollo o queso, sazonada con especias para un sabor inigualable.', 5000, 2, ''),
    ('Tamales Tolimenses', 'Exquisitos tamales rellenos de cerdo y pollo, cocidos en hojas de plátano para un sabor auténtico.', 13000, 2, ''),

    -- Almuerzos
    ('Bandeja Paisa', 'Tradicional bandeja con frijoles, arroz, carne molida, chicharrón, huevo frito, aguacate y arepa.', 20000, 3, 'url_imagen_bandeja_paisa.jpg'),
    ('Ajiaco Santafereño', 'Sopa espesa de pollo con tres tipos de papas, alcaparras y crema de leche, servida con aguacate.', 15000, 3, 'url_imagen_ajiaco.jpg'),
    ('Lechona Tolimense', 'Deliciosa lechona asada, rellena de arroz, especias y arvejas, perfecta para un almuerzo contundente.', 18000, 3, 'url_imagen_lechona.jpg'),
    ('Arroz con Pollo', 'Clásico plato de arroz cocido con pollo y verduras, sazonado con especias para un sabor inolvidable.', 12000, 3, 'url_imagen_arroz_con_pollo.jpg'),
    ('Churrasco', 'Corte de carne a la parrilla, acompañado de yuca, ensalada fresca y arepa.', 22000, 3, 'url_imagen_churrasco.jpg'),
    ('Chuleta Valluna', 'Chuleta de cerdo apanada, servida con arroz y patacones, un verdadero placer.', 15000, 3, 'url_imagen_chuleta.jpg'),
    ('Sancocho de Gallina', 'Reconfortante caldo de gallina con yuca, plátano y mazorca, sazonado con hierbas frescas.', 14000, 3, 'url_imagen_sancocho.jpg'),
    ('Mojarra frita', 'Tilapia dorada, servida con arroz, patacones y ensalada fresca.', 13000, 3, 'url_imagen_mojarra.jpg'),

    -- Fast Food
    ('Perro Caliente', 'Delicioso hot dog colombiano adornado con salsas como piña, mayonesa y cebolla.', 8000, 4, 'url_imagen_perro_caliente.jpg'),
    ('Hamburguesa Colombiana', 'Jugosa hamburguesa de carne 100% bovina, con queso, aguacate y salsas típicas.', 15000, 4, 'url_imagen_hamburguesa.jpg'),
    ('Salchipapas', 'Papas fritas acompañadas de trozos de salchichas y queso, servidas con salsas al gusto.', 9000, 4, 'url_imagen_salchipapas.jpg'),
    ('Arepa Rellena', 'Arepa crujiente rellena de carne, pollo o cualquier proteína de tu elección.', 7000, 4, 'url_imagen_arepa_rellena.jpg'),
    ('Sandwich Cubano', 'Sándwich clásico con cerdo asado, jamón, queso suizo y encurtidos, prensado hasta dorar.', 12000, 4, 'url_imagen_sandwich_cubano.jpg'),
    ('Picada', 'Abundante plato para 4 personas que incluye una variedad de carnes, chicharrones, papas fritas y arepas.', 30000, 4, 'url_imagen_picada.jpg'),

    -- Bebidas
    ('Lulada', 'Refrescante bebida a base de lulo, hielo y azúcar, ideal para el clima cálido.', 5000, 5, 'url_imagen_lulada.jpg'),
    ('Jugo de maracuyá', 'Exquisito jugo hecho con maracuyá fresco, perfecto para refrescarte.', 6000, 5, 'url_imagen_jugo_maracuya.jpg'),
    ('Guarapo', 'Bebida fermentada de caña de azúcar, refrescante y ligeramente dulce.', 4000, 5, 'url_imagen_guarapo.jpg'),
    ('Café colombiano', 'Café 100% colombiano, conocido por su sabor y aroma excepcionales, perfecto para acompañar cualquier comida.', 3000, 5, 'url_imagen_cafe.jpg'),
    ('Chocolate caliente', 'Delicioso chocolate caliente acompañado de un pedazo de queso fresco.', 5000, 5, 'url_imagen_chocolate_caliente.jpg'),
    ('Avena fría', 'Bebida refrescante a base de avena, leche, canela y azúcar, ideal para cualquier momento del día.', 6000, 5, 'url_imagen_avena_fria.jpg'),
    ('Refajo', 'Mezcla perfecta de cerveza y gaseosa, ideal para compartir en cualquier ocasión.', 7000, 5, 'url_imagen_refajo.jpg'),
    ('Cerveza Águila 355ml', 'Cerveza lager colombiana, refrescante y de sabor suave.', 4000, 5, 'url_imagen_cerveza_aguila.jpg'),
    ('Cerveza Águila Light 355ml', 'Versión ligera de la cerveza Águila, con menos calorías y un sabor igualmente refrescante.', 4000, 5, 'url_imagen_cerveza_light.jpg'),
    ('Coca-Cola 500 ml y 2 litros', 'La clásica bebida gaseosa, ideal para acompañar tus comidas.', 5000, 5, 'url_imagen_coca_cola.jpg'),
    ('Colombiana 1.5 litros', 'Gaseosa colombiana con sabor a fruta, muy popular en el país.', 6000, 5, 'url_imagen_colombiana.jpg'),
    ('Postobón 500 ml', 'Gaseosa refrescante de sabor afrutado, perfecta para calmar la sed.', 5000, 5, 'url_imagen_postobon.jpg'),

	-- Postres
	('Arroz con Leche', 'Un postre tradicional colombiano hecho con arroz, leche, azúcar y canela.', '5000', '6', ''),
	('Brevas con arequipe', 'Brevas dulces bañadas en arequipe, creando una combinación perfecta de sabores.', '6000', '6', ''),
	('Natilla', 'Un postre tradicional hecho a base leche, azúcar, yemas de huevo y canela.', '5000', '6', ''),
	('Merengón', 'Postre de merengue acompañado de crema blanca, frutas frescas y leche condensada.', '7000', '6', ''),
	('Torta de Tres Leches', 'Esponjosa torta empapada en una mezcla de tres tipos de leche, decorada con crema.', '8000', '6', ''),
	('Cocadas', 'Un dulce típico colombiano hecho con harina de maíz, azúcar, mantequilla y huevos.', '4000', '6', ''),
	('Cholao', 'Un helado fresco colombiano hecho con frutas frescas como cerezas, mango, piña, banano, fresa y guanábana', '6000', '6', ''),
	('Plátano Calado', 'Dulce de plátano maduro, mantequilla, canela y azúcar, acompañado con queso rayado y helado de vainilla', '5000', '6', ''),
	('Cuajada con melao', 'Cuajada fresca servida con melao de caña, un dulce tradicional.', '4000', '6', ''),
	('Postre de Natas', 'Delicioso postre tradicional hecho con capas de crema de leche (natas), azúcar y canela, a menudo acompañado de frutas o galletas.', '6000', '6', '');

-- Tabla para registrar los domicilios
CREATE TABLE domicilios (
    id_domicilio INT AUTO_INCREMENT PRIMARY KEY,   				-- Identificador único de cada domicilio
    id_usuario INT,                             				-- ID del usuario que realiza el domicilio
    fecha_domicilio TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 		-- Fecha y hora del domicilio
    -- estado_domicilio ENUM('En Proceso', 'Enviado', 'Entregado', 'Cancelado') NOT NULL, -- Estado del domicilio
    total DECIMAL(10, 2) NOT NULL,              				-- Total a pagar por el domicilio
    direccion_entrega VARCHAR(255) NOT NULL,             		-- Dirección de entrega (para domicilios a domicilio)
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) 	-- Relación con la tabla Usuarios
);

-- Tabla para registrar los detalles de cada domicilio
CREATE TABLE detalle_domicilio (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,  	-- Identificador único del detalle del domicilio
    id_domicilio INT,                              	-- ID del domicilio asociado
    id_plato INT,                               	-- ID del plato incluido en el domicilio
    cantidad INT NOT NULL,                      	-- Cantidad del plato en el domicilio
    precio_unitario DECIMAL(10, 2) NOT NULL,    	-- Precio por unidad del plato
    sub_total DECIMAL(10, 2) NOT NULL,          	-- Subtotal para este ítem
    FOREIGN KEY (id_domicilio) REFERENCES domicilios(id_domicilio), -- Relación con la tabla domicilios
    FOREIGN KEY (id_plato) REFERENCES menu(id_plato)       			-- Relación con la tabla menu
);

-- Tabla para gestionar los pagos de los domicilios
CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,    	 	-- Identificador único de cada pago
    id_domicilio INT,                              	-- ID del domicilio asociado con el pago
    monto DECIMAL(10, 2) NOT NULL,              	-- Monto total pagado
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha del pago
    método_pago ENUM('Tarjeta', 'Transferencia', 'Efectivo') NOT NULL, 	-- Método de pago
    estado_pago ENUM('Completado', 'Fallido', 'Pendiente') NOT NULL, 	-- Estado del pago
    FOREIGN KEY (id_domicilio) REFERENCES domicilios(id_domicilio) 		-- Relación con la tabla domicilios
);

-- Añadir algunos índices para mejorar la eficiencia en las búsquedas y consultas
CREATE INDEX idx_usuario_email ON usuarios(email); 					-- Índice para búsquedas rápidas por email
CREATE INDEX idx_domicilio_fecha ON domicilios(fecha_domicilio); 	-- Índice para búsquedas rápidas por fecha de domicilio