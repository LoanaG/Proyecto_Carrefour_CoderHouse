CREATE SCHEMA Proyecto_carrefour;

USE Proyecto_carrefour;

create table Clientes (
ID_Cliente	Int	PRIMARY KEY auto_increment not null ,
Nombre	Varchar (100) not null,
Apellido	Varchar (100) not null,	
Direccion	Varchar (200) not null ,
Numero_de_telefono	Varchar (100) not null ,
Correo_electronico	Varchar (100) not null,
Metodo_de_pago	Varchar (100) not null ,
Preferencia_de_entrega	Varchar (100) not null ,
ID_Producto	Int not null 
);

INSERT INTO Clientes (Nombre,Apellido, Direccion,Numero_de_telefono,Correo_electronico, Metodo_de_pago, Preferencia_de_entrega,Id_Producto)
VALUES 
('Carlos', 'Gutierrez', 'Calle A 123', '555-1234', 'carlos@example.com', 'Tarjeta de crédito', 'Entrega a domicilio', 101),
( 'Ana', 'Rodriguez', 'Avenida B 456', '555-5678', 'ana@example.com', 'Transferencia bancaria', 'Recoger en tienda', 102),
( 'Juan', 'Pérez', 'Carrera C 789', '555-9012', 'juan@example.com', 'Efectivo', 'Entrega a domicilio', 103),
( 'María', 'López', 'Calle D 321', '555-4321', 'maria@example.com', 'Tarjeta de débito', 'Recoger en tienda', 104),
( 'Luis', 'Gómez', 'Avenida E 654', '555-8765', 'luis@example.com', 'PayPal', 'Entrega a domicilio', 105),
( 'Laura', 'Martínez', 'Carrera F 987', '555-2109', 'laura@example.com', 'Cheque', 'Recoger en tienda', 106),
( 'Javier', 'Hernández', 'Calle G 234', '555-3456', 'javier@example.com', 'Transferencia bancaria', 'Entrega a domicilio', 107),
( 'Sofía', 'Díaz', 'Avenida H 567', '555-6789', 'sofia@example.com', 'Efectivo', 'Recoger en tienda', 108),
( 'Diego', 'Fernández', 'Carrera I 890', '555-1230', 'diego@example.com', 'Tarjeta de crédito', 'Entrega a domicilio', 109),
( 'Paula', 'González', 'Calle J 543', '555-0987', 'paula@example.com', 'Cheque', 'Recoger en tienda', 110),
( 'Miguel', 'Ramírez', 'Avenida K 876', '555-5432', 'miguel@example.com', 'PayPal', 'Entrega a domicilio', 111),
( 'Isabel', 'Vega', 'Carrera L 109', '555-9876', 'isabel@example.com', 'Transferencia bancaria', 'Recoger en tienda', 112),
( 'Hugo', 'Torres', 'Calle M 432', '555-2109', 'hugo@example.com', 'Efectivo', 'Entrega a domicilio', 113),
( 'Adriana', 'Paz', 'Avenida N 765', '555-8765', 'adriana@example.com', 'Tarjeta de débito', 'Recoger en tienda', 114),
( 'Martín', 'Cruz', 'Carrera O 098', '555-3210', 'martin@example.com', 'Cheque', 'Entrega a domicilio', 115);

select * from Clientes;
ALTER TABLE Clientes
ADD FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto);

create table Productos (
ID_Producto	Int	PRIMARY KEY not null,
Nombre_del_producto	Varchar(250) not null,	
Categoria Varchar (100) null,
Precio	Float (18,5) not null,	
Codigo_de_barras Int not null,	
Disponibilidad	Varchar(100) null,
ID_Cliente	Int not null,
FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);


INSERT INTO Productos (ID_Producto,Nombre_del_producto,Categoria,Precio,Codigo_de_barras, Disponibilidad, ID_Cliente)
VALUES
(101, 'Laptop Acer', 'Electrónicos', 799.99, 123456789012, 'En stock', 1 ),
(102, 'Camiseta Nike', 'Ropa', 29.99, 987654321098, 'En stock',2 ),
(103, 'Libro "Cien años de soledad"', 'Libros', 19.99, 112233445566, 'Agotado',3),
(104, 'Smartphone Samsung', 'Electrónicos', 499.99, 345678901234, 'En stock' ,4),
(105, 'Zapatos Deportivos Adidas', 'Calzado', 79.99, 567890123456, 'En stock',5),
(106, 'Tablet Lenovo', 'Electrónicos', 199.99, 789012345678, 'En stock' ,6 ),
(107, 'Cámara Canon', 'Electrónicos', 599.99, 987654321012, 'Agotado' ,7),
(108, 'Blusa Floral', 'Ropa', 39.99, 210987654321, 'En stock',8),
(109, 'Videojuego "The Witcher 3"', 'Juegos', 49.99, 432109876543, 'En stock' ,9),
(110, 'Reloj Casio', 'Accesorios', 89.99, 654321098765, 'En stock' , 10),
(111, 'Impresora HP', 'Electrónicos', 129.99, 876543210987, 'Agotado',11),
(112, 'Pantalones Vaqueros', 'Ropa', 59.99, 109876543210, 'En stock',12 ),
(113, 'Teclado Inalámbrico', 'Electrónicos', 29.99, 321098765432, 'En stock',13),
(114, 'Silla de Oficina', 'Muebles', 149.99, 543210987654, 'En stock',14 ),
(115, 'Pelota de Fútbol Adidas', 'Deportes', 19.99, 765432109876, 'En stock',15);



