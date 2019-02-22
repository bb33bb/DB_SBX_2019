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
	CREATE TRIGGER tr_Venta_insert on Venta
	FOR INSERT
	AS
	BEGIN
	INSERT INTO Kardex (Item,Referencia,Nombre,Descripcion,IVA,UnidadMedida,Medida,Estado,Categoria,Marca,DNIproveedor,Proveedor,
	ModoVenta,Cantidad,Costo,PrecioVenta,CodigoBarras,SubCantidad,ValorSubcantidad,Sobres,ValorSobre,Usuario,FechaRegistro,
	Accion,movimiento,Ubicacion,Salida_para,Stock_minimo,Stock_maximo,UM)
	SELECT p.Item,p.Referencia,p.Nombre,p.Descripcion,v.IVA,um.Nombre,p.Medida,0,ct.Nombre,
	m.Nombre,pr.DNI,pr.Nombre,p.ModoVenta,v.Cantidad,v.Costo,v.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,v.Usuario,SYSDATETIME(),'INSERT-VENTA','Salida -',
	p.Ubicacion,p.Salida_para,p.Stock_minimo,p.Stock_maximo,v.UM
	FROM Venta v
	INNER JOIN Producto p ON v.Producto = p.Item
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Proveedor pr ON pr.DNI = p.Proveedor
	WHERE v.Fecha = (SELECT MAX(Fecha) FROM Venta)
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
	Accion,movimiento,Ubicacion,Salida_para,Stock_minimo,Stock_maximo)
	SELECT p.Item,p.Referencia,p.Nombre,P.Descripcion,p.IVA,um.Nombre,p.Medida,p.Estado,ct.Nombre,m.Nombre,pr.DNI,pr.Nombre,
	p.ModoVenta,p.Cantidad,p.Costo,p.PrecioVenta,p.CodigoBarras,p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,
	p.Usuario,SYSDATETIME(),'INSERT-INVENTARIO',p.movimiento,p.Ubicacion,p.Salida_para,p.Stock_minimo,p.Stock_maximo
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
	CREATE PROC sp_consultar_productos_kardex
	@v_tipo_busqueda AS VARCHAR(MAX),
