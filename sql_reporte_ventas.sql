
SELECT 
p.Item
,p.CodigoBarras
,p.Referencia
,p.Nombre 
,p.ModoVenta
,v.UM
,v.Cantidad
,v.Costo
,v.PrecioVenta
,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
(v.Cantidad * p.SubCantidad) * v.Costo
ELSE
CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
(v.Cantidad * p.Sobres) * v.Costo
ELSE
CASE WHEN v.ModoVenta = 'Pesaje' THEN
(v.Cantidad * p.SubCantidad) * v.Costo
ELSE
CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' THEN
v.Cantidad  * v.Costo
END
END
END
END Costo
,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
ELSE
CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
(v.Cantidad * p.Sobres) *  v.PrecioVenta
ELSE
CASE WHEN v.ModoVenta = 'Pesaje' THEN
(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
ELSE
CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' THEN
v.Cantidad  *  v.PrecioVenta
END
END
END
END PrecioVenta
FROM 
Venta v
INNER JOIN Producto p ON p.Item = v.Producto

