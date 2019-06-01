create PROC SP_PRECIOS_COSTOS_CODIGO_BARRAS_
AS
declare @Contador AS int, @Producto as varchar(100), @contador2 int 
declare  @tabla table (item varchar(100),codigoBarras varchar(100))

insert into @tabla
--select p.Item,CodigoBarras from Compras c
--inner join Producto p on p.ID = c.CodigoProducto
--where CodigoBarras = '' and p.ModoVenta = 2
--group by p.Item,CodigoBarras
--union all
select p.Item,CodigoBarras from Compras c
inner join Producto p on p.ID = c.CodigoProducto
where CodigoBarras != '' and p.ModoVenta = 2
group by p.Item,CodigoBarras


declare @tabla2 table(codigoProducto varchar(200),item varchar(200),codigoBarras varchar(200),Nombre varchar(200),
Referencia varchar(200),Costofinal varchar(200),margenFinal varchar(200),precioVenta varchar(200),iva varchar(200)
,modoVenta varchar(200),unMed varchar(200),subcantidad varchar(200),unidadesEnsobre varchar(200),valorUnidad varchar(200),valorSobres varchar(200))

set @Contador = 1

while @Contador = 1 
begin
	 set @contador2 = (select COUNT(*) from @tabla)
	 if(@contador2 > 0)
	 begin 
	 set @Producto = (SELECT TOP(1) codigoBarras  from @tabla where codigoBarras != '')

	insert into @tabla2
	exec SP_PRODUCTO_VENTA  @Producto
	set @Contador = 1 
	delete from @tabla where codigoBarras = @Producto
	 end
	 else
	 begin
	 set @Contador = 0
	 end
end

select * from @tabla2