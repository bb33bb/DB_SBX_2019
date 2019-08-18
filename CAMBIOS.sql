USE [DB_SBX]
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTA_ESTADO_PRODUCTOS]    Script Date: 28/07/2019 09:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC  [dbo].[SP_CONSULTA_ESTADO_PRODUCTOS]
 @Buscar AS VARCHAR(MAX)
,@TipoBusqueda AS VARCHAR(MAX)
AS
IF(@TipoBusqueda = 'Contiene')
BEGIN
--Item por UNIDAD
SELECT 
 Item
,(SELECT p.Referencia FROM Producto p WHERE p.Item = k1.Item) Referencia
,(SELECT p.CodigoBarras FROM Producto p WHERE p.Item = k1.Item) CodigoBarras
,(SELECT p.Nombre FROM Producto p WHERE p.Item = k1.Item) Nombre
,(SELECT p.Descripcion FROM Producto p WHERE p.Item = k1.Item) Descripcion
,SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) Stock
,0 StockSubcantidad
,0 StockSobres
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) CostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) PrecioVenta
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalCostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalPrecioVenta
,0 ValorSubcantidad
,0 TotalPrecioVentaSubCantidad
,0 ValorSobre
,0 TotalPrecioVentaSobres
,(SELECT p.IVA FROM Producto p WHERE p.Item = k1.Item) IVA
,(SELECT um.Nombre FROM Producto p INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida WHERE p.Item = k1.Item) UnidadMedida
,(SELECT m.Nombre FROM Producto p INNER JOIN Marca m ON m.Codigo = p.Marca WHERE p.Item = k1.Item) Marca
,(SELECT ub.Nombre FROM Producto p INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion WHERE p.Item = k1.Item) Ubicacion
,(SELECT slp.Nombre FROM Producto p INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para WHERE p.Item = k1.Item) SalidaPara
,(SELECT ct.Nombre FROM Producto p INNER JOIN Categoria ct ON ct.Codigo = p.Categoria WHERE p.Item = k1.Item) Categoria
,(SELECT p.Proveedor FROM Producto p WHERE p.Item = k1.Item) Proveedor
,(SELECT prr.Nombre FROM Producto p INNER JOIN Proveedor prr ON prr.DNI = p.Proveedor WHERE p.Item = k1.Item) NombreProveedor
,(SELECT p.Stock_minimo FROM Producto p WHERE p.Item = k1.Item) Stock_minimo
,(SELECT p.Stock_maximo FROM Producto p WHERE p.Item = k1.Item) Stock_maximo
,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
FROM Kardex k1
WHERE ModoVenta = 'Unidad' AND (Item LIKE CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @Buscar ELSE 0 END OR Referencia LIKE @Buscar+'%' OR CodigoBarras LIKE @Buscar+'%' OR Nombre LIKE @Buscar+'%')
AND k1.Item = (SELECT pd.Item FROM Producto pd WHERE pd.Item = k1.Item AND pd.Estado = 1)
GROUP BY 
 Item
 ,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