create table Productos_escaneados (
Nombre_del_producto	Varchar (250) not null,	
Codigo_de_barras	Varchar (50) PRIMARY KEY not null,	
Metodo_de_escaneo	Varchar (250) not null,	
ID_Cliente	Int auto_increment not null,	
FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);

INSERT INTO Productos_escaneados (Nombre_del_producto, Codigo_de_barras, Metodo_de_escaneo, ID_Cliente)
VALUES
('Mouse Logitech', '123456789012', 'Código de barras', 1),
('Teclado Inalámbrico HP', '987654321098', 'QR Code', 2),
('Auriculares Sony', '112233445566', 'Código de barras', 3),
('Impresora Epson', '345678901234', 'QR Code', 4),
('Libro "Don Quijote"', '567890123456', 'Código de barras', 5),
('Mochila Portátil', '789012345678', 'QR Code', 6),
('Cámara GoPro', '987654321012', 'Código de barras', 7),
('Pelota de Tenis', '210987654321', 'QR Code', 8),
('Smartwatch Garmin', '432109876543', 'Código de barras', 9),
('Pendrive Kingston', '654321098765', 'QR Code', 10),
('Teclado Gaming', '876543210987', 'Código de barras', 11),
('Calculadora Casio', '109876543210', 'QR Code', 12),
('Lámpara de Escritorio', '321098765432', 'Código de barras', 13),
('Puzzle 1000 Piezas', '543210987654', 'QR Code', 14),
('Teléfono Inalámbrico', '765432109876', 'Código de barras', 15);

