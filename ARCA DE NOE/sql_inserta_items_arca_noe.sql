INSERT INTO DB_SBX.dbo.Producto (Nombre,Descripcion,CodigoBarras,IVA,UnidadMedida,Medida,
Categoria,Marca,ModoVenta,Stock_minimo,Stock_maximo,Costo,PrecioVenta,Cantidad,Estado,
Ubicacion,Salida_para,SubCantidad,ValorSubcantidad,Sobres,ValorSobre,Proveedor,Usuario,FechaRegistro,movimiento,Referencia,Foto)

SELECT p.Nombre,p.Descripcion,c.CodigoBarras,p.IVA,
ISNULL((SELECT um2.Codigo from DB_SBX.dbo.UnidadMedida um2 WHERE um2.Nombre = um.Nombre),1),
p.Medida,
ISNULL((SELECT ct2.Codigo from DB_SBX.dbo.Categoria ct2 WHERE ct2.Nombre = ct.Nombre),1)
,
ISNULL((SELECT mc2.Codigo from DB_SBX.dbo.Marca mc2 WHERE mc2.Nombre = mc.Nombre),1),
MV.Nombre ModoVenta,p.Stock,p.StockMaximo,0,0,0,1,1,2,0,0,0,0,0,1,SYSDATETIME(),'Entrada +',''
,''
FROM Producto p
INNER JOIN Compras c ON p.ID = c.CodigoProducto
INNER JOIN UnidadMedida um on um.ID = p.UnidadMedida
INNER JOIN Categoria ct ON ct.ID = p.Categoria
INNER JOIN Marca mc ON mc.ID = p.Marca
INNER JOIN ModoVenta MV ON MV.ID = p.ModoVenta
WHERE MV.Nombre = 'Unidad'
GROUP BY Item,p.Nombre,Descripcion,p.IVA,c.CodigoBarras,um.Nombre,p.Medida,ct.Nombre,mc.Nombre,MV.Nombre,p.Stock,p.StockMaximo





