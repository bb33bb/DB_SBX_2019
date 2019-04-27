--Crear base de datos SBX
CREATE DATABASE DB_SBX 
GO
USE DB_SBX
	GO
	CREATE TABLE Empresa (
	Codigo INT IDENTITY(1,1),
	DNI VARCHAR(50) PRIMARY KEY,
	Nombre VARCHAR(200),
	Ciudad VARCHAR(100),
	Direccion VARCHAR(200),
	Telefono VARCHAR(50),
	Celular VARCHAR(50),
	Email VARCHAR(100),
	SitioWeb VARCHAR(100),
	licencia VARCHAR(4000),
	Impresora varchar(100),
	Foto IMAGE,
	ConsecutivoInicial float,
	ConsecutivoFinal float,
	Detalle VARCHAR(300),
	Alerta INT,
	NomDoc VARCHAR(50)
	)
	GO
	INSERT INTO Empresa VALUES('0','N/A','N/A','N/A','0','0','','','','',null,0,10000,'N/A',100,'F')		
	GO
	CREATE TABLE Estado (
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(15) NOT NULL
	)
	GO
	INSERT INTO Estado VALUES('Activo'),('Inactivo')
	GO
	CREATE TABLE Categoria (
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(100) NOT NULL
	)
	GO
	INSERT INTO Categoria VALUES('N/A'),('Celulares'),('Computadores'),('Televisores'),('Videojuegos')
	GO
	CREATE TABLE Marca (
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(200) NOT NULL
	)
	GO
	INSERT INTO Marca VALUES('N/A'),('Xiaomi'),('Samsung'),('Sony'),('HP')
	GO
	CREATE TABLE UnidadMedida (
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(200) NOT NULL
	)
	GO
	INSERT INTO UnidadMedida VALUES('N/A'),('KILOGRAMO'),('LIBRA'),('LITRO'),('GRAMO')
	GO
	CREATE TABLE Ubicacion (
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(200) NOT NULL
	)
	GO
	INSERT INTO Ubicacion VALUES('N/A')
	GO
	CREATE TABLE SalidaPara (
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(200) NOT NULL
	)
	GO
	INSERT INTO SalidaPara VALUES('N/A'),('Venta')
	GO
	CREATE TABLE Proveedor (
	Codigo INT IDENTITY(1,1),
	DNI VARCHAR(50) PRIMARY KEY,
	Nombre VARCHAR(200),
	Ciudad VARCHAR(100),
	Direccion VARCHAR(200),
	Telefono VARCHAR(50),
	Celular VARCHAR(50),
	Email VARCHAR(100),
	SitioWeb VARCHAR(100)
	)
	GO
	INSERT INTO Proveedor VALUES('0','N/A','N/A','N/A','0','0','N/A','N/A')
	GO
	CREATE TABLE Cliente (
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	DNI VARCHAR(50),
	Nombre VARCHAR(200),
	Ciudad VARCHAR(100),
	Direccion VARCHAR(200),
	Telefono VARCHAR(50),
	Celular VARCHAR(50),
	Email VARCHAR(100),
	SitioWeb VARCHAR(100)
	)
	GO
	INSERT INTO Cliente VALUES('0','N/A','N/A','N/A','0','0','N/A','N/A')
	GO
	CREATE TABLE Producto(
	Item INT IDENTITY(1,1) PRIMARY KEY,
	Referencia VARCHAR(20),
	Nombre VARCHAR(200) NOT NULL,
	Descripcion VARCHAR(200),
	IVA FLOAT NOT NULL,
	UnidadMedida INT NOT NULL,
	Medida FLOAT NOT NULL,
	Estado INT NOT NULL,
	Categoria INT NOT NULL,
	Marca INT NOT NULL,
	Proveedor VARCHAR(50),
	ModoVenta VARCHAR(10) NOT NULL,
	Ubicacion INT NOT NULL,
	Salida_para INT NOT NULL,
	Stock_minimo INT NOT NULL,
	Stock_maximo INT NOT NULL,
	Cantidad INT NOT NULL,
	Costo MONEY NOT NULL,
	PrecioVenta MONEY NOT NULL,
	CodigoBarras VARCHAR(100),
	SubCantidad FLOAT NOT NULL,
	ValorSubcantidad MONEY NOT NULL,
	Sobres INT NOT NULL,
	ValorSobre MONEY NOT NULL,
	Foto IMAGE,
	Usuario INT,
	FechaRegistro DATETIME,
	movimiento VARCHAR(100),
	FOREIGN KEY(UnidadMedida) REFERENCES UnidadMedida(Codigo) ON DELETE CASCADE,
	FOREIGN KEY(Estado) REFERENCES Estado(Codigo) ON DELETE CASCADE,
	FOREIGN KEY(Categoria) REFERENCES Categoria(Codigo) ON DELETE CASCADE,
	FOREIGN KEY(Marca) REFERENCES Marca(Codigo) ON DELETE CASCADE,
	FOREIGN KEY(Proveedor) REFERENCES Proveedor(DNI) ON DELETE SET NULL,
	FOREIGN KEY(Ubicacion) REFERENCES Ubicacion(Codigo) ON DELETE CASCADE,
	FOREIGN KEY(Salida_para) REFERENCES SalidaPara(Codigo) ON DELETE CASCADE
	)
	GO
		CREATE TABLE Bit_Kardex(
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	Fecha DATETIME,
	Accion VARCHAR(300),
	CodigoMovimiento VARCHAR(20),
	Item VARCHAR(5),
	Referencia VARCHAR(20),
	CodigoBarras VARCHAR(20),
	Nombre VARCHAR(200),
	Descripcion VARCHAR(300)
	)
	GO
	CREATE TABLE Mensajero (
	Codigo INT IDENTITY(1,1),
	DNI VARCHAR(50) PRIMARY KEY,
	Nombre VARCHAR(200),
	Ciudad VARCHAR(100),
	Direccion VARCHAR(200),
	Telefono VARCHAR(50),
	Celular VARCHAR(50),
	Email VARCHAR(100)
	)
	GO
	INSERT INTO Mensajero VALUES('0','N/A','N/A','N/A','0','0','N/A')
	GO
	CREATE TABLE Domicilio(
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	Fecha DATETIME,
	Celular VARCHAR(50),
	Nombre VARCHAR(100),
	Direccion VARCHAR(300),
	Telefono VARCHAR(50),
	Mensajero VARCHAR(50),
	ValorDomicilio MONEY,
	Cliente INT NULL,
	Estado VARCHAR(15),
	FOREIGN KEY(Cliente) REFERENCES cliente(Codigo) ON DELETE SET NULL,
	FOREIGN KEY(Mensajero) REFERENCES Mensajero(DNI) ON DELETE SET NULL
	)
	GO
	CREATE TABLE SistemaSeparado(
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	Fecha DATETIME,
	Valor MONEY,
	AbonoInicial MONEY,
	PeriodoPago VARCHAR(20),
	Suministrar VARCHAR(20),
	NumCuotas INT,
	ValorCuota MONEY,
	FechaPrimerPago DATE,
	FechaVence DATE,
	Cliente INT NULL,
	Estado VARCHAR(15),
	FOREIGN KEY(Cliente) REFERENCES cliente(Codigo) ON DELETE SET NULL,
	)
	GO
	CREATE TABLE AbonoSistemaSeparado(
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	Fecha DATETIME,
	ValorAbono MONEY,
	SistemaSeparado INT
	FOREIGN KEY(SistemaSeparado) REFERENCES SistemaSeparado(Codigo) ON DELETE CASCADE,
	)
	GO
	CREATE TABLE Venta(
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	Fecha DATETIME,
	NombreDocumento VARCHAR(50),
	ConsecutivoDocumento float,
	Producto INT,
	ModoVenta VARCHAR(10),
	UM VARCHAR(20),
	Cantidad FLOAT,
	Costo MONEY,
	PrecioVenta MONEY,
	descuento FLOAT,
	Efectivo MONEY,
	Tdebito MONEY,
	NumBaucherDebito VARCHAR(30),
	Tcredito MONEY,
	NumBaucherCredito VARCHAR(30),
	Cambio MONEY,
	Total MONEY,
	Proveedor VARCHAR(50),
	Cliente INT,
	Domicilio INT,
	SistemaSeparado INT,
	IVA FLOAT,
	Usuario INT,
	FOREIGN KEY(Proveedor) REFERENCES Proveedor(DNI) ON DELETE SET NULL ,
	FOREIGN KEY(Producto) REFERENCES Producto(item)  ON DELETE CASCADE ,
	FOREIGN KEY(Cliente) REFERENCES cliente(Codigo)  ON DELETE SET NULL,
	FOREIGN KEY(Domicilio) REFERENCES Domicilio(Codigo) ON DELETE CASCADE,
	FOREIGN KEY(SistemaSeparado) REFERENCES SistemaSeparado(Codigo) ON DELETE CASCADE
	)
	GO
	CREATE TABLE Kardex(
	Codigo INT IDENTITY(1,1) PRIMARY KEY,
	CodigoVenta INT,
	Item INT,
	Referencia VARCHAR(20),
	Nombre VARCHAR(200),
	Descripcion VARCHAR(200),
	IVA FLOAT,
	UnidadMedida VARCHAR(200),
	Medida FLOAT,
	Estado INT,
	Categoria VARCHAR(200),
	Marca VARCHAR(200),
	DNIproveedor VARCHAR(50),
	Proveedor VARCHAR(200),
	ModoVenta VARCHAR(10),
	Ubicacion VARCHAR(200) NOT NULL,
	Salida_para VARCHAR(200) NOT NULL,
	Stock_minimo INT NOT NULL,
	Stock_maximo INT NOT NULL,
	Cantidad FLOAT NOT NULL,
	Costo MONEY,
	PrecioVenta MONEY,
	CodigoBarras VARCHAR(100),
	SubCantidad FLOAT,
	ValorSubcantidad MONEY,
	Sobres INT,
	ValorSobre MONEY,
	Usuario INT,
	FechaRegistro DATETIME,
	Accion VARCHAR(100),
	movimiento VARCHAR(100),
	UM VARCHAR(20),
	FOREIGN KEY(Item) REFERENCES Producto(Item) ON DELETE CASCADE
	)
	GO
