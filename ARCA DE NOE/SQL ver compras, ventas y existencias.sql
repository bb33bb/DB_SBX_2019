

SELECT 
C.CodigoProducto,p.Nombre,SUM(c.Cantidad) Compras,ISNULL(SUM(V.Cantidad),0) Ventas,
SUM(c.Cantidad) - ISNULL(SUM(V.Cantidad),0) Existencia
FROM compras C
LEFT JOIN Venta V on c.CodigoProducto = V.CodigoProducto
INNER JOIN Producto p ON p.ID = c.CodigoProducto
GROUP BY C.CodigoProducto,p.Nombre
order by SUM(V.Cantidad)