UNION ALL
--Item por Pesaje
SELECT 
Item
,(SELECT p.Referencia FROM Producto p WHERE p.Item = k1.Item) Referencia
,(SELECT p.CodigoBarras FROM Producto p WHERE p.Item = k1.Item) CodigoBarras
,(SELECT p.Nombre FROM Producto p WHERE p.Item = k1.Item) Nombre
,(SELECT p.Descripcion FROM Producto p WHERE p.Item = k1.Item) Descripcion
,SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) Stock
,SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) StockSubcantidad
,0 StockSobres
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) CostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) PrecioVenta
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalCostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalPrecioVenta
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) ValorSubcantidad
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) * (SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END)) TotalPrecioVentaSubCantidad
,0 ValorSobre
,0 TotalPrecioVentaSobres
,(SELECT p.IVA FROM Producto p WHERE p.Item = k1.Item) IVA
,(SELECT um.Nombre FROM Producto p INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida WHERE p.Item = k1.Item) UnidadMedida
,(SELECT m.Nombre FROM Producto p INNER JOIN Marca m ON m.Codigo = p.Marca WHERE p.Item = k1.Item) Marca
,(SELECT ub.Nombre FROM Producto p INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion WHERE p.Item = k1.Item) Ubicacion
,(SELECT slp.Nombre FROM Producto p INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para WHERE p.Item = k1.Item) SalidaPara
,(SELECT ct.Nombre FROM Producto p INNER JOIN Categoria ct ON ct.Codigo = p.Categoria WHERE p.Item = k1.Item) Categoria
,(SELECT p.Proveedor FROM Producto p WHERE p.Item = k1.Item) Proveedor
,(SELECT prr.Nombre FROM Producto p INNER JOIN Proveedor prr ON prr.DNI = p.Proveedor WHERE p.Item = k1.Item) NombreProveedor
,(SELECT p.Stock_minimo FROM Producto p WHERE p.Item = k1.Item) Stock_minimo
,(SELECT p.Stock_maximo FROM Producto p WHERE p.Item = k1.Item) Stock_maximo
,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
FROM Kardex k1
WHERE ModoVenta = 'Pesaje' AND (Item LIKE CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @Buscar ELSE 0 END OR Referencia LIKE @Buscar+'%' OR CodigoBarras LIKE @Buscar+'%'  OR Nombre LIKE @Buscar+'%')
AND k1.Item = (SELECT pd.Item FROM Producto pd WHERE pd.Item = k1.Item AND pd.Estado = 1)
GROUP BY 
  Item
 ,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
UNION ALL
--Item por Multi
SELECT 
Item
,(SELECT p.Referencia FROM Producto p WHERE p.Item = k1.Item) Referencia
,(SELECT p.CodigoBarras FROM Producto p WHERE p.Item = k1.Item) CodigoBarras
,(SELECT p.Nombre FROM Producto p WHERE p.Item = k1.Item) Nombre
,(SELECT p.Descripcion FROM Producto p WHERE p.Item = k1.Item) Descripcion
,SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) Stock
,SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) StockSubcantidad
,Sobres * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) StockSobres
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) CostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) PrecioVenta
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalCostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalPrecioVenta
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) ValorSubcantidad
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) * (SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END)) TotalPrecioVentaSubCantidad
,(SELECT p.ValorSobre FROM Producto p WHERE p.Item = k1.Item) ValorSobre
,(SELECT p.ValorSobre FROM Producto p WHERE p.Item = k1.Item) * (Sobres * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END)) TotalPrecioVentaSobres
,(SELECT p.IVA FROM Producto p WHERE p.Item = k1.Item) IVA
,(SELECT um.Nombre FROM Producto p INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida WHERE p.Item = k1.Item) UnidadMedida
,(SELECT m.Nombre FROM Producto p INNER JOIN Marca m ON m.Codigo = p.Marca WHERE p.Item = k1.Item) Marca
,(SELECT ub.Nombre FROM Producto p INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion WHERE p.Item = k1.Item) Ubicacion
,(SELECT slp.Nombre FROM Producto p INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para WHERE p.Item = k1.Item) SalidaPara
,(SELECT ct.Nombre FROM Producto p INNER JOIN Categoria ct ON ct.Codigo = p.Categoria WHERE p.Item = k1.Item) Categoria
,(SELECT p.Proveedor FROM Producto p WHERE p.Item = k1.Item) Proveedor
,(SELECT prr.Nombre FROM Producto p INNER JOIN Proveedor prr ON prr.DNI = p.Proveedor WHERE p.Item = k1.Item) NombreProveedor
,(SELECT p.Stock_minimo FROM Producto p WHERE p.Item = k1.Item) Stock_minimo
,(SELECT p.Stock_maximo FROM Producto p WHERE p.Item = k1.Item) Stock_maximo
,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
FROM Kardex k1
WHERE ModoVenta = 'Multi' AND (Item LIKE CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @Buscar ELSE 0 END OR Referencia LIKE @Buscar+'%' OR CodigoBarras LIKE @Buscar+'%'  OR Nombre LIKE @Buscar+'%')
AND k1.Item = (SELECT pd.Item FROM Producto pd WHERE pd.Item = k1.Item AND pd.Estado = 1)
GROUP BY 
 Item