----Usuarios y roles
CREATE TABLE Rol(
Codigo INT PRIMARY KEY,
Nombre VARCHAR(50),
DescripcionRol VARCHAR(200)
)
GO
INSERT INTO Rol VALUES(1,'Administrador','Control total')
GO
CREATE TABLE Modulo(
codigo INT PRIMARY KEY,
Nombre VARCHAR(20),
DescripcionModulo VARCHAR(200)
)
GO
INSERT INTO Modulo VALUES
(1,'VENTA',''),
(2,'PRODUCTO',''),
(3,'INVENTARIO',''),
(4,'CLIENTE',''),
(5,'PROVEEDOR',''),
(6,'EMPRESA',''),
(7,'DOMICILIO',''),
(8,'SEPARADO',''),
(9,'CAJA',''),
(10,'GASTOS',''),
(11,'REPORTES',''),
(12,'AJUSTES','')
GO
CREATE TABLE Permiso(
codigo INT PRIMARY KEY,
Nombre VARCHAR(20),
DescripcionPermiso VARCHAR(200)
)
GO
INSERT INTO Permiso VALUES
(1,'separado',''),
(2,'domicilio',''),
(3,'descuento',''),
(4,'quitar_todo',''),
(5,'quitar_uno',''),
(6,'consultas',''),
(7,'agregar_producto',''),
(8,'agregar_cliente',''),
(9,'exportar_excel',''),
(10,'editar',''),
(11,'eliminar',''),
(12,'guardar',''),
(13,'limpiar',''),
(14,'caracteristicas',''),
(15,'agregar_proveedor',''),
(16,'agregar_mensajero',''),
(17,'pagos',''),
(18,'historial','')
GO
CREATE TABLE Modulo_permiso(
Codigo INT IDENTITY(1,1) PRIMARY KEY,
Modulo INT,
Permiso INT
)
GO
INSERT INTO Modulo_permiso VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),

(2,9),
(2,10),
(2,11),

(3,12),
(3,6),
(3,14),
(3,13),
(3,15),

(4,12),
(4,13),
(4,10),
(4,11),
(4,9),

(5,12),
(5,6),
(5,10),
(5,11),
(5,9),

(6,12),
(6,6),

(7,9),
(7,11),
(7,12),
(7,16),

(8,9),
(8,11),
(8,17),
(8,18),

(9,6),
(10,6),
(11,6),
(12,6)
GO
CREATE TABLE Rol_Modulo_Permiso(
Rol INT,
Modulo_permiso INT,
FOREIGN KEY(Rol) REFERENCES Rol(codigo),
FOREIGN KEY(Modulo_permiso) REFERENCES Modulo_permiso(codigo)
)
GO
INSERT INTO Rol_Modulo_Permiso VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,13),
(1,14),
(1,15),
(1,16),
(1,17),
(1,18),
(1,19),
(1,20),
(1,21),
(1,22),
(1,23),
(1,24),
(1,25),
(1,26),
(1,27),
(1,28),
(1,29),
(1,30),
(1,31),
(1,32),
(1,33),
(1,34),
(1,35),
(1,36),
(1,37),
(1,38),
(1,39),
(1,40)
GO
CREATE TABLE Usuario(
Codigo INT IDENTITY(1,1) PRIMARY KEY,
DNI VARCHAR(20),
Nombres VARCHAR(50),
Apellidos VARCHAR(50),
Celular VARCHAR(10),
Telefono VARCHAR(10),
Email VARCHAR(100),
FechaNacimiento DATE,
NombreUsuario VARCHAR(50) NOT NULL,
Contrasena VARCHAR(50) NOT NULL,
Estado VARCHAR(10) NOT NULL,
Rol INT,
FOREIGN KEY(Rol) REFERENCES Rol(codigo)
)
GO
INSERT INTO Usuario VALUES
('1','Admin','','','','',null,'Admin',ENCRYPTBYPASSPHRASE('password','admin'),'Activo',1)
----Fin Usuarios y roles
GO