create table Lista_de_compras (
ID_Cliente	Int auto_increment,
Lista_de_productos	Varchar (200),
Fecha_de_creacion 	Datetime,
Estado	Varchar (200),
ID_Compras	Int	PRIMARY KEY,
FOREIGN KEY  (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);


INSERT INTO Lista_de_compras (ID_Cliente, Lista_de_productos, Fecha_de_creacion, Estado, ID_Compras)
VALUES
(1, 'Laptop, Mouse, Teclado', '2024-02-14 10:00:00', 'En proceso', 116),
(2, 'Camiseta, Pantalones, Zapatillas', '2024-02-14 10:30:00', 'Entregado', 117),
(3, 'Libro, Bolígrafo, Cuaderno', '2024-02-14 11:00:00', 'En proceso', 118),
(4, 'Smartphone, Funda, Cargador', '2024-02-14 11:30:00', 'Entregado', 119),
(5, 'Zapatos, Camisa, Corbata', '2024-02-14 12:00:00', 'En proceso', 120),
(6, 'Tablet, Auriculares, Estuche', '2024-02-14 12:30:00', 'Entregado', 121),
(7, 'Cámara, Trípode, Tarjeta SD', '2024-02-14 13:00:00', 'En proceso', 122),
(8, 'Blusa, Falda, Zapatos', '2024-02-14 13:30:00', 'Entregado', 123),
(9, 'Videojuego, Consola, Control', '2024-02-14 14:00:00', 'En proceso', 124),
(10, 'Reloj, Pulsera, Collar', '2024-02-14 14:30:00', 'Entregado', 125),
(11, 'Impresora, Papel, Tinta', '2024-02-14 15:00:00', 'En proceso', 126),
(12, 'Jeans, Camiseta, Chaqueta', '2024-02-14 15:30:00', 'Entregado', 127),
(13, 'Teclado, Ratón, Alfombrilla', '2024-02-14 16:00:00', 'En proceso', 128),
(14, 'Silla, Escritorio, Lámpara', '2024-02-14 16:30:00', 'Entregado', 129),
(15, 'Balón, Raqueta, Gafas de sol', '2024-02-14 17:00:00', 'En proceso', 130);


-- Agregar más compras con fechas y estados diferentes manteniendo ID_Cliente del 1 al 15
INSERT INTO Lista_de_compras (ID_Cliente, Lista_de_productos, Fecha_de_creacion, Estado, ID_Compras)
VALUES
    (1, 'Manzanas, Peras, Uvas', '2024-02-27', 'En proceso', 101),
    (2, 'Leche, Pan, Huevos', '2024-02-28', 'Entregado', 102),
    (3, 'Pollo, Arroz, Tomates', '2024-02-29', 'En proceso', 103),
    (4, 'Papas, Zanahorias, Yogur', '2024-03-01', 'Entregado', 104),
    (5, 'Carne, Papel higiénico, Plátanos', '2024-03-02', 'En proceso', 105),
    (6, 'Pescado, Pasta, Salsa', '2024-03-03', 'Entregado', 106),
    (7, 'Hamburguesas, Papas fritas, Refresco', '2024-03-04', 'En proceso', 107),
    (8, 'Ensalada, Pan integral, Agua', '2024-03-05', 'Entregado', 108),
    (9, 'Queso, Jamón, Panecillos', '2024-03-06', 'En proceso', 109),
    (10, 'Lechuga, Frutas enlatadas, Yogur', '2024-03-07', 'Entregado', 110),
    (11, 'Cereal, Leche de almendras, Frutas', '2024-03-08', 'En proceso', 111),
    (12, 'Aceitunas, Queso feta, Hummus', '2024-03-09', 'Entregado', 112),
    (13, 'Pizza, Galletas, Refresco', '2024-03-10', 'En proceso', 113),
    (14, 'Huevos, Tocino, Pan tostado', '2024-03-11', 'Entregado', 114),
    (15, 'Sopa enlatada, Pan de ajo, Helado', '2024-03-12', 'En proceso', 115);

SELECT * FROM Lista_de_compras;


-- Agregar más compras con fechas y estados diferentes manteniendo ID_Cliente del 1 al 15
INSERT INTO Lista_de_compras (ID_Cliente, Lista_De_productos, Fecha_de_creacion, Estado)
VALUES
    (1, 'Manzanas, Peras, Uvas', '2024-02-27', 'En proceso'),
    (2, 'Leche, Pan, Huevos', '2024-02-28', 'Entregado'),
    (3, 'Pollo, Arroz, Tomates', '2024-02-29', 'En proceso'),
    (4, 'Papas, Zanahorias, Yogur', '2024-03-01', 'Entregado'),
    (5, 'Carne, Papel higiénico, Plátanos', '2024-03-02', 'En proceso'),
    (6, 'Pescado, Pasta, Salsa', '2024-03-03', 'Entregado'),
    (7, 'Hamburguesas, Papas fritas, Refresco', '2024-03-04', 'En proceso'),
    (8, 'Ensalada, Pan integral, Agua', '2024-03-05', 'Entregado'),
    (9, 'Queso, Jamón, Panecillos', '2024-03-06', 'En proceso'),
    (10, 'Lechuga, Frutas enlatadas, Yogur', '2024-03-07', 'Entregado'),
    (11, 'Cereal, Leche de almendras, Frutas', '2024-03-08', 'En proceso'),
    (12, 'Aceitunas, Queso feta, Hummus', '2024-03-09', 'Entregado'),
    (13, 'Pizza, Galletas, Refresco', '2024-03-10', 'En proceso'),
    (14, 'Huevos, Tocino, Pan tostado', '2024-03-11', 'Entregado'),
    (15, 'Sopa enlatada, Pan de ajo, Helado', '2024-03-12', 'En proceso');



create table Pedidos_en_linea (
ID_Cliente Int ,
Productos	Varchar (200),
Direccion_de_entrega	Varchar (200),
Estado_del_pedido	Varchar (200),
Fecha_hora_del_pedido	Datetime,
ID_Pedido	Int	PRIMARY KEY,
ID_Producto	Int,
Cantidad	Int,
FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)

);