@v_buscar AS VARCHAR(MAX)
AS
DECLARE @TABLA TABLE(Item INT,Referencia VARCHAR(max),CodigoBarras VARCHAR(max),Nombre VARCHAR(max),Descripcion VARCHAR(max),
ModoVenta VARCHAR(max),UM VARCHAR(max),Stock FLOAT,StockSubcantidad FLOAT,StockSobres FLOAT,Costo MONEY,PrecioVenta MONEY,
CostoSubCantidad MONEY,PrecioVentaSubCantidad MONEY,CostoSobre MONEY,PrecioVentaSobre MONEY,
IVA FLOAT,UnidadMedida VARCHAR(max),Categoria VARCHAR(max),
Marca VARCHAR(max),Ubicacion VARCHAR(max),Salida_para VARCHAR(max),DNIproveedor VARCHAR(max),Proveedor VARCHAR(max),
Stock_minimo INT,Stock_maximo INT)
INSERT INTO @TABLA (Item,Referencia,CodigoBarras,Nombre,Descripcion ,
ModoVenta,UM ,Stock ,StockSubcantidad ,StockSobres ,Costo ,PrecioVenta ,
CostoSubCantidad ,PrecioVentaSubCantidad ,CostoSobre ,PrecioVentaSobre ,
IVA ,UnidadMedida ,Categoria ,
Marca ,Ubicacion ,Salida_para ,DNIproveedor ,Proveedor ,
Stock_minimo ,Stock_maximo)
SELECT k.Item,k.Referencia,k.CodigoBarras,k.Nombre,k.Descripcion,k.ModoVenta,
CASE WHEN k.ModoVenta = 'Unidad' THEN
ISNULL(k.UM,'UND')
ELSE
CASE WHEN k.ModoVenta = 'Pesaje' THEN
ISNULL(k.UM,'Bulto')
ELSE
CASE WHEN k.ModoVenta = 'Multi' THEN
ISNULL(k.UM,'Caja')
END
END
END UM,
 ISNULL(CASE WHEN k.ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 
	WHERE (k1.ModoVenta = 'Unidad' AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
	-
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 
	WHERE (k1.ModoVenta = 'Unidad' AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
ELSE
	CASE WHEN k.ModoVenta = 'Pesaje' THEN
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND (K.UM IS NULL OR K.UM = 'Bulto')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
		-
		((SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND K1.UM = 'Bulto') AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM(k1.Cantidad/k1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND (K1.UM != 'Bulto' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		)
	ELSE
	CASE WHEN k.ModoVenta = 'Multi' THEN
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K.UM IS NULL OR K.UM = 'Caja')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
		-
		((SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND K1.UM = 'Caja') AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM(k1.Cantidad/k1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K1.UM = 'UND P' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM((k1.Cantidad * (k1.SubCantidad/K1.Sobres))/K1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K1.UM = 'Sobre' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		)
	END
	END	
	END,0) stock,
	ISNULL(
	CASE WHEN k.ModoVenta = 'Pesaje' THEN
	(
	ISNULL( CASE WHEN k.ModoVenta = 'Unidad' THEN
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE (k1.ModoVenta = 'Unidad' AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
		-
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE (k1.ModoVenta = 'Unidad' AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
	ELSE
	CASE WHEN k.ModoVenta = 'Pesaje' THEN
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND (K.UM IS NULL OR K.UM = 'Bulto')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
		-
		((SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND K1.UM = 'Bulto') AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM(k1.Cantidad/k1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND (K1.UM != 'Bulto' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		)
	ELSE
	CASE WHEN k.ModoVenta = 'Multi' THEN
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K.UM IS NULL OR K.UM = 'Caja')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
		-
		((SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND K1.UM = 'Caja') AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM(k1.Cantidad/k1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K1.UM = 'UND P' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM((k1.Cantidad * (k1.SubCantidad/K1.Sobres))/K1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K1.UM = 'Sobre' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		)
	END
	END	
	END,0)
	)
	*
	(SELECT K1.SubCantidad FROM Kardex k1 
	WHERE ((k1.ModoVenta = 'Pesaje' AND (K.UM IS NULL OR K.UM = 'Bulto')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
ELSE
CASE WHEN k.ModoVenta = 'Multi' THEN
		(
	ISNULL( CASE WHEN k.ModoVenta = 'Unidad' THEN
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE (k1.ModoVenta = 'Unidad' AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
		-
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE (k1.ModoVenta = 'Unidad' AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
	ELSE
	CASE WHEN k.ModoVenta = 'Pesaje' THEN
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND (K.UM IS NULL OR K.UM = 'Bulto')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
		-
		((SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND K1.UM = 'Bulto') AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM(k1.Cantidad/k1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND (K1.UM != 'Bulto' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		)
	ELSE
	CASE WHEN k.ModoVenta = 'Multi' THEN
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K.UM IS NULL OR K.UM = 'Caja')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
		-
		((SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND K1.UM = 'Caja') AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM(k1.Cantidad/k1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K1.UM = 'UND P' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM((k1.Cantidad * (k1.SubCantidad/K1.Sobres))/K1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K1.UM = 'Sobre' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		)
	END
	END	
	END,0)
	)
	*
	(SELECT K1.SubCantidad FROM Kardex k1 
	WHERE (((k1.ModoVenta = 'Multi' AND (K.UM IS NULL OR K.UM = 'Caja')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
	AND k1.Codigo = 
	(
	(SELECT MAX(K1.Codigo) FROM Kardex k1 
	WHERE (((k1.ModoVenta = 'Multi' AND (K.UM IS NULL OR K.UM = 'Caja')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
	)	
	)
	)
END
END,0) StockSubcantidad,
ISNULL(
CASE WHEN k.ModoVenta = 'Multi' THEN
	(ISNULL( CASE WHEN k.ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 
	WHERE (k1.ModoVenta = 'Unidad' AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
	-
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 
	WHERE (k1.ModoVenta = 'Unidad' AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
ELSE
	CASE WHEN k.ModoVenta = 'Pesaje' THEN
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND (K.UM IS NULL OR K.UM = 'Bulto')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
		-
		((SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND K1.UM = 'Bulto') AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM(k1.Cantidad/k1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Pesaje' AND (K1.UM != 'Bulto' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		)
	ELSE
	CASE WHEN k.ModoVenta = 'Multi' THEN
		(SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K.UM IS NULL OR K.UM = 'Caja')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
		-
		((SELECT SUM(k1.Cantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND K1.UM = 'Caja') AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM(k1.Cantidad/k1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K1.UM = 'UND P' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		+
		(SELECT SUM((k1.Cantidad * (k1.SubCantidad/K1.Sobres))/K1.SubCantidad) FROM Kardex k1 
		WHERE ((k1.ModoVenta = 'Multi' AND (K1.UM = 'Sobre' OR K1.UM != NULL)) AND k1.movimiento = 'Salida -') AND K1.Item = K.Item)
		)
	END
	END	
	END,0))
	*
	(SELECT K1.Sobres FROM Kardex k1 
	WHERE (((k1.ModoVenta = 'Multi' AND (K.UM IS NULL OR K.UM = 'Caja')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
	AND k1.Codigo = 
	(
	(SELECT MAX(K1.Codigo) FROM Kardex k1 
	WHERE (((k1.ModoVenta = 'Multi' AND (K.UM IS NULL OR K.UM = 'Caja')) AND k1.movimiento = 'Entrada +') AND K1.Item = K.Item)
	)	
	)
	)
END,0) StockSobres,
CASE WHEN k.ModoVenta = 'Unidad' THEN
(SELECT costo FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Unidad')
ELSE
CASE WHEN k.ModoVenta = 'Pesaje' AND (K.UM = 'Bulto' OR k.UM IS NULL) THEN
	CASE WHEN K.UM = 'Bulto' OR k.UM IS NULL THEN
	(SELECT costo FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Pesaje' AND (K.UM = 'Bulto' OR k.UM IS NULL))
	END
	ELSE
	CASE WHEN  k.ModoVenta = 'Pesaje' AND (K.UM != 'Bulto' OR k.UM != NULL) THEN
	0
	--(SELECT costo/SubCantidad FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Pesaje' AND (K.UM != 'Bulto' OR k.UM != NULL))
	ELSE
	CASE WHEN k.ModoVenta = 'Multi' AND (K.UM = 'Caja' OR k.UM IS NULL) THEN
		(SELECT costo FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Multi' AND (K.UM = 'Caja' OR k.UM IS NULL))
		ELSE
		CASE WHEN k.ModoVenta = 'Multi' AND (K.UM = 'Sobre' OR k.UM != NULL) THEN
		0
		--(SELECT costo/Sobres FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Multi' AND (K.UM = 'Sobre' OR k.UM != NULL))
		ELSE
		CASE WHEN k.ModoVenta = 'Multi' AND (K.UM = 'UND P' OR k.UM != NULL) THEN
		0
		--(SELECT costo/SubCantidad FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Multi' AND (K.UM = 'UND P' OR k.UM != NULL))
		END
		END
	END
	END
END
END Costo,
CASE WHEN k.ModoVenta = 'Unidad' THEN
(SELECT PrecioVenta FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Unidad')
ELSE
CASE WHEN k.ModoVenta = 'Pesaje' AND (K.UM = 'Bulto' OR k.UM IS NULL) THEN
	CASE WHEN K.UM = 'Bulto' OR k.UM IS NULL THEN
	(SELECT PrecioVenta FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Pesaje' AND (K.UM = 'Bulto' OR k.UM IS NULL))
	END
	ELSE
	CASE WHEN  k.ModoVenta = 'Pesaje' AND (K.UM != 'Bulto' OR k.UM != NULL) THEN
	--(SELECT ValorSubcantidad FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Pesaje' AND (K.UM != 'Bulto' OR k.UM != NULL))
	0
	ELSE
	CASE WHEN k.ModoVenta = 'Multi' AND (K.UM = 'Caja' OR k.UM IS NULL) THEN
		(SELECT PrecioVenta FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Multi' AND (K.UM = 'Caja' OR k.UM IS NULL))
		ELSE
		CASE WHEN k.ModoVenta = 'Multi' AND (K.UM = 'Sobre' OR k.UM != NULL) THEN
		--(SELECT ValorSobre FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Multi' AND (K.UM = 'Sobre' OR k.UM != NULL))
		0
		ELSE
		CASE WHEN k.ModoVenta = 'Multi' AND (K.UM = 'UND P' OR k.UM != NULL) THEN
		--(SELECT ValorSubcantidad FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Multi' AND (K.UM = 'UND P' OR k.UM != NULL))
		0
		END
		END
	END
	END
END
END PrecioVenta,
ISNULL( CASE WHEN k.ModoVenta = 'Unidad' THEN
0
ELSE
CASE WHEN k.ModoVenta = 'Pesaje'  THEN
	(SELECT costo/SubCantidad FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Pesaje'  AND (k.UM = 'Bulto' OR k.UM IS NULL))
	ELSE
	CASE WHEN k.ModoVenta = 'Multi' THEN
	(SELECT costo/SubCantidad FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Multi' AND (k.UM = 'Caja' OR k.UM IS NULL))
	END
END
END,0) CostoSubCantidad,
ISNULL( CASE WHEN k.ModoVenta = 'Unidad' THEN
0
ELSE
CASE WHEN k.ModoVenta = 'Pesaje' THEN
(SELECT ValorSubcantidad FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Pesaje' AND (k.UM = 'Bulto' OR k.UM IS NULL))
ELSE
CASE WHEN k.ModoVenta = 'Multi' THEN
(SELECT ValorSubcantidad FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Multi' AND (k.UM = 'Caja' OR k.UM IS NULL))
END
END
END,0) PrecioVentaSubCantidad,

ISNULL( CASE WHEN k.ModoVenta = 'Unidad' THEN
0
ELSE
CASE WHEN k.ModoVenta = 'Pesaje' THEN 
0
ELSE
CASE WHEN k.ModoVenta = 'Multi' THEN 
(SELECT costo/Sobres FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Multi' AND (k.UM = 'Caja' OR k.UM IS NULL))
END
END
END,0) CostoSobre,
ISNULL(CASE WHEN k.ModoVenta = 'Unidad' THEN
0
ELSE
CASE WHEN k.ModoVenta = 'Pesaje' THEN
0
ELSE
CASE WHEN k.ModoVenta = 'Multi' THEN
(SELECT ValorSobre FROM Kardex WHERE (Codigo = (SELECT MAX(codigo) FROM Kardex WHERE Item = k.Item)) AND ModoVenta = 'Multi' AND (k.UM = 'Caja' OR k.UM IS NULL))
END
END
END,0) PrecioVentaSobre,

k.IVA,k.UnidadMedida,k.Categoria,
k.Marca,ub.Nombre Ubicacion,slp.Nombre Salida_para,k.DNIproveedor, k.Proveedor,
k.Stock_minimo,k.Stock_maximo
FROM Kardex k
INNER JOIN Ubicacion ub ON ub.Codigo = k.Ubicacion
INNER JOIN SalidaPara slp ON slp.Codigo = k.Salida_para
ORDER BY k.Item,k.UM,k.FechaRegistro

DECLARE @TABLA2 TABLE(Item INT,Referencia VARCHAR(max),CodigoBarras VARCHAR(max),Nombre VARCHAR(max),Descripcion VARCHAR(max),
ModoVenta VARCHAR(max),UM VARCHAR(max),Stock FLOAT,StockSubcantidad FLOAT,StockSobres FLOAT,Costo MONEY,PrecioVenta MONEY,
CostoSubCantidad MONEY,PrecioVentaSubCantidad MONEY,CostoSobre MONEY,PrecioVentaSobre MONEY,
IVA FLOAT,UnidadMedida VARCHAR(max),Categoria VARCHAR(max),
Marca VARCHAR(max),Ubicacion VARCHAR(max),Salida_para VARCHAR(max),DNIproveedor VARCHAR(max),Proveedor VARCHAR(max),
Stock_minimo INT,Stock_maximo INT)
INSERT @TABLA2(Item ,Referencia ,CodigoBarras ,Nombre ,Descripcion ,
ModoVenta ,UM ,Stock ,StockSubcantidad ,StockSobres ,Costo ,PrecioVenta ,
CostoSubCantidad ,PrecioVentaSubCantidad ,CostoSobre ,PrecioVentaSobre ,
IVA ,UnidadMedida ,Categoria ,
Marca ,Ubicacion ,Salida_para ,DNIproveedor ,Proveedor ,
Stock_minimo ,Stock_maximo )
SELECT * FROM @TABLA
GROUP BY
Item ,Referencia ,CodigoBarras ,Nombre ,Descripcion ,
ModoVenta ,UM ,Stock ,StockSubcantidad ,StockSobres ,Costo ,PrecioVenta ,
CostoSubCantidad ,PrecioVentaSubCantidad ,CostoSobre ,PrecioVentaSobre ,
IVA ,UnidadMedida ,Categoria ,
Marca ,Ubicacion ,Salida_para ,DNIproveedor ,Proveedor ,
Stock_minimo ,Stock_maximo

IF(@v_tipo_busqueda = 'Contiene')
BEGIN
SELECT 
	Item ,Referencia ,CodigoBarras ,Nombre ,Descripcion ,
	ModoVenta ,SUM(Stock) Stock,SUM(StockSubcantidad) StockSubcantidad, SUM(StockSobres) StockSobres,SUM(Costo) Costo , SUM(PrecioVenta)  PrecioVenta,
	SUM(CostoSubCantidad) CostoSubCantidad ,SUM(PrecioVentaSubCantidad) PrecioVentaSubCantidad,SUM(CostoSobre) CostoSobre,SUM(PrecioVentaSobre) PrecioVentaSobre,
	IVA ,UnidadMedida ,Categoria ,
	Marca ,Ubicacion ,Salida_para ,DNIproveedor ,Proveedor ,
	Stock_minimo ,Stock_maximo
	FROM @TABLA2
	WHERE Item LIKE @v_buscar+'%' OR Referencia LIKE @v_buscar+'%' OR CodigoBarras LIKE @v_buscar+'%' OR Nombre LIKE @v_buscar+'%'
	GROUP BY 
	Item ,Referencia ,CodigoBarras ,Nombre ,Descripcion ,
	ModoVenta,
	IVA ,UnidadMedida ,Categoria ,
	Marca ,Ubicacion ,Salida_para ,DNIproveedor ,Proveedor ,
	Stock_minimo ,Stock_maximo
END
ELSE
BEGIN
SELECT 
	Item ,Referencia ,CodigoBarras ,Nombre ,Descripcion ,
	ModoVenta ,SUM(Stock) Stock,SUM(StockSubcantidad) StockSubcantidad, SUM(StockSobres) StockSobres,SUM(Costo) Costo , SUM(PrecioVenta)  PrecioVenta,
	SUM(CostoSubCantidad) CostoSubCantidad ,SUM(PrecioVentaSubCantidad) PrecioVentaSubCantidad,SUM(CostoSobre) CostoSobre,SUM(PrecioVentaSobre) PrecioVentaSobre,
	IVA ,UnidadMedida ,Categoria ,
	Marca ,Ubicacion ,Salida_para ,DNIproveedor ,Proveedor ,
	Stock_minimo ,Stock_maximo
	FROM @TABLA2
	WHERE Item = CASE WHEN ISNUMERIC(@v_buscar) = 1 THEN @v_buscar ELSE 0 END OR Referencia = @v_buscar OR CodigoBarras = @v_buscar OR Nombre = @v_buscar
	GROUP BY 
	Item ,Referencia ,CodigoBarras ,Nombre ,Descripcion ,
	ModoVenta,
	IVA ,UnidadMedida ,Categoria ,
	Marca ,Ubicacion ,Salida_para ,DNIproveedor ,Proveedor ,
	Stock_minimo ,Stock_maximo
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