CREATE TABLE Caja(
Codigo INT IDENTITY(1,1) PRIMARY KEY,
Valor MONEY,
TipoOperacion VARCHAR(20),
Usuario INT,
FechaRegistro DATETIME,
Codigo_Ultimo_cierre INT,
Codigo_Ultima_venta INT,
CodigoCaja INT
)
GO
CREATE TABLE Gastos(
codigo INT IDENTITY(1,1) PRIMARY KEY,
Nombre	VARCHAR(50),
Descripcion  VARCHAR(200)
)
GO
CREATE TABLE GastosM(
codigo INT IDENTITY(1,1) PRIMARY KEY,
FechaRegistro DATETIME,
Gasto INT,
Valor MONEY,
FOREIGN KEY(Gasto) REFERENCES Gastos(codigo)
)
	GO
	CREATE TRIGGER tr_Venta_insert on Venta
	FOR INSERT
	AS
	BEGIN
	INSERT INTO Kardex (CodigoVenta,Item,Referencia,Nombre,Descripcion,IVA,UnidadMedida,Medida,Estado,Categoria,Marca,DNIproveedor,Proveedor,
	ModoVenta,Cantidad,Costo,PrecioVenta,CodigoBarras,SubCantidad,ValorSubcantidad,Sobres,ValorSobre,Usuario,FechaRegistro,
	Accion,movimiento,Ubicacion,Salida_para,Stock_minimo,Stock_maximo,UM)
	SELECT v.Codigo,p.Item,p.Referencia,p.Nombre,p.Descripcion,v.IVA,um.Nombre,p.Medida,0,ct.Nombre,
	m.Nombre,pr.DNI,pr.Nombre,p.ModoVenta,v.Cantidad,v.Costo,v.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,v.Usuario,SYSDATETIME(),'INSERT-VENTA','Salida -',
	p.Ubicacion,p.Salida_para,p.Stock_minimo,p.Stock_maximo,v.UM
	FROM Venta v
	INNER JOIN Producto p ON v.Producto = p.Item
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Proveedor pr ON pr.DNI = p.Proveedor
	WHERE v.Codigo = (SELECT MAX(Codigo) FROM Venta)
	END
	GO
	CREATE TRIGGER tr_reset_item on Producto
	after delete
	AS
	BEGIN
		DECLARE @max INT;  
	SELECT @max = ISNULL(max(Item),0) FROM Producto;  
	DBCC checkident(Producto,reseed,@max)
	END
	GO
	CREATE TRIGGER tr_kardex_delete on Kardex
		AFTER DELETE
	AS
	BEGIN
	INSERT INTO Bit_kardex (Fecha,Accion,CodigoMovimiento,Item,Referencia,Nombre,Descripcion)
		SELECT
		SYSDATETIME(),'Eliminacion movimiento',d.Codigo,d.Item,d.Referencia,d.Nombre,d.Descripcion
		FROM deleted d		
	END
	GO
	CREATE TRIGGER tr_Producto_insert on Producto
	FOR INSERT
	AS
	BEGIN
	INSERT INTO Kardex (Item,Referencia,Nombre,Descripcion,IVA,UnidadMedida,Medida,Estado,Categoria,Marca,DNIproveedor,Proveedor,
	ModoVenta,Cantidad,Costo,PrecioVenta,CodigoBarras,SubCantidad,ValorSubcantidad,Sobres,ValorSobre,Usuario,FechaRegistro,
	Accion,movimiento,Ubicacion,Salida_para,Stock_minimo,Stock_maximo,UM)
	SELECT p.Item,p.Referencia,p.Nombre,P.Descripcion,p.IVA,um.Nombre,p.Medida,p.Estado,ct.Nombre,m.Nombre,pr.DNI,pr.Nombre,
	p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,
	p.Usuario,SYSDATETIME(),'INSERT-INVENTARIO',p.movimiento,p.Ubicacion,p.Salida_para,p.Stock_minimo,p.Stock_maximo,
	CASE WHEN ModoVenta = 'Unidad' THEN
		'UND'
		ELSE
		CASE WHEN ModoVenta = 'Pesaje' THEN
		'Bulto'
		ELSE
		'Caja'
		END
	END
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Proveedor pr ON pr.DNI = p.Proveedor
	WHERE p.FechaRegistro = (SELECT MAX(FechaRegistro) FROM Producto)
	END
	GO
	CREATE TRIGGER tr_Producto_update on Producto
	FOR UPDATE
	AS
	BEGIN
	INSERT INTO Kardex (Item,Referencia,Nombre,Descripcion,IVA,UnidadMedida,Medida,Estado,Categoria,Marca,DNIproveedor,Proveedor,
	ModoVenta,Cantidad,Costo,PrecioVenta,CodigoBarras,SubCantidad,ValorSubcantidad,Sobres,ValorSobre,Usuario,FechaRegistro
	,Accion,movimiento,Ubicacion,Salida_para,Stock_minimo,Stock_maximo)
	SELECT p.Item,p.Referencia,p.Nombre,P.Descripcion,p.IVA,um.Nombre,p.Medida,p.Estado,ct.Nombre,m.Nombre,pr.DNI,pr.Nombre,
	p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,
	p.Usuario,SYSDATETIME(),'UPDATE-INVENTARIO',p.movimiento,p.Ubicacion,p.Salida_para,p.Stock_minimo,p.Stock_maximo
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Proveedor pr ON pr.DNI = p.Proveedor
	WHERE p.FechaRegistro = (SELECT MAX(FechaRegistro) FROM Producto)
	END
	GO
	--Creacion de procedimientos almacenados
	CREATE PROCEDURE sp_verificar_login
	@Usuarios VARCHAR(50),
	@Contrasenas VARCHAR(50)
	AS
	DECLARE
	@PassEncritado VARCHAR(300),
	@PassDecifrado VARCHAR(300)

	SET @PassEncritado = (SELECT Contrasena FROM Usuario WHERE NombreUsuario = @Usuarios)
	SET	@PassDecifrado = DECRYPTBYPASSPHRASE('password', @PassEncritado)
	IF(@PassDecifrado = @Contrasenas)
	SELECT Codigo,Nombres+' '+Apellidos Nombre,NombreUsuario FROM Usuario WHERE NombreUsuario = @Usuarios
	ELSE
	SELECT Codigo,Nombres+' '+Apellidos Nombre,NombreUsuario FROM Usuario WHERE Codigo = 0
	GO
	CREATE PROC sp_consultar_productos_kardex
@v_tipo_busqueda AS VARCHAR(MAX),
@v_buscar AS VARCHAR(MAX)
AS
IF @v_tipo_busqueda = 'Contiene'
BEGIN
SELECT k0.Item,
(SELECT k1.Referencia FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Referencia,
(SELECT k1.CodigoBarras FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) CodigoBarras,
(SELECT k1.Nombre FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Nombre,
(SELECT k1.Descripcion FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Descripcion,
ModoVenta,
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje'),0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi'),0)
END
END
Stock,

SubCantidad 
*
(
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje'),0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi'),0)
END
END
) 
StockSubCantidad,

