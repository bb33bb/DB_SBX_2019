CREATE PROC SP_REPORTE_GANANCIAS_PERDIDAS
@FechaInici AS VARCHAR(max),
@FechaFin AS VARCHAR(max)
AS
--Reporte de Ventas Directas
SELECT 
Producto,p.CodigoBarras,p.Referencia,p.Nombre,p.Descripcion,v.Cantidad,(v.Costo * v.Cantidad) CostoTotal,(v.PrecioVenta * v.Cantidad) SubTotal,
(v.PrecioVenta * v.Cantidad) * (descuento/100) ValorDescuento,
((v.PrecioVenta * v.Cantidad) - ((v.PrecioVenta * v.Cantidad) * (descuento/100))) Total,
((v.PrecioVenta * v.Cantidad) - ((v.PrecioVenta * v.Cantidad) * (descuento/100))) 
-
(v.Costo * v.Cantidad) Resultado,'V Directa' Modulo
FROM Venta v
INNER JOIN Producto p ON p.Item = v.Producto
WHERE Domicilio IS NULL AND SistemaSeparado IS NULL
AND CONVERT(date,v.Fecha) BETWEEN @FechaInici AND @FechaFin

UNION ALL

--Reporte de Ventas Domicilios
SELECT 
Producto,p.CodigoBarras,p.Referencia,p.Nombre,p.Descripcion,v.Cantidad,(v.Costo * v.Cantidad) CostoTotal,(v.PrecioVenta * v.Cantidad) SubTotal,
(v.PrecioVenta * v.Cantidad) * (descuento/100) ValorDescuento,
((v.PrecioVenta * v.Cantidad) - ((v.PrecioVenta * v.Cantidad) * (descuento/100))) Total,
((v.PrecioVenta * v.Cantidad) - ((v.PrecioVenta * v.Cantidad) * (descuento/100))) 
-
(v.Costo * v.Cantidad) Resultado,'V Domicilio' Modulo
FROM Venta v
INNER JOIN Producto p ON p.Item = v.Producto
INNER JOIN Domicilio d ON d.Codigo = v.Domicilio
WHERE Domicilio IS NOT NULL AND d.Estado = 'Pago'
AND CONVERT(date,v.Fecha) BETWEEN @FechaInici AND @FechaFin