,SubCantidad
,Sobres
,k1.ModoVenta
UNION ALL
--Item por Desechables
SELECT 
Item
,(SELECT p.Referencia FROM Producto p WHERE p.Item = k1.Item) Referencia
,(SELECT p.CodigoBarras FROM Producto p WHERE p.Item = k1.Item) CodigoBarras
,(SELECT p.Nombre FROM Producto p WHERE p.Item = k1.Item) Nombre
,(SELECT p.Descripcion FROM Producto p WHERE p.Item = k1.Item) Descripcion
,SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) Stock
,SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) StockSubcantidad
,0 StockSobres
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) CostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) PrecioVenta
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalCostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalPrecioVenta
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) ValorSubcantidad
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) * (SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END)) TotalPrecioVentaSubCantidad
,0 ValorSobre
,0 TotalPrecioVentaSobres
,(SELECT p.IVA FROM Producto p WHERE p.Item = k1.Item) IVA
,(SELECT um.Nombre FROM Producto p INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida WHERE p.Item = k1.Item) UnidadMedida
,(SELECT m.Nombre FROM Producto p INNER JOIN Marca m ON m.Codigo = p.Marca WHERE p.Item = k1.Item) Marca
,(SELECT ub.Nombre FROM Producto p INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion WHERE p.Item = k1.Item) Ubicacion
,(SELECT slp.Nombre FROM Producto p INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para WHERE p.Item = k1.Item) SalidaPara
,(SELECT ct.Nombre FROM Producto p INNER JOIN Categoria ct ON ct.Codigo = p.Categoria WHERE p.Item = k1.Item) Categoria
,(SELECT p.Proveedor FROM Producto p WHERE p.Item = k1.Item) Proveedor
,(SELECT prr.Nombre FROM Producto p INNER JOIN Proveedor prr ON prr.DNI = p.Proveedor WHERE p.Item = k1.Item) NombreProveedor
,(SELECT p.Stock_minimo FROM Producto p WHERE p.Item = k1.Item) Stock_minimo
,(SELECT p.Stock_maximo FROM Producto p WHERE p.Item = k1.Item) Stock_maximo
,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
FROM Kardex k1
WHERE ModoVenta = 'Desechable' AND (Item LIKE CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @Buscar ELSE 0 END OR Referencia LIKE @Buscar+'%' OR CodigoBarras LIKE @Buscar+'%'  OR Nombre LIKE @Buscar+'%')
AND k1.Item = (SELECT pd.Item FROM Producto pd WHERE pd.Item = k1.Item AND pd.Estado = 1)
GROUP BY 
  Item
 ,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
 UNION ALL
 --Item por QUESO
SELECT 
 Item
,(SELECT p.Referencia FROM Producto p WHERE p.Item = k1.Item) Referencia
,(SELECT p.CodigoBarras FROM Producto p WHERE p.Item = k1.Item) CodigoBarras
,(SELECT p.Nombre FROM Producto p WHERE p.Item = k1.Item) Nombre
,(SELECT p.Descripcion FROM Producto p WHERE p.Item = k1.Item) Descripcion
,SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) Stock
,0 StockSubcantidad
,0 StockSobres
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) CostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) PrecioVenta
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalCostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalPrecioVenta
,0 ValorSubcantidad
,0 TotalPrecioVentaSubCantidad
,0 ValorSobre
,0 TotalPrecioVentaSobres
,(SELECT p.IVA FROM Producto p WHERE p.Item = k1.Item) IVA
,(SELECT um.Nombre FROM Producto p INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida WHERE p.Item = k1.Item) UnidadMedida
,(SELECT m.Nombre FROM Producto p INNER JOIN Marca m ON m.Codigo = p.Marca WHERE p.Item = k1.Item) Marca
,(SELECT ub.Nombre FROM Producto p INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion WHERE p.Item = k1.Item) Ubicacion
,(SELECT slp.Nombre FROM Producto p INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para WHERE p.Item = k1.Item) SalidaPara
,(SELECT ct.Nombre FROM Producto p INNER JOIN Categoria ct ON ct.Codigo = p.Categoria WHERE p.Item = k1.Item) Categoria
,(SELECT p.Proveedor FROM Producto p WHERE p.Item = k1.Item) Proveedor
,(SELECT prr.Nombre FROM Producto p INNER JOIN Proveedor prr ON prr.DNI = p.Proveedor WHERE p.Item = k1.Item) NombreProveedor
,(SELECT p.Stock_minimo FROM Producto p WHERE p.Item = k1.Item) Stock_minimo
,(SELECT p.Stock_maximo FROM Producto p WHERE p.Item = k1.Item) Stock_maximo
,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
FROM Kardex k1
WHERE ModoVenta = 'Queso' AND (Item LIKE CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @Buscar ELSE 0 END OR Referencia LIKE @Buscar+'%' OR CodigoBarras LIKE @Buscar+'%' OR Nombre LIKE @Buscar+'%')
AND k1.Item = (SELECT pd.Item FROM Producto pd WHERE pd.Item = k1.Item AND pd.Estado = 1)
GROUP BY 
 Item
 ,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
