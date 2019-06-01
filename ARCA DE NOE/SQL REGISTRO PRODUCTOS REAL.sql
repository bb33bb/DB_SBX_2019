
----1 Agregar unidades de medida
--USE SBX_ESTANDAR
--INSERT INTO DB_SBX.dbo.UnidadMedida
--SELECT Nombre FROM UnidadMedida
--WHERE id IN(10,12,13)
----2 Agregar categorias
--USE SBX_ESTANDAR
--INSERT INTO DB_SBX.dbo.Categoria
--SELECT Nombre FROM Categoria
--WHERE id != 4
----3 Agregar marca
--USE SBX_ESTANDAR
--INSERT INTO DB_SBX.dbo.Marca
--SELECT Nombre FROM Marca
--WHERE ID != 11
----4 Agregar proveedor
--INSERT INTO DB_SBX.dbo.Proveedor
--SELECT DNI,RazonSocial,m.Nombre Ciudad,Direccion,TelefonoFijo,Celular1,Email,SitioWeb FROM Proveedor pr
--INNER JOIN Municipio m ON m.Codigo = pr.Municipio
--WHERE DNI != 0

--SELECT * FROM DB_SBX.dbo.Producto

--INSERT INTo DB_SBX.dbo.Producto
--(Referencia,Nombre,Descripcion,IVA,UnidadMedida,Medida,Estado,Categoria,Marca,Proveedor,
--ModoVenta,Ubicacion,Salida_para,Stock_minimo,Stock_maximo,Cantidad,Costo,PrecioVenta,
--CodigoBarras,SubCantidad,ValorSubcantidad,Sobres,ValorSobre,Foto,Usuario,FechaRegistro,movimiento)

SELECT '' Referencia,p.Nombre,p.Descripcion,p.IVA,
ISNULL((SELECT um2.Codigo FROM  DB_SBX.dbo.UnidadMedida um2 WHERE um2.Nombre = um.Nombre),1) UnidadMedida,
p.Medida,1 Estado,
ISNULL((SELECT ct2.Codigo FROM  DB_SBX.dbo.Categoria ct2 WHERE ct2.Nombre = ct.Nombre),1) Categira,
ISNULL((SELECT m2.Codigo FROM  DB_SBX.dbo.Marca m2 WHERE m2.Nombre = m.Nombre),1) Marca,
ISNULL((SELECT prr2.DNI FROM  DB_SBX.dbo.Proveedor prr2 WHERE prr2.Nombre = 
(
(SELECT 
prr.RazonSocial 
FROM Compras com
INNER JOIN Proveedor prr ON prr.Codigo = com.CodigoProveedor
WHERE 
CodigoProducto = c.CodigoProducto AND 
com.FechaRegistro = (SELECT MAX(FechaRegistro) FROM compras WHERE CodigoProducto = c.CodigoProducto))
) 
),0) Proveedor,
mv.Nombre ModoVenta,1 Ubicacion,2 Salida_para,Stock,StockMaximo,0 Cantidad,

(SELECT 
Costo 
FROM Compras 
WHERE 
CodigoProducto = c.CodigoProducto AND 
FechaRegistro = (SELECT MAX(FechaRegistro) FROM compras WHERE CodigoProducto = c.CodigoProducto)) Costo,
--(SELECT 
-- Margen
--FROM Compras 
--WHERE 
--CodigoProducto = c.CodigoProducto AND 
--FechaRegistro = (SELECT MAX(FechaRegistro) FROM compras WHERE CodigoProducto = c.CodigoProducto)) Margen,
ROUND(
(
(
(SELECT 
Costo 
FROM Compras 
WHERE 
CodigoProducto = c.CodigoProducto AND 
FechaRegistro = (SELECT MAX(FechaRegistro) FROM compras WHERE CodigoProducto = c.CodigoProducto))
) / 
(1-
(
(SELECT 
 Margen
FROM Compras 
WHERE 
CodigoProducto = c.CodigoProducto AND 
FechaRegistro = (SELECT MAX(FechaRegistro) FROM compras WHERE CodigoProducto = c.CodigoProducto))
/
100
)
)
),0) PrecioVenta,
(SELECT 
CodigoBarras 
FROM Compras 
WHERE 
CodigoProducto = c.CodigoProducto AND 
FechaRegistro = (SELECT MAX(FechaRegistro) FROM compras WHERE CodigoProducto = c.CodigoProducto)) CodigoBarras,
(SELECT 
SubCantidad 
FROM Compras 
WHERE 
CodigoProducto = c.CodigoProducto AND 
FechaRegistro = (SELECT MAX(FechaRegistro) FROM compras WHERE CodigoProducto = c.CodigoProducto)) SubCantidad,
(SELECT 
ValorUnidad
FROM Compras 
WHERE 
CodigoProducto = c.CodigoProducto AND 
FechaRegistro = (SELECT MAX(FechaRegistro) FROM compras WHERE CodigoProducto = c.CodigoProducto)) ValorSubCantidad,
(SELECT 
UnidadesEnSobre
FROM Compras 
WHERE 
CodigoProducto = c.CodigoProducto AND 
FechaRegistro = (SELECT MAX(FechaRegistro) FROM compras WHERE CodigoProducto = c.CodigoProducto)) Sobres,
(SELECT 
ValorSobres
FROM Compras 
WHERE 
CodigoProducto = c.CodigoProducto AND 
FechaRegistro = (SELECT MAX(FechaRegistro) FROM compras WHERE CodigoProducto = c.CodigoProducto)) ValorSobre,
(SELECT Foto FROM Producto WHERE ID = c.CodigoProducto) Foto,
1 Usuario, SYSDATETIME() FechaRegistro,'Entrada +' Movimiento
FROM 
Compras c
INNER JOIN Producto p ON p.ID = c.CodigoProducto
INNER JOIN UnidadMedida um ON um.ID = p.UnidadMedida
INNER JOIN Categoria ct ON ct.ID = p.Categoria
INNER JOIN Marca m ON m.ID = p.Marca	
INNER JOIN ModoVenta MV on MV.ID = p.ModoVenta
WHERE p.Nombre != 'DELIDOG MIX X 1 KG'
GROUP BY c.CodigoProducto,p.Nombre,p.Descripcion,p.IVA,um.Nombre,p.Medida,ct.Nombre, m.Nombre,mv.Nombre,Stock,StockMaximo
--SELECT CodigoProducto, count(*)
--FROM Compras
--GROUP BY CodigoProducto
--HAVING count(*) > 1


