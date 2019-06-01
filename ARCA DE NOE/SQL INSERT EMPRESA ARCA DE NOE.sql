--Registro compañia ARCA DE NOE
TRUNCATE TABLE EMPRESA
GO
INSERT INTO Empresa
SELECT
DNI,RazonSocial,'Palmira',Direccion,Telefono,Celular,Email,SitioWeb,'',Impresora,Logo,0,10000,'',100,'F' 
FROM SBX_ESTANDAR.dbo.COMPANIA