END
ELSE
BEGIN
--Item por UNIDAD
SELECT 
 Item
,(SELECT p.Referencia FROM Producto p WHERE p.Item = k1.Item) Referencia
,(SELECT p.CodigoBarras FROM Producto p WHERE p.Item = k1.Item) CodigoBarras
,(SELECT p.Nombre FROM Producto p WHERE p.Item = k1.Item) Nombre
,(SELECT p.Descripcion FROM Producto p WHERE p.Item = k1.Item) Descripcion
,SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) Stock
,0 StockSubcantidad
,0 StockSobres
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) CostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) PrecioVenta
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalCostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalPrecioVenta
,0 ValorSubcantidad
,0 TotalPrecioVentaSubCantidad
,0 ValorSobre
,0 TotalPrecioVentaSobres
,(SELECT p.IVA FROM Producto p WHERE p.Item = k1.Item) IVA
,(SELECT um.Nombre FROM Producto p INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida WHERE p.Item = k1.Item) UnidadMedida
,(SELECT m.Nombre FROM Producto p INNER JOIN Marca m ON m.Codigo = p.Marca WHERE p.Item = k1.Item) Marca
,(SELECT ub.Nombre FROM Producto p INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion WHERE p.Item = k1.Item) Ubicacion
,(SELECT slp.Nombre FROM Producto p INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para WHERE p.Item = k1.Item) SalidaPara
,(SELECT ct.Nombre FROM Producto p INNER JOIN Categoria ct ON ct.Codigo = p.Categoria WHERE p.Item = k1.Item) Categoria
,(SELECT p.Proveedor FROM Producto p WHERE p.Item = k1.Item) Proveedor
,(SELECT prr.Nombre FROM Producto p INNER JOIN Proveedor prr ON prr.DNI = p.Proveedor WHERE p.Item = k1.Item) NombreProveedor
,(SELECT p.Stock_minimo FROM Producto p WHERE p.Item = k1.Item) Stock_minimo
,(SELECT p.Stock_maximo FROM Producto p WHERE p.Item = k1.Item) Stock_maximo
,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
FROM Kardex k1
WHERE ModoVenta = 'Unidad'  AND (Item = CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @Buscar ELSE 0 END OR Referencia = @Buscar OR CodigoBarras = @Buscar OR Nombre = @Buscar)
AND k1.Item = (SELECT pd.Item FROM Producto pd WHERE pd.Item = k1.Item AND pd.Estado = 1)
GROUP BY 
 Item
 ,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
