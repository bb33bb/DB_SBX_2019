SELECT 
c.CodigoProducto,p.Nombre,M.Nombre ModoVenta 
FROM Producto p
LEFT JOIN Compras c ON c.CodigoProducto = p.ID
INNER JOIN ModoVenta M ON M.ID = P.ModoVenta
WHERE  c.CodigoProducto IS NULL
GROUP  BY p.ID,CodigoProducto,P.Nombre,M.Nombre,P.ModoVenta
ORDER BY P.ModoVenta