Sobres
*
(
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje'),0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi'),0)
END
END
) 
StockSobres,
(SELECT k1.Costo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Costo,
(SELECT k1.PrecioVenta FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) PrecioVenta,
(ISNULL((SELECT k1.Costo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item))
/
CASE WHEN ModoVenta != 'Unidad' THEN
(SELECT k1.SubCantidad FROM Kardex k1 WHERE (k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) AND k1.ModoVenta != 'Unidad')
END,0))
CostoSubCantidad,
(SELECT k1.ValorSubcantidad FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) ValorSubcantidad,
(ISNULL((SELECT k1.Costo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item))
/
CASE WHEN ModoVenta = 'Multi' THEN
(SELECT k1.Sobres FROM Kardex k1 WHERE (k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) AND k1.ModoVenta = 'Multi')
END,0))
CostoSobre,
(SELECT k1.ValorSobre FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) ValorSobre,
(SELECT k1.IVA FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) IVA,
(SELECT k1.UnidadMedida FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) UnidadMedida,
(SELECT k1.Categoria FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Categoria,
(SELECT k1.Marca FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Marca,
(SELECT ub.Nombre FROM Kardex k1 INNER JOIN Ubicacion ub ON ub.Codigo = k1.Ubicacion WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Ubicacion,
(SELECT slp.Nombre FROM Kardex k1 INNER JOIN SalidaPara slp ON slp.Codigo = k1.Salida_para WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Salida_para,
(SELECT k1.DNIproveedor FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) DNIproveedor,
(SELECT k1.Proveedor FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Proveedor,
(SELECT k1.Stock_minimo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Stock_minimo,
(SELECT k1.Stock_maximo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Stock_maximo
FROM Kardex k0
WHERE K0.Item LIKE @v_buscar+'%' OR K0.Referencia LIKE @v_buscar+'%' OR K0.CodigoBarras LIKE @v_buscar+'%' OR K0.Nombre LIKE @v_buscar+'%'
GROUP BY Item,ModoVenta,SubCantidad,Sobres
ORDER BY Item
END
ELSE
BEGIN
SELECT k0.Item,
(SELECT k1.Referencia FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Referencia,
(SELECT k1.CodigoBarras FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) CodigoBarras,
(SELECT k1.Nombre FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Nombre,
(SELECT k1.Descripcion FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Descripcion,
ModoVenta,
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje'),0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi'),0)
END
END
Stock,

SubCantidad 
*
(
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje'),0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi'),0)
END
END
) 
StockSubCantidad,

Sobres
*
(
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje'),0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi'),0)
END
END
) 
StockSobres,
(SELECT k1.Costo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Costo,
(SELECT k1.PrecioVenta FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) PrecioVenta,
(ISNULL((SELECT k1.Costo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item))
/
CASE WHEN ModoVenta != 'Unidad' THEN
(SELECT k1.SubCantidad FROM Kardex k1 WHERE (k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) AND k1.ModoVenta != 'Unidad')
END,0))
CostoSubCantidad,
(SELECT k1.ValorSubcantidad FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) ValorSubcantidad,
(ISNULL((SELECT k1.Costo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item))
/
CASE WHEN ModoVenta = 'Multi' THEN
(SELECT k1.Sobres FROM Kardex k1 WHERE (k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) AND k1.ModoVenta = 'Multi')
END,0))
CostoSobre,
(SELECT k1.ValorSobre FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) ValorSobre,
(SELECT k1.IVA FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) IVA,
(SELECT k1.UnidadMedida FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) UnidadMedida,
(SELECT k1.Categoria FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Categoria,
(SELECT k1.Marca FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Marca,
(SELECT ub.Nombre FROM Kardex k1 INNER JOIN Ubicacion ub ON ub.Codigo = k1.Ubicacion WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Ubicacion,
(SELECT slp.Nombre FROM Kardex k1 INNER JOIN SalidaPara slp ON slp.Codigo = k1.Salida_para WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Salida_para,
(SELECT k1.DNIproveedor FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) DNIproveedor,
(SELECT k1.Proveedor FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Proveedor,
(SELECT k1.Stock_minimo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Stock_minimo,
(SELECT k1.Stock_maximo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Stock_maximo
FROM Kardex k0
WHERE K0.Item = CASE WHEN  ISNUMERIC(@v_buscar) = 1 THEN @v_buscar ELSE 0 END 
OR K0.Referencia = @v_buscar OR K0.CodigoBarras = @v_buscar OR K0.Nombre = @v_buscar
GROUP BY Item,ModoVenta,SubCantidad,Sobres
ORDER BY Item
END
	GO
	CREATE PROC [dbo].[sp_consultar_Ventas]
		@v_buscar VARCHAR(300),
	@v_tipo_busqueda AS VARCHAR(20),
	@FechaIni AS DATE,
	@FechaFin AS DATE
	AS
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
	SELECT v.Codigo,v.Fecha,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura,
	p.Item,p.Referencia,p.CodigoBarras,v.ModoVenta,v.UM,v.Cantidad,v.Costo,v.PrecioVenta,
	v.descuento,(v.PrecioVenta * (v.descuento/100)) ValorDescuento,v.Efectivo,v.Tdebito,
	v.NumBaucherDebito,v.Tcredito,v.NumBaucherCredito,v.Cambio,v.Total,pr.DNI+'-'+pr.Nombre Proveedor,
	c.DNI +'-'+c.Nombre Cliente,CONCAT(d.Estado,' - ',d.Codigo,' - ',d.Celular,' - ',
	d.Nombre,' - ',d.Direccion,' - ',msj.DNI,' - ',msj.Nombre,' - ',d.ValorDomicilio) Domicilio, 
	CONCAT(sp.Estado,' - ',sp.Codigo,' - ',c2.DNI,' - ',c2.Nombre) SistemaSeparado
	FROM Venta v
	INNER JOIN Producto p ON p.Item = v.Producto
	INNER JOIN Proveedor pr ON pr.DNI = v.Proveedor
	INNER JOIN Cliente c ON c.Codigo = v.Cliente
	LEFT JOIN Domicilio d ON d.Codigo = v.Domicilio
	LEFT JOIN SistemaSeparado sp ON sp.Codigo = v.SistemaSeparado
	LEFT JOIN Cliente c2 ON c2.Codigo = sp.Cliente
	LEFT JOIN Mensajero msj ON msj.Codigo = d.Mensajero
	WHERE ((p.Item  LIKE @v_buscar+'%' OR p.Referencia  LIKE @v_buscar+'%' OR p.CodigoBarras  LIKE @v_buscar+'%') 
	OR CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) LIKE @v_buscar+'%')
	AND CONVERT(date,v.Fecha) BETWEEN @FechaIni AND @FechaFin
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'Exactamente')
	BEGIN
	SELECT v.Codigo,v.Fecha,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura,
	p.Item,p.Referencia,p.CodigoBarras,v.ModoVenta,v.UM,v.Cantidad,v.Costo,v.PrecioVenta,
	v.descuento,(v.PrecioVenta * (v.descuento/100)) ValorDescuento,v.Efectivo,v.Tdebito,
	v.NumBaucherDebito,v.Tcredito,v.NumBaucherCredito,v.Cambio,v.Total,pr.DNI+'-'+pr.Nombre Proveedor,
	c.DNI +'-'+c.Nombre Cliente,CONCAT(d.Estado,' - ',d.Codigo,' - ',d.Celular,' - ',
	d.Nombre,' - ',d.Direccion,' - ',msj.DNI,' - ',msj.Nombre,' - ',d.ValorDomicilio) Domicilio, 
	CONCAT(sp.Estado,' - ',sp.Codigo,' - ',c2.DNI,' - ',c2.Nombre) SistemaSeparado
	FROM Venta v
	INNER JOIN Producto p ON p.Item = v.Producto
	INNER JOIN Proveedor pr ON pr.DNI = v.Proveedor
	INNER JOIN Cliente c ON c.Codigo = v.Cliente
	LEFT JOIN Domicilio d ON d.Codigo = v.Domicilio
	LEFT JOIN SistemaSeparado sp ON sp.Codigo = v.SistemaSeparado
	LEFT JOIN Cliente c2 ON c2.Codigo = sp.Cliente
	LEFT JOIN Mensajero msj ON msj.Codigo = d.Mensajero
    WHERE ((p.Item = CASE WHEN ISNUMERIC(@v_buscar) = 1 THEN @v_buscar ELSE 0 END OR p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar) 
	OR CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) = @v_buscar)
	AND CONVERT(date,v.Fecha) BETWEEN @FechaIni AND @FechaFin
	END
	END
	GO
	CREATE PROC sp_consultar_separados
	@v_buscar VARCHAR(300),
	@v_tipo_busqueda AS VARCHAR(20),
	@FechaIni AS DATE,
	@FechaFin AS DATE
	AS
	IF(@v_tipo_busqueda = 'max codigo')
	BEGIN
	SELECT MAX(Codigo) codigo FROM SistemaSeparado
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
	SELECT sp.Codigo,sp.Estado,sp.Fecha,CONCAT(c.DNI,' - ',c.Nombre) Cliente,
	CONCAT(p.Item,' - ',p.Referencia,' - ',p.CodigoBarras,' - ',p.Nombre) Producto,
	v.Cantidad,v.Costo,v.PrecioVenta,sp.AbonoInicial,sp.NumCuotas,sp.ValorCuota,
	sp.PeriodoPago,sp.Valor,sp.FechaPrimerPago,sp.FechaVence,
	(SELECT ISNULL(SUM(ValorAbono),0) FROM AbonoSistemaSeparado asp WHERE asp.SistemaSeparado = sp.Codigo) ValorAbono,
	(SELECT MAX(Fecha) FROM AbonoSistemaSeparado WHERE SistemaSeparado = sp.Codigo) FechaAbono,
	CONCAT(v.NombreDocumento,' - ',v.ConsecutivoDocumento) Factura
	 FROM Venta v
	INNER JOIN SistemaSeparado sp ON sp.Codigo = v.SistemaSeparado
	INNER JOIN Cliente c ON c.Codigo = sp.Cliente
	INNER JOIN Producto p ON p.Item = v.Producto
	WHERE (sp.Codigo LIKE @v_buscar+'%' OR (c.DNI  LIKE @v_buscar+'%' OR c.Nombre  LIKE @v_buscar+'%') OR 
	(p.Item  LIKE @v_buscar+'%' OR p.Referencia  LIKE @v_buscar+'%' OR p.CodigoBarras  LIKE @v_buscar+'%' OR p.Nombre LIKE @v_buscar+'%')) 
	AND CONVERT(date,sp.Fecha) BETWEEN @FechaIni AND @FechaFin
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'validacion')
	BEGIN
	SELECT * FROM SistemaSeparado where Codigo = @v_buscar OR Cliente = @v_buscar
	END
	ELSE
	BEGIN
	SELECT sp.Codigo,sp.Estado,sp.Fecha,CONCAT(c.DNI,' - ',c.Nombre) Cliente,
	CONCAT(p.Item,' - ',p.Referencia,' - ',p.CodigoBarras,' - ',p.Nombre) Producto,
	v.Cantidad,v.Costo,v.PrecioVenta,sp.AbonoInicial,sp.NumCuotas,sp.ValorCuota,
	sp.PeriodoPago,sp.Valor,sp.FechaPrimerPago,sp.FechaVence,
	(SELECT ISNULL(SUM(ValorAbono),0) FROM AbonoSistemaSeparado asp WHERE asp.SistemaSeparado = sp.Codigo) ValorAbono,
	(SELECT MAX(Fecha) FROM AbonoSistemaSeparado WHERE SistemaSeparado = sp.Codigo) FechaAbono,
	CONCAT(v.NombreDocumento,' - ',v.ConsecutivoDocumento) Factura
	 FROM Venta v
	INNER JOIN SistemaSeparado sp ON sp.Codigo = v.SistemaSeparado
	INNER JOIN Cliente c ON c.Codigo = sp.Cliente
	INNER JOIN Producto p ON p.Item = v.Producto
	LEFT JOIN AbonoSistemaSeparado ab ON ab.SistemaSeparado = sp.Codigo
	WHERE (sp.Codigo =  CASE WHEN ISNUMERIC(@v_buscar) = 1 THEN @v_buscar ELSE 0 END OR (c.DNI = @v_buscar OR c.Nombre = @v_buscar) OR 
	(p.Item =  CASE WHEN ISNUMERIC(@v_buscar) = 1 THEN @v_buscar ELSE 0 END OR p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar OR p.Nombre = @v_buscar)) 
	AND CONVERT(date,sp.Fecha) BETWEEN @FechaIni AND @FechaFin
	END
	END
	END
	GO
	CREATE PROC sp_consultar_domicilio
		@v_buscar VARCHAR(300),
	@v_tipo_busqueda AS VARCHAR(20),
	@FechaIni AS DATE,
	@FechaFin AS DATE
	AS
	IF(@v_tipo_busqueda = 'max codigo')
	BEGIN
	SELECT MAX(Codigo) codigo FROM Domicilio
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
	SELECT v.Domicilio,d.Fecha,d.Estado,d.Celular,c.DNI,d.Nombre,d.Direccion,
	m.DNI +'-'+m.Nombre Mensajero,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura,
	p.Item,p.Referencia,p.CodigoBarras,p.Nombre NombreProducto,v.Cantidad,v.ModoVenta,v.UM,v.PrecioVenta,
	v.descuento,v.PrecioVenta * (v.descuento/100) ValorDescuento,d.ValorDomicilio,v.Total
	FROM Venta v
	INNER JOIN Domicilio d ON d.Codigo = v.Domicilio
	INNER JOIN Cliente c ON c.Codigo = d.Cliente
	INNER JOIN Mensajero m ON m.DNI = d.Mensajero
	INNER JOIN Producto p ON p.Item = v.Producto
	WHERE (d.Codigo LIKE @v_buscar+'%' OR d.Celular LIKE @v_buscar+'%' OR c.DNI LIKE @v_buscar+'%'
	OR m.DNI LIKE SUBSTRING(@v_buscar,1,5)+'%' OR (p.Item LIKE SUBSTRING(@v_buscar,1,5)+'%' OR p.Referencia LIKE @v_buscar+'%' OR p.CodigoBarras LIKE @v_buscar+'%'))
	AND CONVERT(date,d.Fecha) BETWEEN @FechaIni AND @FechaFin
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'validacion_celular')
	BEGIN
	SELECT * FROM Domicilio where Celular = @v_buscar ORDER BY Fecha DESC
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'Exactamente')
	BEGIN
	SELECT v.Domicilio,d.Fecha,d.Estado,d.Celular,c.DNI,d.Nombre,d.Direccion,
	m.DNI +'-'+m.Nombre Mensajero,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura,
	p.Item,p.Referencia,p.CodigoBarras,p.Nombre NombreProducto,v.Cantidad,v.ModoVenta,v.UM,v.PrecioVenta,
	v.descuento,v.PrecioVenta * (v.descuento/100) ValorDescuento,d.ValorDomicilio,v.Total
	FROM Venta v
	INNER JOIN Domicilio d ON d.Codigo = v.Domicilio
	INNER JOIN Cliente c ON c.Codigo = d.Cliente
	INNER JOIN Mensajero m ON m.DNI = d.Mensajero
	INNER JOIN Producto p ON p.Item = v.Producto
	WHERE (d.Codigo = SUBSTRING(@v_buscar,1,5) OR d.Celular = @v_buscar OR c.DNI = @v_buscar
	OR m.DNI = @v_buscar OR (p.Item = SUBSTRING(@v_buscar,1,5) OR p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar))
	AND CONVERT(date,d.Fecha) BETWEEN @FechaIni AND @FechaFin
	END
	END
	END
	END
	GO
	CREATE PROC sp_consultar_sistema_separado
		@v_buscar VARCHAR(300),
	@v_tipo_busqueda AS VARCHAR(20),
	@FechaIni AS DATE,
	@FechaFin AS DATE
	AS
	IF(@v_tipo_busqueda = 'max codigo')
	BEGIN
	SELECT MAX(Codigo) codigo FROM SistemaSeparado
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
	SELECT sp.Codigo,sp.Estado,sp.Fecha,CONCAT(c.DNI,' - ',c.Nombre) Cliente,
	CONCAT(p.Item,' - ',p.Referencia,' - ',p.CodigoBarras,' - ',p.Nombre) Producto,
	v.Cantidad,v.Costo,v.PrecioVenta,sp.AbonoInicial,sp.NumCuotas,sp.ValorCuota,
	sp.PeriodoPago,sp.Valor,sp.FechaPrimerPago,sp.FechaVence,ISNULL(ab.ValorAbono,0) ValorAbono,ISNULL(ab.Fecha,'') FechaAbono,
	CONCAT(v.NombreDocumento,' - ',v.ConsecutivoDocumento) Factura
	 FROM Venta v
	INNER JOIN SistemaSeparado sp ON sp.Codigo = v.SistemaSeparado
	INNER JOIN Cliente c ON c.Codigo = sp.Cliente
	INNER JOIN Producto p ON p.Item = v.Producto
	LEFT JOIN AbonoSistemaSeparado ab ON ab.SistemaSeparado = sp.Codigo
	WHERE (sp.Codigo LIKE @v_buscar+'%' OR (c.DNI  LIKE @v_buscar+'%' OR c.Nombre  LIKE @v_buscar+'%') OR 
	(p.Item  LIKE @v_buscar+'%' OR p.Referencia  LIKE @v_buscar+'%' OR p.CodigoBarras  LIKE @v_buscar+'%' OR p.Nombre LIKE @v_buscar+'%')) 
	AND CONVERT(date,sp.Fecha) BETWEEN @FechaIni AND @FechaFin
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'validacion')
	BEGIN
	SELECT * FROM SistemaSeparado where Codigo = @v_buscar OR Cliente = @v_buscar
	END
	ELSE
	BEGIN
	SELECT sp.Codigo,sp.Estado,sp.Fecha,CONCAT(c.DNI,' - ',c.Nombre) Cliente,
	CONCAT(p.Item,' - ',p.Referencia,' - ',p.CodigoBarras,' - ',p.Nombre) Producto,
	v.Cantidad,v.Costo,v.PrecioVenta,sp.AbonoInicial,sp.NumCuotas,sp.ValorCuota,
	sp.PeriodoPago,sp.Valor,sp.FechaPrimerPago,sp.FechaVence,ISNULL(ab.ValorAbono,0) ValorAbono,ISNULL(ab.Fecha,'') FechaAbono,
	CONCAT(v.NombreDocumento,' - ',v.ConsecutivoDocumento) Factura
	 FROM Venta v
	INNER JOIN SistemaSeparado sp ON sp.Codigo = v.SistemaSeparado
	INNER JOIN Cliente c ON c.Codigo = sp.Cliente
	INNER JOIN Producto p ON p.Item = v.Producto
	LEFT JOIN AbonoSistemaSeparado ab ON ab.SistemaSeparado = sp.Codigo
	WHERE (sp.Codigo =  CASE WHEN ISNUMERIC(@v_buscar) = 1 THEN @v_buscar ELSE 0 END OR (c.DNI = @v_buscar OR c.Nombre = @v_buscar) OR 
	(p.Item =  CASE WHEN ISNUMERIC(@v_buscar) = 1 THEN @v_buscar ELSE 0 END OR p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar OR p.Nombre = @v_buscar)) 
	AND CONVERT(date,sp.Fecha) BETWEEN @FechaIni AND @FechaFin
	END
	END
	END
	GO
	CREATE PROC sp_consultar_mensajero
	@v_buscar VARCHAR(300),
	@v_tipo_busqueda AS VARCHAR(20)
	AS
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
	SELECT * FROM Mensajero
		WHERE (DNI LIKE @v_buscar+'%' OR Nombre LIKE @v_buscar+'%') AND DNI != '0'
	END
	ELSE
	BEGIN
	SELECT * FROM Mensajero
		WHERE (DNI = @v_buscar OR Nombre = @v_buscar) AND DNI != '0'
	END
	GO

	CREATE PROC sp_consultar_empresa
	AS
	SELECT *,ISNULL((SELECT MAX(ConsecutivoDocumento) FROM Venta),0) ConsecutivoActual FROM Empresa
	GO
	CREATE PROCEDURE sp_consultar_caracteristicas_producto
	AS
	SELECT Codigo,Nombre,'UnidadMedida' Tabla FROM UnidadMedida
	UNION
	SELECT Codigo,Nombre,'Estado' FROM Estado
	UNION
	SELECT Codigo,Nombre,'Categoria' FROM Categoria
	UNION
	SELECT Codigo,Nombre,'Marca' FROM Marca
	UNION
	SELECT Codigo,Nombre,'Ubicacion' FROM Ubicacion
	UNION
	SELECT Codigo,Nombre,'SalidaPara' FROM SalidaPara
	ORDER BY Tabla,Codigo
	GO
	CREATE PROC sp_consultar_proveedor
	@v_buscar VARCHAR(300),
	@v_tipo_busqueda AS VARCHAR(20)
	AS
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
	SELECT * FROM Proveedor WHERE (DNI LIKE @v_buscar+'%' OR Nombre LIKE @v_buscar+'%') AND Nombre != 'N/A'
	END
	ELSE
	IF(@v_tipo_busqueda = 'validacion')
	BEGIN
	SELECT * FROM Proveedor WHERE DNI = @v_buscar
	END
	ELSE
	BEGIN
	SELECT * FROM Proveedor WHERE (DNI = @v_buscar OR Nombre = @v_buscar) AND Nombre != 'N/A'
	END
	GO
		CREATE PROC sp_consultar_cliente
		@v_buscar VARCHAR(300),
		@v_tipo_busqueda AS VARCHAR(20)
		AS
		IF(@v_tipo_busqueda = 'Contiene')
		BEGIN
		SELECT * FROM Cliente WHERE (DNI LIKE @v_buscar+'%' OR Nombre LIKE @v_buscar+'%') AND Nombre != 'N/A'
		END
		ELSE
		IF(@v_tipo_busqueda = 'validacion')
		BEGIN
		SELECT * FROM Cliente WHERE DNI = @v_buscar 
		END
		ELSE
		BEGIN
		IF(@v_tipo_busqueda ='validacion_celular')
		BEGIN
		SELECT * FROM Cliente WHERE Celular = @v_buscar 
		END
		ELSE
		BEGIN
		SELECT * FROM Cliente WHERE (DNI = @v_buscar OR Nombre = @v_buscar) AND Nombre != 'N/A'
		END
		END
	GO
	--
	CREATE PROCEDURE sp_consultar_categoria
	@v_buscar VARCHAR(300),
	@v_tipo_busqueda VARCHAR(20)
	AS
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
	SELECT * FROM Categoria WHERE Nombre LIKE @v_buscar+'%' AND Nombre != 'N/A'
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'Normal')
	BEGIN
	SELECT * FROM Categoria
	END
	ELSE
	BEGIN
	SELECT * FROM Categoria WHERE Nombre = @v_buscar
	END
	END
	GO
	--
	CREATE PROCEDURE sp_consultar_estado
	AS
	SELECT * FROM Estado
	GO
	--
	CREATE PROCEDURE sp_consultar_Marca
	@v_buscar VARCHAR(300),
	@v_tipo_busqueda VARCHAR(20)
	AS
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
	SELECT * FROM Marca WHERE Nombre LIKE @v_buscar+'%' AND Nombre != 'N/A'
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'Normal')
	BEGIN
	SELECT * FROM Marca
	END
	ELSE
	BEGIN
	SELECT * FROM Marca WHERE Nombre = @v_buscar
	END
	END
	GO
	--
	CREATE PROCEDURE sp_consultar_unidad_medida
	@v_buscar VARCHAR(300),
	@v_tipo_busqueda VARCHAR(20)
	AS
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
	SELECT * FROM UnidadMedida WHERE Nombre LIKE @v_buscar+'%' AND Nombre != 'N/A'
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'Normal')
	BEGIN
	SELECT * FROM UnidadMedida
	END
	ELSE
	BEGIN
	SELECT * FROM UnidadMedida WHERE Nombre = @v_buscar
	END
	END
	GO
	--
	CREATE PROCEDURE sp_consultar_ubicacion
	@v_buscar VARCHAR(300),
	@v_tipo_busqueda VARCHAR(20)
	AS
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
	SELECT * FROM Ubicacion WHERE Nombre LIKE @v_buscar+'%' AND Nombre != 'N/A'
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'Normal')
	BEGIN
	SELECT * FROM Ubicacion
	END
	ELSE
	BEGIN
	SELECT * FROM Ubicacion WHERE Nombre = @v_buscar
	END
	END
	GO
	--
	CREATE PROCEDURE sp_consultar_salida_para
	@v_buscar VARCHAR(300),
	@v_tipo_busqueda VARCHAR(20)
	AS
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
	SELECT * FROM SalidaPara WHERE Nombre LIKE @v_buscar+'%' AND Nombre != 'N/A'
	END
	ELSE
	BEGIN
	IF(@v_tipo_busqueda = 'Normal')
	BEGIN
	SELECT * FROM SalidaPara
	END
	ELSE
	BEGIN
	SELECT * FROM SalidaPara WHERE Nombre = @v_buscar
	END
	END
	GO
	
	CREATE PROCEDURE sp_consultar_producto
	@v_tipo_consulta AS VARCHAR(200),
	@v_buscar AS VARCHAR(200),
	@Item AS INT,
	@Referencia AS VARCHAR(20),
	@Codigo_barras AS VARCHAR(100)
	AS
	DECLARE 
	@v_variable AS INT

	IF(@v_tipo_consulta = 'Validar_referencia')
	BEGIN
	SELECT p.Item,p.Referencia,p.Nombre,p.Descripcion,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	WHERE p.Referencia = @Referencia
	END
	ELSE
	BEGIN
	IF(@v_tipo_consulta = 'Validar_codigo_barras')
	BEGIN
	SELECT p.Item,p.Referencia,p.Nombre,p.Descripcion,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	WHERE p.CodigoBarras = @Codigo_barras
	END
	ELSE
	BEGIN
	IF(@v_tipo_consulta = 'Validar_Item')
	BEGIN
	SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	WHERE p.Item = @Item
	END
	ELSE
	BEGIN
	IF(@v_tipo_consulta = 'Buscar_consecutivo_item')
	BEGIN
	SELECT ISNULL(MAX(Item),0) + 1 item FROM Producto
	END
	ELSE
	BEGIN
	IF(@v_tipo_consulta = 'Buscar_nombre')
	BEGIN
	SELECT Nombre FROM Producto
	WHERE Nombre LIKE @v_buscar+'%'
	GROUP BY Nombre
	END
	ELSE
	BEGIN
	IF(@v_tipo_consulta = 'Buscar_data_producto')
	BEGIN
	SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo,
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = p.Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = p.Item) Stock,
	((SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = p.Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = p.Item)) * p.SubCantidad stockSubcantidad,
	((SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = p.Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = p.Item)) * p.Sobres stockSobres
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	WHERE p.Item LIKE @v_buscar+'%' OR p.Referencia LIKE @v_buscar+'%' OR p.CodigoBarras LIKE @v_buscar+'%' OR p.Nombre LIKE @v_buscar+'%'
	END
	ELSE
	BEGIN
	IF(@v_tipo_consulta = 'Buscar_data_producto_exacto_item')
	BEGIN
	SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo,
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = @Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = @Item) Stock,
	((SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = @Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = @Item)) * p.SubCantidad stockSubcantidad,
	((SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = @Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = @Item)) * p.Sobres stockSobres
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	WHERE p.Item =  @Item
	END
	ELSE
	BEGIN
		IF(@v_tipo_consulta = 'Buscar_data_producto_exacto')
	BEGIN
	SET @v_variable = (SELECT ISNUMERIC(@v_buscar))
	IF(@v_variable = 1)
	BEGIN
	SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	WHERE p.Item = @v_buscar OR p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar OR p.Nombre = @v_buscar
	END
	ELSE
	BEGIN
	SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	WHERE p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar OR p.Nombre = @v_buscar
	END	
	END
	ELSE
	BEGIN
	IF(@v_tipo_consulta = 'Buscar_data_producto_exacto_venta')
	BEGIN
	SET @v_variable = (SELECT ISNUMERIC(@v_buscar))
	IF(@v_variable = 1)
	BEGIN
	SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	WHERE p.Item = @v_buscar OR p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar
	END
	ELSE
	BEGIN
	SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	WHERE p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar
	END
	END
	END
	END
	END
	END
	END
	END
	END
	END

	GO
	CREATE PROCEDURE sp_consulta_kardex
	@Buscar AS VARCHAR(300),
	@FechaIni AS DATE,
	@FechaFin AS DATE,
	@Tipo_busqueda AS VARCHAR(300)
	AS
	IF(@Tipo_busqueda = 'Contiene')
	BEGIN
	SELECT Codigo,FechaRegistro,movimiento,Item,Referencia,CodigoBarras,Nombre,
	ModoVenta,ISNULL(UM,'') UM,Cantidad,Costo,PrecioVenta,DNIproveedor,Proveedor,Accion
	FROM Kardex
	WHERE (Item LIKE @Buscar+'%' OR Referencia LIKE @Buscar+'%' OR 
	CodigoBarras LIKE @Buscar+'%' OR Nombre LIKE @Buscar+'%') 
	AND CONVERT(date,FechaRegistro) BETWEEN @FechaIni AND @FechaFin
	END
	ELSE
	BEGIN
	SELECT Codigo,FechaRegistro,movimiento,Item,Referencia,CodigoBarras,Nombre,
	ModoVenta,ISNULL(UM,'') UM,Cantidad,Costo,PrecioVenta,DNIproveedor,Proveedor,Accion
	FROM Kardex
	WHERE (Item = CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @buscar ELSE 0 END OR Referencia = @Buscar OR 
	CodigoBarras = @Buscar OR Nombre = @Buscar) 
	AND CONVERT(date,FechaRegistro) BETWEEN @FechaIni AND @FechaFin
	END
	GO