UNION ALL
--Item por Pesaje
SELECT 
Item
,(SELECT p.Referencia FROM Producto p WHERE p.Item = k1.Item) Referencia
,(SELECT p.CodigoBarras FROM Producto p WHERE p.Item = k1.Item) CodigoBarras
,(SELECT p.Nombre FROM Producto p WHERE p.Item = k1.Item) Nombre
,(SELECT p.Descripcion FROM Producto p WHERE p.Item = k1.Item) Descripcion
,SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) Stock
,SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) StockSubcantidad
,0 StockSobres
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) CostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) PrecioVenta
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalCostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalPrecioVenta
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) ValorSubcantidad
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) * (SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END)) TotalPrecioVentaSubCantidad
,0 ValorSobre
,0 TotalPrecioVentaSobres
,(SELECT p.IVA FROM Producto p WHERE p.Item = k1.Item) IVA
,(SELECT um.Nombre FROM Producto p INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida WHERE p.Item = k1.Item) UnidadMedida
,(SELECT m.Nombre FROM Producto p INNER JOIN Marca m ON m.Codigo = p.Marca WHERE p.Item = k1.Item) Marca
,(SELECT ub.Nombre FROM Producto p INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion WHERE p.Item = k1.Item) Ubicacion
,(SELECT slp.Nombre FROM Producto p INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para WHERE p.Item = k1.Item) SalidaPara
,(SELECT ct.Nombre FROM Producto p INNER JOIN Categoria ct ON ct.Codigo = p.Categoria WHERE p.Item = k1.Item) Categoria
,(SELECT p.Proveedor FROM Producto p WHERE p.Item = k1.Item) Proveedor
,(SELECT prr.Nombre FROM Producto p INNER JOIN Proveedor prr ON prr.DNI = p.Proveedor WHERE p.Item = k1.Item) NombreProveedor
,(SELECT p.Stock_minimo FROM Producto p WHERE p.Item = k1.Item) Stock_minimo
,(SELECT p.Stock_maximo FROM Producto p WHERE p.Item = k1.Item) Stock_maximo
,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
FROM Kardex k1
WHERE ModoVenta = 'Pesaje'  AND (Item = CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @Buscar ELSE 0 END OR Referencia = @Buscar OR CodigoBarras = @Buscar OR Nombre = @Buscar)
AND k1.Item = (SELECT pd.Item FROM Producto pd WHERE pd.Item = k1.Item AND pd.Estado = 1)
GROUP BY 
  Item
 ,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
UNION ALL
--Item por Multi
SELECT 
Item
,(SELECT p.Referencia FROM Producto p WHERE p.Item = k1.Item) Referencia
,(SELECT p.CodigoBarras FROM Producto p WHERE p.Item = k1.Item) CodigoBarras
,(SELECT p.Nombre FROM Producto p WHERE p.Item = k1.Item) Nombre
,(SELECT p.Descripcion FROM Producto p WHERE p.Item = k1.Item) Descripcion
,SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) Stock
,SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) StockSubcantidad
,Sobres * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) StockSobres
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) CostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) PrecioVenta
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalCostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalPrecioVenta
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) ValorSubcantidad
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) * (SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END)) TotalPrecioVentaSubCantidad
,(SELECT p.ValorSobre FROM Producto p WHERE p.Item = k1.Item) ValorSobre
,(SELECT p.ValorSobre FROM Producto p WHERE p.Item = k1.Item) * (Sobres * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END)) TotalPrecioVentaSobres
,(SELECT p.IVA FROM Producto p WHERE p.Item = k1.Item) IVA
,(SELECT um.Nombre FROM Producto p INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida WHERE p.Item = k1.Item) UnidadMedida
,(SELECT m.Nombre FROM Producto p INNER JOIN Marca m ON m.Codigo = p.Marca WHERE p.Item = k1.Item) Marca
,(SELECT ub.Nombre FROM Producto p INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion WHERE p.Item = k1.Item) Ubicacion
,(SELECT slp.Nombre FROM Producto p INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para WHERE p.Item = k1.Item) SalidaPara
,(SELECT ct.Nombre FROM Producto p INNER JOIN Categoria ct ON ct.Codigo = p.Categoria WHERE p.Item = k1.Item) Categoria
,(SELECT p.Proveedor FROM Producto p WHERE p.Item = k1.Item) Proveedor
,(SELECT prr.Nombre FROM Producto p INNER JOIN Proveedor prr ON prr.DNI = p.Proveedor WHERE p.Item = k1.Item) NombreProveedor
,(SELECT p.Stock_minimo FROM Producto p WHERE p.Item = k1.Item) Stock_minimo
,(SELECT p.Stock_maximo FROM Producto p WHERE p.Item = k1.Item) Stock_maximo
,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
FROM Kardex k1
WHERE ModoVenta = 'Multi' AND (Item = CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @Buscar ELSE 0 END OR Referencia = @Buscar OR CodigoBarras = @Buscar OR Nombre = @Buscar)
AND k1.Item = (SELECT pd.Item FROM Producto pd WHERE pd.Item = k1.Item AND pd.Estado = 1)
GROUP BY 
 Item