INSERT INTO Pedidos_en_linea (ID_Cliente, Productos, Direccion_de_entrega, Estado_del_pedido, Fecha_hora_del_pedido, ID_Pedido, ID_Producto, Cantidad)
VALUES
(1, 'Laptop, Mouse, Teclado', 'Calle 123, Ciudad A', 'En proceso', '2024-02-14 10:00:00', 11, 101, 2),
(2, 'Camiseta, Pantalones, Zapatillas', 'Avenida XYZ, Ciudad B', 'Entregado', '2024-02-14 10:30:00',22, 102, 1),
(3, 'Libro, Bolígrafo, Cuaderno', 'Carrera ABC, Ciudad C', 'En proceso', '2024-02-14 11:00:00', 33, 103, 3),
(4, 'Smartphone, Funda, Cargador', 'Avenida 456, Ciudad D', 'Entregado', '2024-02-14 11:30:00', 44,104, 1),
(5, 'Zapatos, Camisa, Corbata', 'Calle 789, Ciudad E', 'En proceso', '2024-02-14 12:00:00', 55, 105, 2),
(6, 'Tablet, Auriculares, Estuche', 'Avenida MNO, Ciudad F', 'Entregado', '2024-02-14 12:30:00', 66,106, 1),
(7, 'Cámara, Trípode, Tarjeta SD', 'Carrera 111, Ciudad G', 'En proceso', '2024-02-14 13:00:00', 77,107, 2),
(8, 'Blusa, Falda, Zapatos', 'Avenida PQR, Ciudad H', 'Entregado', '2024-02-14 13:30:00',88, 108, 1),
(9, 'Videojuego, Consola, Control', 'Calle 222, Ciudad I', 'En proceso', '2024-02-14 14:00:00',99, 109, 3),
(10, 'Reloj, Pulsera, Collar', 'Avenida XYZ, Ciudad J', 'Entregado', '2024-02-14 14:30:00',  76, 110,1),
(11, 'Impresora, Papel, Tinta', 'Carrera 333, Ciudad K', 'En proceso', '2024-02-14 15:00:00', 67, 111, 2),
(12, 'Jeans, Camiseta, Chaqueta', 'Calle 444, Ciudad L', 'Entregado', '2024-02-14 15:30:00' ,59, 112,  1),
(13, 'Teclado, Ratón, Alfombrilla', 'Avenida 555, Ciudad M', 'En proceso', '2024-02-14 16:00:00',46, 113, 23),
(14, 'Silla, Escritorio, Lámpara', 'Carrera 666, Ciudad N', 'Entregado', '2024-02-14 16:30:00', 37,114, 1),
(15, 'Balón, Raqueta, Gafas de sol', 'Calle 777, Ciudad O', 'En proceso', '2024-02-14 17:00:00', 93,115,3);