USE [DB_SBX]
GO
/****** Object:  StoredProcedure [dbo].[SP_CALCULAR_INGRESOS]    Script Date: 22/04/2019 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CALCULAR_INGRESOS]
	@UltimoCierre AS VARCHAR(20),
	@UltimaVenta AS VARCHAR(20),
	@Usuario AS VARCHAR(20)
	AS
	DECLARE 
	@Ingresos AS MONEY,
	@Gastos AS MONEY
	DECLARE @TABLA AS TABLE(NombreDocumento VARCHAR(50),Consecutivo FLOAT, Total MONEY, TipoVenta VARCHAR(20))
	--INSERTAR INGRESOS SIN DOMICILIOS Y SEPARADOS
	INSERT INTO @TABLA
	SELECT NombreDocumento, ConsecutivoDocumento, Total, 'Venta directa' FROM Venta 
	WHERE (Domicilio IS NULL AND SistemaSeparado IS NULL) AND 
	(Fecha BETWEEN (CASE WHEN (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) IS NULL 
	THEN '1990-01-01' ELSE (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) END) AND 
	(SELECT v2.Fecha FROM Venta v2 WHERE v2.Codigo = @UltimaVenta AND v2.Usuario = @Usuario)  AND Usuario = @Usuario)
	GROUP BY NombreDocumento, ConsecutivoDocumento, Total

	--INSERTAR INGRESOS DOMICILIOS
	INSERT INTO @TABLA
	SELECT v.NombreDocumento, v.ConsecutivoDocumento, v.Total,'Venta Domicilio' FROM Venta v
	INNER JOIN Domicilio d ON d.Codigo = v.Domicilio
	WHERE d.Estado != 'Pendiente'
	GROUP BY NombreDocumento, ConsecutivoDocumento, Total
	--INSERTAR INGRESOS SISTEMA SEPARADO
	DECLARE @TABLA2 TABLE(Abonos MONEY)
	INSERT INTO @TABLA2
	SELECT ISNULL(SUM(ValorAbono),0) VlrAbono 
	FROM AbonoSistemaSeparado 
	WHERE
	(Fecha BETWEEN (CASE WHEN (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) IS NULL 
	THEN '1990-01-01' ELSE (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) END) AND 
	--(SELECT v2.Fecha FROM Venta v2 WHERE v2.Codigo = @UltimaVenta AND v2.Usuario = @Usuario)
	SYSDATETIME()
	)
	--INSERTAR GASTOS 
	DECLARE @TABLA3 TABLE(Gastos MONEY)
	INSERT INTO @TABLA3
	SELECT ISNULL(SUM(Valor),0) VlrGasto
	FROM GastosM 
	WHERE
	(FechaRegistro BETWEEN (CASE WHEN (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) IS NULL 
	THEN '1990-01-01' ELSE (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) END) AND 
	--(SELECT v2.Fecha FROM Venta v2 WHERE v2.Codigo = @UltimaVenta AND v2.Usuario = @Usuario)
	SYSDATETIME()
	)
		
	SET @Ingresos = (SELECT ISNULL(SUM(Total),0) Ingresos FROM @TABLA)
	SET @Ingresos = @Ingresos + (SELECT ISNULL(SUM(Abonos),0) Abon FROM @TABLA2)
	SET @Gastos = (SELECT ISNULL(SUM(Gastos),0) Gastos FROM @TABLA3)

	DECLARE @TABLA4 TABLE(Ingresos MONEY,Gastos MONEY)
	INSERT INTO @TABLA4
	Values(@Ingresos,@Gastos)

	SELECT * FROM @TABLA4
	GO
	CREATE TABLE Cierre_Caja(
	Codigo INT,
	BaseCaja MONEY,
	Ingresos MONEY,
	Gastos MONEY,
	CierreCaja MONEY,
	ConteoDinero MONEY,
	TotalDiferencia MONEY
)
	GO

CREATE FUNCTION [dbo].[fnLeeClave] 
(
    @clave VARCHAR(8000)
)
RETURNS VARCHAR(25)
AS
BEGIN
    
    
    DECLARE @pass AS VARCHAR(25)
    ------------------------------------
    ------------------------------------
    --Se descifra el campo aplicandole la misma llave con la que se cifro password
    SET @pass = DECRYPTBYPASSPHRASE('password',@clave)
    ------------------------------------
    ------------------------------------    
    RETURN @pass

END