,SubCantidad
,Sobres
,k1.ModoVenta
UNION ALL
--Item por Pesaje
SELECT 
Item
,(SELECT p.Referencia FROM Producto p WHERE p.Item = k1.Item) Referencia
,(SELECT p.CodigoBarras FROM Producto p WHERE p.Item = k1.Item) CodigoBarras
,(SELECT p.Nombre FROM Producto p WHERE p.Item = k1.Item) Nombre
,(SELECT p.Descripcion FROM Producto p WHERE p.Item = k1.Item) Descripcion
,SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) Stock
,SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) StockSubcantidad
,0 StockSobres
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) CostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) PrecioVenta
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalCostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalPrecioVenta
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) ValorSubcantidad
,(SELECT p.ValorSubcantidad FROM Producto p WHERE p.Item = k1.Item) * (SubCantidad * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END)) TotalPrecioVentaSubCantidad
,0 ValorSobre
,0 TotalPrecioVentaSobres
,(SELECT p.IVA FROM Producto p WHERE p.Item = k1.Item) IVA
,(SELECT um.Nombre FROM Producto p INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida WHERE p.Item = k1.Item) UnidadMedida
,(SELECT m.Nombre FROM Producto p INNER JOIN Marca m ON m.Codigo = p.Marca WHERE p.Item = k1.Item) Marca
,(SELECT ub.Nombre FROM Producto p INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion WHERE p.Item = k1.Item) Ubicacion
,(SELECT slp.Nombre FROM Producto p INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para WHERE p.Item = k1.Item) SalidaPara
,(SELECT ct.Nombre FROM Producto p INNER JOIN Categoria ct ON ct.Codigo = p.Categoria WHERE p.Item = k1.Item) Categoria
,(SELECT p.Proveedor FROM Producto p WHERE p.Item = k1.Item) Proveedor
,(SELECT prr.Nombre FROM Producto p INNER JOIN Proveedor prr ON prr.DNI = p.Proveedor WHERE p.Item = k1.Item) NombreProveedor
,(SELECT p.Stock_minimo FROM Producto p WHERE p.Item = k1.Item) Stock_minimo
,(SELECT p.Stock_maximo FROM Producto p WHERE p.Item = k1.Item) Stock_maximo
,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
FROM Kardex k1
WHERE ModoVenta = 'Desechable'  AND (Item = CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @Buscar ELSE 0 END OR Referencia = @Buscar OR CodigoBarras = @Buscar OR Nombre = @Buscar)
AND k1.Item = (SELECT pd.Item FROM Producto pd WHERE pd.Item = k1.Item AND pd.Estado = 1)
GROUP BY 
  Item
 ,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
 UNION ALL
 --Item por QUESO
SELECT 
 Item