create table Metodo_de_entrega (
Modo_de_entrega	Varchar (50),
Fecha_estimada_de_entrega Datetime,	
ID_Cliente	Int auto_increment,
ID_metodo_entrega	int	PRIMARY KEY,
FOREIGN KEY  (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);

ALTER TABLE Metodo_de_entrega
DROP primary key;

select * from Metodo_de_entrega;
INSERT INTO Metodo_de_entrega (Modo_de_entrega, Fecha_estimada_de_entrega, ID_Cliente, ID_metodo_entrega)
VALUES
('Express', '2024-02-14 10:00:00', 1, 1),
('Estándar', '2024-02-14 10:30:00', 2, 2),
('Express', '2024-02-14 11:00:00', 3, 2),
('Estándar', '2024-02-14 11:30:00', 4,2),
('Express', '2024-02-14 12:00:00', 5, 1),
('Estándar', '2024-02-14 12:30:00', 6, 1),
('Express', '2024-02-14 13:00:00', 7, 3),
('Estándar', '2024-02-14 13:30:00', 8, 3),
('Express', '2024-02-14 14:00:00', 9, 1),
('Estándar', '2024-02-14 14:30:00', 10, 1),
('Express', '2024-02-14 15:00:00', 11, 1),
('Estándar', '2024-02-14 15:30:00', 12, 2),
('Express', '2024-02-14 16:00:00', 13, 2),
('Estándar', '2024-02-14 16:30:00', 14, 1),
('Express', '2024-02-14 17:00:00', 15, 2);

-- VISTAS .. 

CREATE OR REPLACE VIEW view_productos as
SELECT ID_Producto, 
Disponibilidad, 
ID_Cliente,
COUNT(*) AS Cantidad_agotados
FROM Productos 
WHERE Disponibilidad = 'Agotado'
GROUP BY ID_Producto, 
Disponibilidad, 
ID_Cliente;
-- -- 
CREATE OR REPLACE VIEW view_Pedidos_en_linea as
SELECT 
ID_Cliente, 
Productos, 
Direccion_de_entrega, 
Estado_del_pedido,
ID_Pedido, 
Cantidad,
COUNT(*) AS Count_Estado_del_pedido
FROM Pedidos_en_linea 
WHERE Estado_del_pedido = 'En proceso'
GROUP BY ID_Cliente, 
Productos, 
Direccion_de_entrega, 
Estado_del_pedido,
ID_Pedido, 
Cantidad;


-- En caso de que haya mas de un cliente que haya comprado, traeria para cada cliente la mayor venta --

CREATE OR REPLACE VIEW view_cliente_prod AS
SELECT c.ID_Cliente, c.Nombre, c.Apellido, c.Direccion, c.Numero_de_telefono, c.Correo_electronico, c.Metodo_de_pago,
c.Preferencia_de_entrega, p.Precio, p.Nombre_del_producto, 
MAX(p.Precio) as Maximo_Precio
FROM Clientes c 
JOIN Productos p ON c.ID_Cliente = p.ID_Cliente
GROUP BY c.ID_Cliente, c.Nombre, c.Apellido, c.Direccion, c.Numero_de_telefono, c.Correo_electronico, c.Metodo_de_pago,
c.Preferencia_de_entrega, p.Precio, p.Nombre_del_producto
;

SELECT * FROM view_cliente_prod;

--  -- -- --- - - - - - - - - - - - - - - - - - - - - --  --  -- - - - - - - - - -

CREATE OR REPLACE VIEW view_lista_de_compras_clientes AS
SELECT c.ID_Cliente, c.Nombre, c.Apellido, c.Metodo_de_pago, c.Preferencia_de_entrega,  
lc.Lista_de_productos, lc.Fecha_de_creacion,lc.Estado
FROM  Clientes c
JOIN Lista_de_compras lc ON c.ID_Cliente = lc.ID_Cliente
WHERE lc.Estado = 'En proceso'
GROUP BY 
c.ID_Cliente, c.Nombre, c.Apellido,c.Metodo_de_pago, c.Preferencia_de_entrega,  lc.Lista_de_productos, lc.Fecha_de_creacion,lc.Estado;

SELECT * FROM view_lista_de_compras_clientes;
-- - - - - - 

CREATE OR REPLACE VIEW view_pedidos_clientes AS
SELECT pl.ID_Cliente, pl.Productos, pl.Direccion_de_entrega, pl.Estado_del_pedido, pl.Fecha_hora_del_pedido, 
pl.ID_Pedido, pl.ID_Producto, pl.Cantidad,c.Nombre, c.Apellido, c.Metodo_de_pago, c.Preferencia_de_entrega
FROM Pedidos_en_linea pl
JOIN Clientes c ON c.ID_Cliente = pl.ID_Cliente
WHERE c.Metodo_de_pago IN ('Transferencia bancaria', 'Efectivo')
GROUP BY pl.ID_Cliente, pl.Productos, pl.Direccion_de_entrega, pl.Estado_del_pedido, pl.Fecha_hora_del_pedido, 
pl.ID_Pedido, pl.ID_Producto, pl.Cantidad,c.Nombre, c.Apellido, c.Metodo_de_pago, c.Preferencia_de_entrega;

SELECT * FROM view_pedidos_clientes;

-- FUNCIONES --

-- FUNCION DE CANTIDAD DE CLIENTES -- 

CREATE FUNCTION count_idclientes (ID_Cliente INT)
RETURNS INT DETERMINISTIC
RETURN (SELECT COUNT(*) FROM Clientes WHERE ID_Cliente = ID_Cliente);


SELECT count_idclientes(2);

-- Funcion de cantidad de ventas --

CREATE FUNCTION sum_Cantidadprod (Cantidad INT)
RETURNS INT DETERMINISTIC
RETURN (SELECT SUM(Cantidad) FROM Pedidos_en_linea WHERE Cantidad = Cantidad);


SELECT sum_Cantidadprod(2);

-- Triggers -- 

DELIMITER $$


CREATE TRIGGER tr_Categoria_default_Categoria 
BEFORE INSERT 
ON Productos FOR EACH ROW
BEGIN
    IF NEW.Categoria IS NULL THEN
        SET NEW.Categoria = 'Categoria por default';
    END IF;
END;


INSERT INTO Proyecto_carrefour.Productos (ID_Producto,Nombre_del_producto,Categoria,Precio,Codigo_de_barras, Disponibilidad, ID_Cliente)
VALUES
(116, 'Laptop Lenovo',null, 799.99, 123456789012, 'En stock', 1 );

DELETE FROM Productos
WHERE ID_Producto = 116;

SELECT * FROM Productos;
DROP TRIGGER tr_Categoria_default_Categoria ;


-----
DELIMITER $$

CREATE TRIGGER tr_Modo_de_entrega
BEFORE INSERT 
ON Metodo_de_entrega FOR EACH ROW
BEGIN
    IF NEW.Modo_de_entrega IS NULL THEN
        SET NEW.Modo_de_entrega = 'Express';
    END IF;
END;




