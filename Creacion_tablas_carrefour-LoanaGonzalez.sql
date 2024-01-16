CREATE SCHEMA Proyecto_carrefour;

USE Proyecto_carrefour;

create table Clientes (
ID_Cliente	Int	PRIMARY KEY,
Nombre	Varchar (100),
Apellido	Varchar (100),	
Direccion	Varchar (200),
Numero_de_telefono	Varchar (100),
Correo_electronico	Varchar (100),
Metodo_de_pago	Varchar (100),
Preferencia_de_entrega	Varchar (100),
ID_Producto	Int,
/*FOREIGN  KEY (ID_Producto) REFERENCES Productos */
);
ALTER TABLE Clientes
ADD FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto);

create table Productos (
ID_Producto	Int	PRIMARY KEY,
Nombre_del_producto	Varchar(250),	
Categoria Varchar (100),
Precio	Float (18,5),	
Codigo_de_barras Int,	
Disponibilidad	Varchar(100),
ID_Cliente	Int,
FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);

create table Productos_escaneados (
Nombre_del_producto	Varchar (250),	
Codigo_de_barras	Varchar (50) PRIMARY KEY,	
Metodo_de_escaneo	Varchar (250),	
ID_Cliente	Int,	
FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);

create table Lista_de_compras (
ID_Cliente	Int,
Lista_de_productos	Varchar (200),
Fecha_de_creacion 	Datetime,
Estado	Varchar (200),
ID_Compras	Int	PRIMARY KEY,
FOREIGN KEY  (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);

create table Pedidos_en_linea (
ID_Cliente Int,
Productos	Varchar (200),
Direccion_de_entrega	Varchar (200),
Estado_del_pedido	Varchar (200),
Fecha_hora_del_pedido	Datetime,
ID_Pedido	Int	PRIMARY KEY,
ID_Producto	Int,
Cantidad	Int,
FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)

);

create table Metodo_de_entrega (
Modo_de_entrega	Varchar (50),
Fecha_estimada_de_entrega Datetime,	
ID_Cliente	Int,
ID_metodo_entrega	int	PRIMARY KEY,
FOREIGN KEY  (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);