,(SELECT p.Referencia FROM Producto p WHERE p.Item = k1.Item) Referencia
,(SELECT p.CodigoBarras FROM Producto p WHERE p.Item = k1.Item) CodigoBarras
,(SELECT p.Nombre FROM Producto p WHERE p.Item = k1.Item) Nombre
,(SELECT p.Descripcion FROM Producto p WHERE p.Item = k1.Item) Descripcion
,SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) Stock
,0 StockSubcantidad
,0 StockSobres
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) CostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) PrecioVenta
,(SELECT p.CostoCalculado FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalCostoCalculado
,(SELECT p.PrecioVenta FROM Producto p WHERE p.Item = k1.Item) * SUM(CASE WHEN movimiento = 'Salida -' THEN Cantidad * -1 ELSE Cantidad END) TotalPrecioVenta
,0 ValorSubcantidad
,0 TotalPrecioVentaSubCantidad
,0 ValorSobre
,0 TotalPrecioVentaSobres
,(SELECT p.IVA FROM Producto p WHERE p.Item = k1.Item) IVA
,(SELECT um.Nombre FROM Producto p INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida WHERE p.Item = k1.Item) UnidadMedida
,(SELECT m.Nombre FROM Producto p INNER JOIN Marca m ON m.Codigo = p.Marca WHERE p.Item = k1.Item) Marca
,(SELECT ub.Nombre FROM Producto p INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion WHERE p.Item = k1.Item) Ubicacion
,(SELECT slp.Nombre FROM Producto p INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para WHERE p.Item = k1.Item) SalidaPara
,(SELECT ct.Nombre FROM Producto p INNER JOIN Categoria ct ON ct.Codigo = p.Categoria WHERE p.Item = k1.Item) Categoria
,(SELECT p.Proveedor FROM Producto p WHERE p.Item = k1.Item) Proveedor
,(SELECT prr.Nombre FROM Producto p INNER JOIN Proveedor prr ON prr.DNI = p.Proveedor WHERE p.Item = k1.Item) NombreProveedor
,(SELECT p.Stock_minimo FROM Producto p WHERE p.Item = k1.Item) Stock_minimo
,(SELECT p.Stock_maximo FROM Producto p WHERE p.Item = k1.Item) Stock_maximo
,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
FROM Kardex k1
WHERE ModoVenta = 'Queso'  AND (Item = CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @Buscar ELSE 0 END OR Referencia = @Buscar OR CodigoBarras = @Buscar OR Nombre = @Buscar)
AND k1.Item = (SELECT pd.Item FROM Producto pd WHERE pd.Item = k1.Item AND pd.Estado = 1)
GROUP BY 
 Item
 ,k1.SubCantidad
,k1.Sobres
,k1.ModoVenta
END

GO

ALTER PROCEDURE  [dbo].[sp_consultar_producto]
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
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.CostoCalculado,p.PrecioVenta,p.CodigoBarras,
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
	WHERE p.Referencia = @Referencia AND p.Estado = 1
	END

	IF(@v_tipo_consulta = 'Validar_codigo_barras')
	BEGIN
	SELECT p.Item,p.Referencia,p.Nombre,p.Descripcion,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.CostoCalculado,p.PrecioVenta,p.CodigoBarras,
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
	WHERE p.CodigoBarras = @Codigo_barras AND p.Estado = 1
	END
	
	IF(@v_tipo_consulta = 'Validar_Item')
	BEGIN
	SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.CostoCalculado,p.PrecioVenta,p.CodigoBarras,
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
	WHERE p.Item = @Item AND p.Estado = 1
	END
	
	IF(@v_tipo_consulta = 'Buscar_consecutivo_item')
	BEGIN
	SELECT ISNULL(MAX(Item),0) + 1 item FROM Producto WHERE Estado = 1
	END
	
	IF(@v_tipo_consulta = 'Buscar_nombre')
	BEGIN
	SELECT Nombre FROM Producto
	WHERE Nombre LIKE @v_buscar+'%' AND Estado = 1
	GROUP BY Nombre
	END
	
	IF(@v_tipo_consulta = 'Buscar_data_producto')
	BEGIN
	SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.CostoCalculado,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo,
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = p.Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = p.Item) Stock,
	((SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = p.Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = p.Item)) * p.SubCantidad stockSubcantidad,
	((SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = p.Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = p.Item)) * p.Sobres stockSobres
	,prv.Nombre Nom_proveedor,p.DescuentoProveedor ,p.FechaVencimiento
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	INNER JOIN Proveedor prv ON prv.DNI = p.Proveedor
	WHERE (p.Item LIKE @v_buscar+'%' OR p.Referencia LIKE @v_buscar+'%' OR p.CodigoBarras LIKE @v_buscar+'%' OR p.Nombre LIKE @v_buscar+'%') 
	END
	
	IF(@v_tipo_consulta = 'Buscar_data_producto_exacto_item')
	BEGIN
	SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.Costo,p.CostoCalculado,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo,
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = @Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = @Item) Stock,
	((SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = @Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = @Item)) * p.SubCantidad stockSubcantidad,
	((SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = @Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = @Item)) * p.Sobres stockSobres
	,prv.Nombre Nom_proveedor,p.DescuentoProveedor ,ISNULL((SELECT MIN(fv.FechaVecimiento) FROM FechasVencimiento fv WHERE fv.Item = p.Item ),'') FechaVencimiento
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	INNER JOIN Proveedor prv ON prv.DNI = p.Proveedor
	WHERE p.Item =  @Item
	END
	
	IF(@v_tipo_consulta = 'Buscar_data_producto_exacto')
	BEGIN
	SET @v_variable = (SELECT ISNUMERIC(@v_buscar))
	IF(@v_variable = 1)
	BEGIN
	IF(CONVERT(numeric,@v_buscar) < 2147483647)
	BEGIN
		SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
		P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
		m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.CostoCalculado,p.PrecioVenta,p.CodigoBarras,
		p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
		p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
		p.Stock_minimo,p.Stock_maximo,p.DescuentoProveedor
		FROM Producto p
		INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
		INNER JOIN Estado est ON est.Codigo = p.Estado
		INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
		INNER JOIN Marca m ON m.Codigo = p.Marca
		INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
		INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
		WHERE (p.Item = @v_buscar OR p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar OR p.Nombre = @v_buscar)
	END
	END
	END

	IF(@v_tipo_consulta = 'Buscar_data_producto_venta')
	BEGIN
	SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.CostoCalculado,p.PrecioVenta,p.CodigoBarras,
	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	p.Stock_minimo,p.Stock_maximo,
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = p.Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = p.Item) Stock,
	((SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = p.Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = p.Item)) * p.SubCantidad stockSubcantidad,
	((SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = p.Item) -
	(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = p.Item)) * p.Sobres stockSobres
	,prv.Nombre Nom_proveedor,p.DescuentoProveedor ,p.FechaVencimiento
	FROM Producto p
	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	INNER JOIN Estado est ON est.Codigo = p.Estado
	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	INNER JOIN Marca m ON m.Codigo = p.Marca
	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	INNER JOIN Proveedor prv ON prv.DNI = p.Proveedor
	WHERE (p.Item LIKE @v_buscar+'%' OR p.Referencia LIKE @v_buscar+'%' OR p.CodigoBarras LIKE @v_buscar+'%' OR p.Nombre LIKE @v_buscar+'%') 
	AND p.Estado = 1
	END

	IF(@v_tipo_consulta = 'Buscar_data_producto_exacto_venta')
	BEGIN
	SET @v_variable = (SELECT ISNUMERIC(@v_buscar))
	IF(@v_variable = 1)
	BEGIN
	IF(CONVERT(numeric,@v_buscar) < 2147483647)
	BEGIN
		SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
		P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
		m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.CostoCalculado,p.PrecioVenta,p.CodigoBarras,
		p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
		p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
		p.Stock_minimo,p.Stock_maximo,p.DescuentoProveedor,
		(SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Entrada +' AND Item = p.Item) -
	    (SELECT ISNULL(SUM(Cantidad),0)  FROM Kardex WHERE movimiento = 'Salida -' AND Item = p.Item) Stock
		FROM Producto p
		INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
		INNER JOIN Estado est ON est.Codigo = p.Estado
		INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
		INNER JOIN Marca m ON m.Codigo = p.Marca
		INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
		INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
		WHERE (p.Item = @v_buscar OR p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar OR p.Nombre = @v_buscar) AND p.Estado = 1
	END
	END
	END
	
	--SELECT p.Item,p.Referencia,p.Descripcion,p.Nombre,p.IVA,p.UnidadMedida,um.Nombre Nombre_Unidad_medida,p.Medida,
	--	P.Estado,est.Nombre Nombre_Estado,p.Categoria,ct.Nombre Nombre_Categoria,P.Marca,
	--	m.Nombre Nombre_Marca,p.Proveedor,p.ModoVenta,p.Cantidad,p.CostoCalculado,p.PrecioVenta,p.CodigoBarras,
	--	p.SubCantidad,p.ValorSubcantidad,p.Sobres,p.ValorSobre,p.Foto,
	--	p.movimiento,p.Ubicacion,ub.Nombre Nombre_ubicacion,p.Salida_para,slp.Nombre Nombre_Salida_para,
	--	p.Stock_minimo,p.Stock_maximo,p.DescuentoProveedor
	--	FROM Producto p
	--	INNER JOIN UnidadMedida um ON um.Codigo = p.UnidadMedida
	--	INNER JOIN Estado est ON est.Codigo = p.Estado
	--	INNER JOIN Categoria ct ON ct.Codigo = p.Categoria
	--	INNER JOIN Marca m ON m.Codigo = p.Marca
	--	INNER JOIN Ubicacion ub ON ub.Codigo = p.Ubicacion
	--	INNER JOIN SalidaPara slp ON slp.Codigo = p.Salida_para
	--	WHERE p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar OR p.Nombre = @v_buscar AND p.Estado = 1

	



