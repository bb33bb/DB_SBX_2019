USE [master]
GO
/****** Object:  Database [DB_SBX]    Script Date: 12/11/2019 23:14:30 ******/
CREATE DATABASE [DB_SBX]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_SBX', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_SBX.mdf' , SIZE = 8384KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_SBX_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_SBX_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_SBX] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_SBX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_SBX] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_SBX] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_SBX] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_SBX] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_SBX] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_SBX] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_SBX] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_SBX] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_SBX] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_SBX] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_SBX] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_SBX] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_SBX] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_SBX] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_SBX] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_SBX] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_SBX] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_SBX] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_SBX] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_SBX] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_SBX] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_SBX] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_SBX] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_SBX] SET  MULTI_USER 
GO
ALTER DATABASE [DB_SBX] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_SBX] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_SBX] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_SBX] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_SBX] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB_SBX]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLeeClave]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnLeeClave] 
(
    @clave VARCHAR(8000)
)
RETURNS VARCHAR(25)
AS
BEGIN
    
    
    DECLARE @pass AS VARCHAR(25)
    ------------------------------------
    ------------------------------------
    --Se descifra el campo aplicandole la misma llave con la que se cifro password
    SET @pass = DECRYPTBYPASSPHRASE('password',@clave)
    ------------------------------------
    ------------------------------------    
    RETURN @pass

END

GO
/****** Object:  Table [dbo].[AbonoSistemaSeparado]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbonoSistemaSeparado](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[ValorAbono] [money] NULL,
	[SistemaSeparado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bit_Kardex]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bit_Kardex](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Accion] [varchar](300) NULL,
	[CodigoMovimiento] [varchar](20) NULL,
	[Item] [varchar](5) NULL,
	[Referencia] [varchar](20) NULL,
	[CodigoBarras] [varchar](20) NULL,
	[Nombre] [varchar](200) NULL,
	[Descripcion] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Caja](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Valor] [money] NULL,
	[TipoOperacion] [varchar](20) NULL,
	[Usuario] [int] NULL,
	[FechaRegistro] [datetime] NULL,
	[Codigo_Ultimo_cierre] [int] NULL,
	[Codigo_Ultima_venta] [int] NULL,
	[CodigoCaja] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cierre_Caja]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cierre_Caja](
	[Codigo] [int] NULL,
	[BaseCaja] [money] NULL,
	[Ingresos] [money] NULL,
	[Gastos] [money] NULL,
	[CierreCaja] [money] NULL,
	[ConteoDinero] [money] NULL,
	[TotalDiferencia] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [varchar](50) NULL,
	[Nombre] [varchar](200) NULL,
	[Ciudad] [varchar](100) NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[SitioWeb] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Domicilio](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Celular] [varchar](50) NULL,
	[Nombre] [varchar](100) NULL,
	[Direccion] [varchar](300) NULL,
	[Telefono] [varchar](50) NULL,
	[Mensajero] [varchar](50) NULL,
	[ValorDomicilio] [money] NULL,
	[Cliente] [int] NULL,
	[Estado] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresa](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [varchar](50) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[Ciudad] [varchar](100) NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[SitioWeb] [varchar](100) NULL,
	[licencia] [varchar](4000) NULL,
	[Impresora] [varchar](100) NULL,
	[Foto] [image] NULL,
	[ConsecutivoInicial] [float] NULL,
	[ConsecutivoFinal] [float] NULL,
	[Detalle] [varchar](300) NULL,
	[Alerta] [int] NULL,
	[NomDoc] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FechasVencimiento]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FechasVencimiento](
	[Item] [int] NULL,
	[FechaVecimiento] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gastos]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gastos](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GastosM]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GastosM](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[FechaRegistro] [datetime] NULL,
	[Gasto] [int] NULL,
	[Valor] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kardex]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kardex](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoVenta] [int] NULL,
	[Item] [int] NULL,
	[Referencia] [varchar](20) NULL,
	[Nombre] [varchar](200) NULL,
	[Descripcion] [varchar](200) NULL,
	[IVA] [float] NULL,
	[UnidadMedida] [varchar](200) NULL,
	[Medida] [float] NULL,
	[Estado] [int] NULL,
	[Categoria] [varchar](200) NULL,
	[Marca] [varchar](200) NULL,
	[DNIproveedor] [varchar](50) NULL,
	[Proveedor] [varchar](200) NULL,
	[ModoVenta] [varchar](10) NULL,
	[Ubicacion] [varchar](200) NOT NULL,
	[Salida_para] [varchar](200) NOT NULL,
	[Stock_minimo] [int] NOT NULL,
	[Stock_maximo] [int] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[Costo] [money] NULL,
	[PrecioVenta] [money] NULL,
	[CodigoBarras] [varchar](100) NULL,
	[SubCantidad] [float] NULL,
	[ValorSubcantidad] [money] NULL,
	[Sobres] [int] NULL,
	[ValorSobre] [money] NULL,
	[Usuario] [int] NULL,
	[FechaRegistro] [datetime] NULL,
	[Accion] [varchar](100) NULL,
	[movimiento] [varchar](100) NULL,
	[UM] [varchar](20) NULL,
	[DescuentoProveedor] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marca](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mensajero]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mensajero](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [varchar](50) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[Ciudad] [varchar](100) NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Modulo]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modulo](
	[codigo] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[DescripcionModulo] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Modulo_permiso]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modulo_permiso](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Modulo] [int] NULL,
	[Permiso] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permiso](
	[codigo] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[DescripcionPermiso] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[Item] [int] IDENTITY(1,1) NOT NULL,
	[Referencia] [varchar](20) NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Descripcion] [varchar](200) NULL,
	[IVA] [float] NOT NULL,
	[UnidadMedida] [int] NOT NULL,
	[Medida] [float] NOT NULL,
	[Estado] [int] NOT NULL,
	[Categoria] [int] NOT NULL,
	[Marca] [int] NOT NULL,
	[Proveedor] [varchar](50) NULL,
	[ModoVenta] [varchar](10) NOT NULL,
	[Ubicacion] [int] NOT NULL,
	[Salida_para] [int] NOT NULL,
	[Stock_minimo] [int] NOT NULL,
	[Stock_maximo] [int] NOT NULL,
	[Cantidad] [float] NULL,
	[Costo] [money] NOT NULL,
	[PrecioVenta] [money] NOT NULL,
	[CodigoBarras] [varchar](100) NULL,
	[SubCantidad] [float] NOT NULL,
	[ValorSubcantidad] [money] NOT NULL,
	[Sobres] [int] NOT NULL,
	[ValorSobre] [money] NOT NULL,
	[Foto] [image] NULL,
	[Usuario] [int] NULL,
	[FechaRegistro] [datetime] NULL,
	[movimiento] [varchar](100) NULL,
	[DescuentoProveedor] [float] NULL,
	[FechaVencimiento] [date] NULL,
	[CostoCalculado] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [varchar](50) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[Ciudad] [varchar](100) NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[SitioWeb] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[Codigo] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[DescripcionRol] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol_Modulo_Permiso]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol_Modulo_Permiso](
	[Rol] [int] NULL,
	[Modulo_permiso] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalidaPara]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalidaPara](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SistemaSeparado]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SistemaSeparado](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Valor] [money] NULL,
	[AbonoInicial] [money] NULL,
	[PeriodoPago] [varchar](20) NULL,
	[Suministrar] [varchar](20) NULL,
	[NumCuotas] [int] NULL,
	[ValorCuota] [money] NULL,
	[FechaPrimerPago] [date] NULL,
	[FechaVence] [date] NULL,
	[Cliente] [int] NULL,
	[Estado] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ubicacion](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UnidadMedida]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UnidadMedida](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [varchar](20) NULL,
	[Nombres] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Celular] [varchar](10) NULL,
	[Telefono] [varchar](10) NULL,
	[Email] [varchar](100) NULL,
	[FechaNacimiento] [date] NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
	[Estado] [varchar](10) NOT NULL,
	[Rol] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Venta](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[NombreDocumento] [varchar](50) NULL,
	[ConsecutivoDocumento] [float] NULL,
	[Producto] [int] NULL,
	[ModoVenta] [varchar](10) NULL,
	[UM] [varchar](20) NULL,
	[Cantidad] [float] NULL,
	[Costo] [money] NULL,
	[PrecioVenta] [money] NULL,
	[descuento] [float] NULL,
	[Efectivo] [money] NULL,
	[Tdebito] [money] NULL,
	[NumBaucherDebito] [varchar](30) NULL,
	[Tcredito] [money] NULL,
	[NumBaucherCredito] [varchar](30) NULL,
	[Cambio] [money] NULL,
	[Total] [money] NULL,
	[Proveedor] [varchar](50) NULL,
	[Cliente] [int] NULL,
	[Domicilio] [int] NULL,
	[SistemaSeparado] [int] NULL,
	[IVA] [float] NULL,
	[Usuario] [int] NULL,
	[DescuentoProveedor] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AbonoSistemaSeparado]  WITH CHECK ADD FOREIGN KEY([SistemaSeparado])
REFERENCES [dbo].[SistemaSeparado] ([Codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD FOREIGN KEY([Cliente])
REFERENCES [dbo].[Cliente] ([Codigo])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD FOREIGN KEY([Mensajero])
REFERENCES [dbo].[Mensajero] ([DNI])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[GastosM]  WITH CHECK ADD FOREIGN KEY([Gasto])
REFERENCES [dbo].[Gastos] ([codigo])
GO
ALTER TABLE [dbo].[Kardex]  WITH CHECK ADD FOREIGN KEY([Item])
REFERENCES [dbo].[Producto] ([Item])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([Categoria])
REFERENCES [dbo].[Categoria] ([Codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([Estado])
REFERENCES [dbo].[Estado] ([Codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([Marca])
REFERENCES [dbo].[Marca] ([Codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([Proveedor])
REFERENCES [dbo].[Proveedor] ([DNI])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([Salida_para])
REFERENCES [dbo].[SalidaPara] ([Codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([Ubicacion])
REFERENCES [dbo].[Ubicacion] ([Codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([UnidadMedida])
REFERENCES [dbo].[UnidadMedida] ([Codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rol_Modulo_Permiso]  WITH CHECK ADD FOREIGN KEY([Modulo_permiso])
REFERENCES [dbo].[Modulo_permiso] ([Codigo])
GO
ALTER TABLE [dbo].[Rol_Modulo_Permiso]  WITH CHECK ADD FOREIGN KEY([Rol])
REFERENCES [dbo].[Rol] ([Codigo])
GO
ALTER TABLE [dbo].[SistemaSeparado]  WITH CHECK ADD FOREIGN KEY([Cliente])
REFERENCES [dbo].[Cliente] ([Codigo])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([Rol])
REFERENCES [dbo].[Rol] ([Codigo])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([Cliente])
REFERENCES [dbo].[Cliente] ([Codigo])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([Domicilio])
REFERENCES [dbo].[Domicilio] ([Codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([Producto])
REFERENCES [dbo].[Producto] ([Item])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([Proveedor])
REFERENCES [dbo].[Proveedor] ([DNI])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([SistemaSeparado])
REFERENCES [dbo].[SistemaSeparado] ([Codigo])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAR_VENTAS]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [dbo].[SP_BUSCAR_VENTAS]
@TipoBusq AS VARCHAR(20),
@FechaInicio AS DATE,
@FechaFin AS DATE,
@Busqueda AS VARCHAR(MAX)
AS
IF(@Busqueda = '')
BEGIN
SELECT 
 v.Codigo
,V.Fecha
,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura
,p.Item
,p.Nombre
,p.Referencia
,p.CodigoBarras
,p.ModoVenta
,v.UM
,v.Cantidad
,v.Costo 
,v.PrecioVenta
,v.descuento
,v.PrecioVenta * v.descuento ValorDescuento
,v.Tdebito
,v.NumBaucherDebito
,v.Tcredito
,v.NumBaucherCredito
,v.Total
,v.Efectivo
,v.Cambio
,CONCAT(c.DNI,'-',c.Nombre) Cliente
,ISNULL(v.Domicilio,'') Domicilio
,CONCAT(us.Codigo,'-',us.NombreUsuario) Usuario
FROM Venta v
INNER JOIN Producto p ON p.Item = v.Producto
INNER JOIN Cliente c ON c.Codigo = v.Cliente
INNER JOIN Usuario us ON us.Codigo = v.Usuario
WHERE  CONVERT(date,v.Fecha) BETWEEN @FechaInicio AND @FechaFin
END
ELSE
BEGIN
IF(@TipoBusq = 'Contiene')
BEGIN
SELECT 
 v.Codigo
,V.Fecha
,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura
,p.Item
,p.Nombre
,p.Referencia
,p.CodigoBarras
,p.ModoVenta
,v.UM
,v.Cantidad
,v.Costo 
,v.PrecioVenta
,v.descuento
,v.PrecioVenta * v.descuento ValorDescuento
,v.Tdebito
,v.NumBaucherDebito
,v.Tcredito
,v.NumBaucherCredito
,v.Total
,v.Efectivo
,v.Cambio
,CONCAT(c.DNI,'-',c.Nombre) Cliente
,ISNULL(v.Domicilio,'') Domicilio
,CONCAT(us.Codigo,'-',us.NombreUsuario) Usuario
FROM Venta v
INNER JOIN Producto p ON p.Item = v.Producto
INNER JOIN Cliente c ON c.Codigo = v.Cliente
INNER JOIN Usuario us ON us.Codigo = v.Usuario
WHERE CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) LIKE @Busqueda+'%' 
OR 
Item LIKE CASE WHEN ISNUMERIC(@Busqueda) = 1 THEN @Busqueda ELSE 0 END 
AND CONVERT(date,v.Fecha) BETWEEN @FechaInicio AND @FechaFin
END
ELSE
BEGIN
SELECT 
 v.Codigo
,V.Fecha
,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura
,p.Item
,p.Nombre
,p.Referencia
,p.CodigoBarras
,p.ModoVenta
,v.UM
,v.Cantidad
,v.Costo 
,v.PrecioVenta
,v.descuento
,v.PrecioVenta * v.descuento ValorDescuento
,v.Tdebito
,v.NumBaucherDebito
,v.Tcredito
,v.NumBaucherCredito
,v.Total
,v.Efectivo
,v.Cambio
,CONCAT(c.DNI,'-',c.Nombre) Cliente
,ISNULL(v.Domicilio,'') Domicilio
,CONCAT(us.Codigo,'-',us.NombreUsuario) Usuario
FROM Venta v
INNER JOIN Producto p ON p.Item = v.Producto
INNER JOIN Cliente c ON c.Codigo = v.Cliente
INNER JOIN Usuario us ON us.Codigo = v.Usuario
WHERE CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) = @Busqueda
OR 
Item = CASE WHEN ISNUMERIC(@Busqueda) = 1 THEN @Busqueda ELSE 0 END
AND CONVERT(date,v.Fecha) BETWEEN @FechaInicio AND @FechaFin
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CALCULAR_INGRESOS]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [dbo].[SP_CALCULAR_INGRESOS]
@UltimoCierre AS VARCHAR(20),
	@UltimaVenta AS VARCHAR(20),
	@Usuario AS VARCHAR(20)
	AS
	DECLARE 
	@Ingresos AS MONEY,
	@Gastos AS MONEY
	DECLARE @TABLA AS TABLE(NombreDocumento VARCHAR(50),Consecutivo FLOAT, Total MONEY, TipoVenta VARCHAR(20))
	--INSERTAR INGRESOS SIN DOMICILIOS Y SEPARADOS
	INSERT INTO @TABLA
	SELECT NombreDocumento, ConsecutivoDocumento, Total, 'Venta directa' FROM Venta 
	WHERE (Domicilio IS NULL AND SistemaSeparado IS NULL) AND 
	(Fecha BETWEEN (CASE WHEN (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) IS NULL 
	THEN '1990-01-01' ELSE (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) END) AND 
	(SELECT v2.Fecha FROM Venta v2 WHERE v2.Codigo = @UltimaVenta AND v2.Usuario = @Usuario)  AND Usuario = @Usuario)
	GROUP BY NombreDocumento, ConsecutivoDocumento, Total

	--INSERTAR INGRESOS DOMICILIOS
	INSERT INTO @TABLA
	SELECT v.NombreDocumento, v.ConsecutivoDocumento, v.Total,'Venta Domicilio' FROM Venta v
	INNER JOIN Domicilio d ON d.Codigo = v.Domicilio
	WHERE d.Estado = 'Pago'
	GROUP BY NombreDocumento, ConsecutivoDocumento, Total
	--INSERTAR INGRESOS SISTEMA SEPARADO
	DECLARE @TABLA2 TABLE(Abonos MONEY)
	INSERT INTO @TABLA2
	SELECT ISNULL(SUM(ValorAbono),0) VlrAbono 
	FROM AbonoSistemaSeparado 
	WHERE
	(Fecha BETWEEN (CASE WHEN (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) IS NULL 
	THEN '1990-01-01' ELSE (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) END) AND 
	--(SELECT v2.Fecha FROM Venta v2 WHERE v2.Codigo = @UltimaVenta AND v2.Usuario = @Usuario)
	SYSDATETIME()
	)
	--INSERTAR GASTOS 
	DECLARE @TABLA3 TABLE(Gastos MONEY)
	INSERT INTO @TABLA3
	SELECT ISNULL(SUM(Valor),0) VlrGasto
	FROM GastosM 
	WHERE
	(FechaRegistro BETWEEN (CASE WHEN (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) IS NULL 
	THEN '1990-01-01' ELSE (SELECT c2.FechaRegistro FROM Caja c2 WHERE c2.Codigo = @UltimoCierre AND c2.Usuario = @Usuario) END) AND 
	--(SELECT v2.Fecha FROM Venta v2 WHERE v2.Codigo = @UltimaVenta AND v2.Usuario = @Usuario)
	SYSDATETIME()
	)
		
	SET @Ingresos = (SELECT ISNULL(SUM(Total),0) Ingresos FROM @TABLA)
	SET @Ingresos = @Ingresos + (SELECT ISNULL(SUM(Abonos),0) Abon FROM @TABLA2)
	SET @Gastos = (SELECT ISNULL(SUM(Gastos),0) Gastos FROM @TABLA3)

	DECLARE @TABLA4 TABLE(Ingresos MONEY,Gastos MONEY)
	INSERT INTO @TABLA4
	Values(@Ingresos,@Gastos)
	--Pasar a estado Procesado los domicilios pagos
	UPDATE Domicilio SET Estado = 'Procesado'
	WHERE Estado = 'Pago'
	SELECT * FROM @TABLA4



GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTA_ESTADO_PRODUCTOS]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [dbo].[SP_CONSULTA_ESTADO_PRODUCTOS]
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
/****** Object:  StoredProcedure [dbo].[sp_consulta_kardex]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE  [dbo].[sp_consulta_kardex]
	@Buscar AS VARCHAR(300),
	@FechaIni AS DATE,
	@FechaFin AS DATE,
	@Tipo_busqueda AS VARCHAR(300)
	AS
	IF(@Tipo_busqueda = 'Contiene')
	BEGIN
	SELECT Kardex.Codigo,FechaRegistro,movimiento,Item,Referencia,CodigoBarras,Nombre,
	ModoVenta,ISNULL(UM,'') UM,Cantidad,Costo,PrecioVenta,DNIproveedor,Proveedor,Accion,Usuario,ISNULL(u.NombreUsuario,'') NombreUsuario
	FROM Kardex
	LEFT JOIN Usuario u on u.Codigo = Kardex.Usuario
	WHERE (Item LIKE @Buscar+'%' OR Referencia LIKE @Buscar+'%' OR 
	CodigoBarras LIKE @Buscar+'%' OR Nombre LIKE @Buscar+'%') 
	AND CONVERT(date,FechaRegistro) BETWEEN @FechaIni AND @FechaFin
	END
	ELSE
	BEGIN
	SELECT Kardex.Codigo,FechaRegistro,movimiento,Item,Referencia,CodigoBarras,Nombre,
	ModoVenta,ISNULL(UM,'') UM,Cantidad,Costo,PrecioVenta,DNIproveedor,Proveedor,Accion,Usuario,ISNULL(u.NombreUsuario,'') NombreUsuario
	FROM Kardex
	LEFT JOIN Usuario u on u.Codigo = Kardex.Usuario
	WHERE (Item = CASE WHEN ISNUMERIC(@Buscar) = 1 THEN @buscar ELSE 0 END OR Referencia = @Buscar OR 
	CodigoBarras = @Buscar OR Nombre = @Buscar) 
	AND CONVERT(date,FechaRegistro) BETWEEN @FechaIni AND @FechaFin
	END



GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_caracteristicas_producto]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE  [dbo].[sp_consultar_caracteristicas_producto]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_categoria]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	--
	CREATE PROCEDURE  [dbo].[sp_consultar_categoria]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_cliente]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE PROC  [dbo].[sp_consultar_cliente]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_domicilio]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC  [dbo].[sp_consultar_domicilio]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_empresa]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC  [dbo].[sp_consultar_empresa]
	AS
	SELECT *,ISNULL((SELECT MAX(ConsecutivoDocumento) FROM Venta),0) ConsecutivoActual FROM Empresa



GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_estado]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	--
	CREATE PROCEDURE  [dbo].[sp_consultar_estado]
	AS
	SELECT * FROM Estado



GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_Marca]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	--
	CREATE PROCEDURE  [dbo].[sp_consultar_Marca]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_mensajero]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC  [dbo].[sp_consultar_mensajero]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_producto]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_consultar_producto]
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
	--	WHERE p.Referencia = @v_buscar OR p.CodigoBarras = @v_buscar OR p.Nombre = @v_buscar AND p.Estado = 


GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_productos_kardex]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	--------
	CREATE PROC  [dbo].[sp_consultar_productos_kardex]
@v_tipo_busqueda AS VARCHAR(MAX),
@v_buscar AS VARCHAR(MAX)
AS
IF @v_tipo_busqueda = 'Contiene'
BEGIN
SELECT k0.Item,
(SELECT k1.Referencia FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Referencia,
(SELECT k1.CodigoBarras FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) CodigoBarras,
(SELECT k1.Nombre FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Nombre,
(SELECT k1.Descripcion FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Descripcion,
ModoVenta,
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje' AND k1.UM = 'Bulto'),0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi' AND k1.UM = 'Caja'),0)
END
END
Stock,

SubCantidad 
*
(
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje' AND k1.UM != 'Bulto') ,0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi' AND k1.UM = 'UND P'),0)
END
END
) 
StockSubCantidad,

Sobres
*
(
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje' AND k1.UM != 'Bulto'),0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi' AND k1.UM = 'Sobre'),0)
END
END
) 
StockSobres,
(SELECT (k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100))) + (((k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100)))) * (k1.IVA/100)) FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Costo,
(SELECT k1.PrecioVenta FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) PrecioVenta,
(ISNULL((SELECT (k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100))) + (((k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100)))) * (k1.IVA/100)) FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item))
/
CASE WHEN ModoVenta != 'Unidad' THEN
(SELECT k1.SubCantidad FROM Kardex k1 WHERE (k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) AND k1.ModoVenta != 'Unidad')
END,0))
CostoSubCantidad,
(SELECT k1.ValorSubcantidad FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) ValorSubcantidad,
(ISNULL((SELECT (k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100))) + (((k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100)))) * (k1.IVA/100)) FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item))
/
CASE WHEN ModoVenta = 'Multi' THEN
(SELECT k1.Sobres FROM Kardex k1 WHERE (k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) AND k1.ModoVenta = 'Multi')
END,0))
CostoSobre,
(SELECT k1.ValorSobre FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) ValorSobre,
(SELECT k1.IVA FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) IVA,
(SELECT k1.UnidadMedida FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) UnidadMedida,
(SELECT k1.Categoria FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Categoria,
(SELECT k1.Marca FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Marca,
(SELECT ub.Nombre FROM Kardex k1 INNER JOIN Ubicacion ub ON ub.Codigo = k1.Ubicacion WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Ubicacion,
(SELECT slp.Nombre FROM Kardex k1 INNER JOIN SalidaPara slp ON slp.Codigo = k1.Salida_para WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Salida_para,
(SELECT k1.DNIproveedor FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) DNIproveedor,
(SELECT k1.Proveedor FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Proveedor,
(SELECT k1.Stock_minimo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Stock_minimo,
(SELECT k1.Stock_maximo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Stock_maximo
FROM Kardex k0
WHERE K0.Item LIKE @v_buscar+'%' OR K0.Referencia LIKE @v_buscar+'%' OR K0.CodigoBarras LIKE @v_buscar+'%' OR K0.Nombre LIKE @v_buscar+'%'
GROUP BY Item,ModoVenta,SubCantidad,Sobres
ORDER BY Item
END
ELSE
BEGIN
SELECT k0.Item,
(SELECT k1.Referencia FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Referencia,
(SELECT k1.CodigoBarras FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) CodigoBarras,
(SELECT k1.Nombre FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Nombre,
(SELECT k1.Descripcion FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Descripcion,
ModoVenta,
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje' )
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje' AND k1.UM = 'Bulto'),0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi' AND k1.UM = 'Caja'),0)
END
END
Stock,

SubCantidad 
*
(
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje' AND k1.UM != 'Bulto'),0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi' AND k1.UM = 'UND P'),0)
END
END
) 
StockSubCantidad,

Sobres
*
(
CASE WHEN ModoVenta = 'Unidad' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Unidad')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Unidad'),0)
ELSE
CASE WHEN ModoVenta = 'Pesaje' THEN
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Pesaje')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Pesaje' AND k1.UM != 'Bulto'),0)
ELSE
	(SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Entrada +') AND k1.ModoVenta = 'Multi')
	-
	ISNULL((SELECT SUM(k1.Cantidad) FROM Kardex k1 WHERE (k1.Item = k0.Item AND k1.movimiento = 'Salida -') AND k1.ModoVenta = 'Multi' AND k1.UM = 'Sobre'),0)
END
END
) 
StockSobres,
(SELECT (k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100))) + (((k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100)))) * (k1.IVA/100)) FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Costo,
(SELECT k1.PrecioVenta FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) PrecioVenta,
(ISNULL((SELECT (k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100))) + (((k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100)))) * (k1.IVA/100)) FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item))
/
CASE WHEN ModoVenta != 'Unidad' THEN
(SELECT k1.SubCantidad FROM Kardex k1 WHERE (k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) AND k1.ModoVenta != 'Unidad')
END,0))
CostoSubCantidad,
(SELECT k1.ValorSubcantidad FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) ValorSubcantidad,
(ISNULL((SELECT (k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100))) + (((k1.Costo - (k1.Costo * (k1.DescuentoProveedor/100)))) * (k1.IVA/100)) FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item))
/
CASE WHEN ModoVenta = 'Multi' THEN
(SELECT k1.Sobres FROM Kardex k1 WHERE (k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) AND k1.ModoVenta = 'Multi')
END,0))
CostoSobre,
(SELECT k1.ValorSobre FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) ValorSobre,
(SELECT k1.IVA FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) IVA,
(SELECT k1.UnidadMedida FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) UnidadMedida,
(SELECT k1.Categoria FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Categoria,
(SELECT k1.Marca FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Marca,
(SELECT ub.Nombre FROM Kardex k1 INNER JOIN Ubicacion ub ON ub.Codigo = k1.Ubicacion WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Ubicacion,
(SELECT slp.Nombre FROM Kardex k1 INNER JOIN SalidaPara slp ON slp.Codigo = k1.Salida_para WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Salida_para,
(SELECT k1.DNIproveedor FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) DNIproveedor,
(SELECT k1.Proveedor FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Proveedor,
(SELECT k1.Stock_minimo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Stock_minimo,
(SELECT k1.Stock_maximo FROM Kardex k1 WHERE k1.Item = Item AND k1.Codigo = (SELECT MAX(k2.Codigo) FROM Kardex k2 WHERE k2.Item = k0.Item)) Stock_maximo
FROM Kardex k0
WHERE K0.Item = CASE WHEN  ISNUMERIC(@v_buscar) = 1 THEN @v_buscar ELSE 0 END 
OR K0.Referencia = @v_buscar OR K0.CodigoBarras = @v_buscar OR K0.Nombre = @v_buscar
GROUP BY Item,ModoVenta,SubCantidad,Sobres
ORDER BY Item
END




GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_proveedor]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC  [dbo].[sp_consultar_proveedor]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_salida_para]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	--
	CREATE PROCEDURE  [dbo].[sp_consultar_salida_para]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_separados]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC  [dbo].[sp_consultar_separados]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_sistema_separado]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC  [dbo].[sp_consultar_sistema_separado]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_ubicacion]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	--
	CREATE PROCEDURE  [dbo].[sp_consultar_ubicacion]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_unidad_medida]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	--
	CREATE PROCEDURE  [dbo].[sp_consultar_unidad_medida]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_Ventas]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC  [dbo].[sp_consultar_Ventas]
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_Ventas2]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE PROC  [dbo].[sp_consultar_Ventas2]
			@v_buscar VARCHAR(300),
	@v_tipo_busqueda AS VARCHAR(20),
	@FechaIni AS DATE,
	@FechaFin AS DATE
	AS
	IF(@v_tipo_busqueda = 'Contiene')
	BEGIN
SELECT 
v.Codigo,v.Fecha,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura
,p.Item
,p.Referencia
,p.CodigoBarras
,p.Nombre 
,v.ModoVenta
,v.UM
,v.Cantidad
,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
(v.Cantidad * p.SubCantidad) * ((v.Costo - (v.Costo * (v.DescuentoProveedor/100))) + (((v.Costo - (v.Costo * (v.DescuentoProveedor/100)))) * (v.IVA/100)))
ELSE
CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
(v.Cantidad * p.Sobres) * ((v.Costo - (v.Costo * (v.DescuentoProveedor/100))) + (((v.Costo - (v.Costo * (v.DescuentoProveedor/100)))) * (v.IVA/100)))
ELSE
CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto' THEN
(v.Cantidad * p.SubCantidad) * ((v.Costo - (v.Costo * (v.DescuentoProveedor/100))) + (((v.Costo - (v.Costo * (v.DescuentoProveedor/100)))) * (v.IVA/100)))
ELSE
CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' THEN
v.Cantidad  * ((v.Costo - (v.Costo * (v.DescuentoProveedor/100))) + (((v.Costo - (v.Costo * (v.DescuentoProveedor/100)))) * (v.IVA/100)))
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
CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
ELSE
CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' THEN
v.Cantidad  *  v.PrecioVenta
END
END
END
END PrecioVenta
,v.descuento
,
(
(CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
ELSE
CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
(v.Cantidad * p.Sobres) *  v.PrecioVenta
ELSE
CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
ELSE
CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' THEN
v.Cantidad  *  v.PrecioVenta
END
END
END
END)
* 
(v.descuento/100)) ValorDescuento,
v.Efectivo,v.Tdebito,
	v.NumBaucherDebito,v.Tcredito,v.NumBaucherCredito,v.Cambio,v.Total,
	pr.DNI+'-'+pr.Nombre Proveedor,
	c.DNI +'-'+c.Nombre Cliente,CONCAT(d.Estado,' - ',d.Codigo,' - ',d.Celular,' - ',
	d.Nombre,' - ',d.Direccion,' - ',msj.DNI,' - ',msj.Nombre,' - ',d.ValorDomicilio) Domicilio, 
	CONCAT(sp.Estado,' - ',sp.Codigo,' - ',c2.DNI,' - ',c2.Nombre) SistemaSeparado
FROM 
Venta v
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
	SELECT 
v.Codigo,v.Fecha,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura
,p.Item
,p.Referencia
,p.CodigoBarras
,p.Nombre 
,v.ModoVenta
,v.UM
,v.Cantidad
,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
(v.Cantidad * p.SubCantidad) * ((v.Costo - (v.Costo * (v.DescuentoProveedor/100))) + (((v.Costo - (v.Costo * (v.DescuentoProveedor/100)))) * (v.IVA/100)))
ELSE
CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
(v.Cantidad * p.Sobres) * ((v.Costo - (v.Costo * (v.DescuentoProveedor/100))) + (((v.Costo - (v.Costo * (v.DescuentoProveedor/100)))) * (v.IVA/100)))
ELSE
CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto' THEN
(v.Cantidad * p.SubCantidad) * ((v.Costo - (v.Costo * (v.DescuentoProveedor/100))) + (((v.Costo - (v.Costo * (v.DescuentoProveedor/100)))) * (v.IVA/100)))
ELSE
CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' THEN
v.Cantidad  * ((v.Costo - (v.Costo * (v.DescuentoProveedor/100))) + (((v.Costo - (v.Costo * (v.DescuentoProveedor/100)))) * (v.IVA/100)))
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
CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
ELSE
CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' THEN
v.Cantidad  *  v.PrecioVenta
END
END
END
END PrecioVenta
,v.descuento
,
(
(CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
ELSE
CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
(v.Cantidad * p.Sobres) *  v.PrecioVenta
ELSE
CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
ELSE
CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' THEN
v.Cantidad  *  v.PrecioVenta
END
END
END
END)
* 
(v.descuento/100)) ValorDescuento,
v.Efectivo,v.Tdebito,
	v.NumBaucherDebito,v.Tcredito,v.NumBaucherCredito,v.Cambio,v.Total,
	pr.DNI+'-'+pr.Nombre Proveedor,
	c.DNI +'-'+c.Nombre Cliente,CONCAT(d.Estado,' - ',d.Codigo,' - ',d.Celular,' - ',
	d.Nombre,' - ',d.Direccion,' - ',msj.DNI,' - ',msj.Nombre,' - ',d.ValorDomicilio) Domicilio, 
	CONCAT(sp.Estado,' - ',sp.Codigo,' - ',c2.DNI,' - ',c2.Nombre) SistemaSeparado
FROM 
Venta v
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
/****** Object:  StoredProcedure [dbo].[SP_GANACIAS_PERDIDAS]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [dbo].[SP_GANACIAS_PERDIDAS]
@FechaIni AS DATE,
@FechaFin AS DATE,
@tipoBusqueda AS VARCHAR(100),
@Buscar AS VARCHAR(100)
AS
IF(@tipoBusqueda = 'Contiene')
BEGIN
	IF(ISNUMERIC(@Buscar) = 1)
	BEGIN
		SELECT 
		v.Codigo,v.Fecha,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura
		,p.Item
		,p.Referencia
		,p.CodigoBarras
		,p.Nombre 
		,v.ModoVenta
		,v.UM
		,v.Cantidad
		,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad)
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres)
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto' THEN
		(v.Cantidad * p.SubCantidad)
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad)
		END
		END
		END
		END
		END Cantidad_Exacta
		,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres) * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		END
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
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		END
		END
		END
		END
		END PrecioVenta
		,v.descuento
		,
		(
		(CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		END
		END
		END
		END
		END)
		* 
		(v.descuento/100)) ValorDescuento,
		v.Efectivo,v.Tdebito,
			v.NumBaucherDebito,v.Tcredito,v.NumBaucherCredito,v.Cambio,v.Total,
			pr.DNI+'-'+pr.Nombre Proveedor,
			c.DNI +'-'+c.Nombre Cliente,CONCAT(d.Estado,' - ',d.Codigo,' - ',d.Celular,' - ',
			d.Nombre,' - ',d.Direccion,' - ',msj.DNI,' - ',msj.Nombre,' - ',d.ValorDomicilio) Domicilio, 
			CONCAT(sp.Estado,' - ',sp.Codigo,' - ',c2.DNI,' - ',c2.Nombre) SistemaSeparado
		FROM 
		Venta v
		INNER JOIN Producto p ON p.Item = v.Producto
		INNER JOIN Proveedor pr ON pr.DNI = v.Proveedor
		INNER JOIN Cliente c ON c.Codigo = v.Cliente
		LEFT JOIN Domicilio d ON d.Codigo = v.Domicilio
		LEFT JOIN SistemaSeparado sp ON sp.Codigo = v.SistemaSeparado
		LEFT JOIN Cliente c2 ON c2.Codigo = sp.Cliente
		LEFT JOIN Mensajero msj ON msj.Codigo = d.Mensajero
		WHERE CONVERT(date,v.Fecha) BETWEEN @FechaIni AND @FechaFin AND (p.Item LIKE @Buscar+'%' OR p.Nombre LIKE @Buscar+'%' OR p.Referencia LIKE @Buscar+'%' OR p.CodigoBarras LIKE @Buscar+'%')
	END	
	ELSE
	BEGIN
		SELECT 
		v.Codigo,v.Fecha,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura
		,p.Item
		,p.Referencia
		,p.CodigoBarras
		,p.Nombre 
		,v.ModoVenta
		,v.UM
		,v.Cantidad
		,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres) * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		END
		END
		END
		END
		END Costo
		,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad)
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres)
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto' THEN
		(v.Cantidad * p.SubCantidad)
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad)
		END
		END
		END
		END
		END Cantidad_Exacta
		,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		END
		END
		END
		END
		END PrecioVenta
		,v.descuento
		,
		(
		(CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		END
		END
		END
		END
		END)
		* 
		(v.descuento/100)) ValorDescuento,
		v.Efectivo,v.Tdebito,
			v.NumBaucherDebito,v.Tcredito,v.NumBaucherCredito,v.Cambio,v.Total,
			pr.DNI+'-'+pr.Nombre Proveedor,
			c.DNI +'-'+c.Nombre Cliente,CONCAT(d.Estado,' - ',d.Codigo,' - ',d.Celular,' - ',
			d.Nombre,' - ',d.Direccion,' - ',msj.DNI,' - ',msj.Nombre,' - ',d.ValorDomicilio) Domicilio, 
			CONCAT(sp.Estado,' - ',sp.Codigo,' - ',c2.DNI,' - ',c2.Nombre) SistemaSeparado
		FROM 
		Venta v
		INNER JOIN Producto p ON p.Item = v.Producto
		INNER JOIN Proveedor pr ON pr.DNI = v.Proveedor
		INNER JOIN Cliente c ON c.Codigo = v.Cliente
		LEFT JOIN Domicilio d ON d.Codigo = v.Domicilio
		LEFT JOIN SistemaSeparado sp ON sp.Codigo = v.SistemaSeparado
		LEFT JOIN Cliente c2 ON c2.Codigo = sp.Cliente
		LEFT JOIN Mensajero msj ON msj.Codigo = d.Mensajero
		WHERE CONVERT(date,v.Fecha) BETWEEN @FechaIni AND @FechaFin AND (p.Nombre LIKE @Buscar+'%' OR p.Referencia LIKE @Buscar+'%' OR p.CodigoBarras LIKE @Buscar+'%')
	END
END
ELSE
BEGIN
		IF(ISNUMERIC(@Buscar) = 1)
		BEGIN
		SELECT 
		v.Codigo,v.Fecha,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura
		,p.Item
		,p.Referencia
		,p.CodigoBarras
		,p.Nombre 
		,v.ModoVenta
		,v.UM
		,v.Cantidad
		,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres) * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		END
		END
		END
		END
		END Costo
		,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad)
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres)
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto' THEN
		(v.Cantidad * p.SubCantidad)
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad)
		END
		END
		END
		END
		END Cantidad_Exacta
		,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		END
		END
		END
		END
		END PrecioVenta
		,v.descuento
		,
		(
		(CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		END
		END
		END
		END
		END)
		* 
		(v.descuento/100)) ValorDescuento,
		v.Efectivo,v.Tdebito,
			v.NumBaucherDebito,v.Tcredito,v.NumBaucherCredito,v.Cambio,v.Total,
			pr.DNI+'-'+pr.Nombre Proveedor,
			c.DNI +'-'+c.Nombre Cliente,CONCAT(d.Estado,' - ',d.Codigo,' - ',d.Celular,' - ',
			d.Nombre,' - ',d.Direccion,' - ',msj.DNI,' - ',msj.Nombre,' - ',d.ValorDomicilio) Domicilio, 
			CONCAT(sp.Estado,' - ',sp.Codigo,' - ',c2.DNI,' - ',c2.Nombre) SistemaSeparado
		FROM 
		Venta v
		INNER JOIN Producto p ON p.Item = v.Producto
		INNER JOIN Proveedor pr ON pr.DNI = v.Proveedor
		INNER JOIN Cliente c ON c.Codigo = v.Cliente
		LEFT JOIN Domicilio d ON d.Codigo = v.Domicilio
		LEFT JOIN SistemaSeparado sp ON sp.Codigo = v.SistemaSeparado
		LEFT JOIN Cliente c2 ON c2.Codigo = sp.Cliente
		LEFT JOIN Mensajero msj ON msj.Codigo = d.Mensajero
		WHERE CONVERT(date,v.Fecha) BETWEEN @FechaIni AND @FechaFin AND (p.Item = @Buscar OR p.Nombre = @Buscar OR p.Referencia = @Buscar OR p.CodigoBarras = @Buscar)
	END	
	ELSE
	BEGIN
		SELECT 
		v.Codigo,v.Fecha,CONCAT(v.NombreDocumento,'-',v.ConsecutivoDocumento) Factura
		,p.Item
		,p.Referencia
		,p.CodigoBarras
		,p.Nombre 
		,v.ModoVenta
		,v.UM
		,v.Cantidad
		,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres) * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  * (v.Costo)
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) * (v.Costo)
		END
		END
		END
		END
		END Costo
		,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad)
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres)
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto' THEN
		(v.Cantidad * p.SubCantidad)
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad)
		END
		END
		END
		END
		END Cantidad_Exacta
		,CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		END
		END
		END
		END
		END PrecioVenta
		,v.descuento
		,
		(
		(CASE WHEN v.ModoVenta = 'Multi' AND UM = 'UND P' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Multi' AND UM = 'Sobre' THEN
		(v.Cantidad * p.Sobres) *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Pesaje' AND v.UM != 'Bulto'  THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		ELSE
		CASE WHEN v.UM = 'UND' OR v.UM = 'Caja' OR v.UM = 'Bulto' OR v.UM = 'Bolsa' THEN
		v.Cantidad  *  v.PrecioVenta
		ELSE
		CASE WHEN v.ModoVenta = 'Desechable' AND v.UM != 'Bolsa' THEN
		(v.Cantidad * p.SubCantidad) *  v.PrecioVenta
		END
		END
		END
		END
		END)
		* 
		(v.descuento/100)) ValorDescuento,
		v.Efectivo,v.Tdebito,
			v.NumBaucherDebito,v.Tcredito,v.NumBaucherCredito,v.Cambio,v.Total,
			pr.DNI+'-'+pr.Nombre Proveedor,
			c.DNI +'-'+c.Nombre Cliente,CONCAT(d.Estado,' - ',d.Codigo,' - ',d.Celular,' - ',
			d.Nombre,' - ',d.Direccion,' - ',msj.DNI,' - ',msj.Nombre,' - ',d.ValorDomicilio) Domicilio, 
			CONCAT(sp.Estado,' - ',sp.Codigo,' - ',c2.DNI,' - ',c2.Nombre) SistemaSeparado
		FROM 
		Venta v
		INNER JOIN Producto p ON p.Item = v.Producto
		INNER JOIN Proveedor pr ON pr.DNI = v.Proveedor
		INNER JOIN Cliente c ON c.Codigo = v.Cliente
		LEFT JOIN Domicilio d ON d.Codigo = v.Domicilio
		LEFT JOIN SistemaSeparado sp ON sp.Codigo = v.SistemaSeparado
		LEFT JOIN Cliente c2 ON c2.Codigo = sp.Cliente
		LEFT JOIN Mensajero msj ON msj.Codigo = d.Mensajero
		WHERE CONVERT(date,v.Fecha) BETWEEN @FechaIni AND @FechaFin AND (p.Nombre = @Buscar OR p.Referencia = @Buscar OR p.CodigoBarras = @Buscar)
	END
END


GO
/****** Object:  StoredProcedure [dbo].[SP_PRODUCTOS_FECHA_VENCIMIENTO]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [dbo].[SP_PRODUCTOS_FECHA_VENCIMIENTO]
@Producto AS VARCHAR(MAX)
AS
IF(ISNUMERIC(@Producto) = 1)
BEGIN
SELECT P.Item,p.Nombre,ISNULL(FV.FechaVecimiento,'') FechaVecimiento,
CASE WHEN ISNULL(FV.FechaVecimiento,'') <= SYSDATETIME() AND ISNULL(FV.FechaVecimiento,'') != '1900-01-01' THEN
'Vencido' 
ELSE 
CASE WHEN ISNULL(FV.FechaVecimiento,'') <= DATEADD(DAY,7,SYSDATETIME()) AND ISNULL(FV.FechaVecimiento,'') != '1900-01-01' THEN
'Pronto a vencer'
ELSE
''
END
END Estado
FROM Producto p
LEFT JOIN FechasVencimiento fv ON fv.Item = p.Item
WHERE p.Item = @Producto AND Estado = 1
ORDER BY p.Item
END
ELSE
BEGIN
SELECT P.Item,p.Nombre,ISNULL(FV.FechaVecimiento,'') FechaVecimiento,
CASE WHEN ISNULL(FV.FechaVecimiento,'') <= SYSDATETIME() AND ISNULL(FV.FechaVecimiento,'') != '1900-01-01' THEN
'Vencido' 
ELSE 
CASE WHEN ISNULL(FV.FechaVecimiento,'') <= DATEADD(DAY,7,SYSDATETIME()) AND ISNULL(FV.FechaVecimiento,'') != '1900-01-01' THEN
'Pronto a vencer'
ELSE
''
END
END Estado
FROM Producto p
LEFT JOIN FechasVencimiento fv ON fv.Item = p.Item
WHERE p.Nombre LIKE @Producto+'%' AND Estado = 1
ORDER BY p.Item
END

GO
/****** Object:  StoredProcedure [dbo].[SP_REPORTE_GANANCIAS_PERDIDAS]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [dbo].[SP_REPORTE_GANANCIAS_PERDIDAS]
@FechaInici AS VARCHAR(max),
@FechaFin AS VARCHAR(max)
AS
--Reporte de Ventas Directas
SELECT 
Producto,p.CodigoBarras,p.Referencia,p.Nombre,p.Descripcion,SUM(v.Cantidad) Cantidad,SUM((v.Costo * v.Cantidad)) CostoTotal,SUM((v.PrecioVenta * v.Cantidad)) SubTotal,
SUM((v.PrecioVenta * v.Cantidad) * (descuento/100)) ValorDescuento,
SUM(((v.PrecioVenta * v.Cantidad) - ((v.PrecioVenta * v.Cantidad) * (descuento/100)))) Total,
SUM(((v.PrecioVenta * v.Cantidad) - ((v.PrecioVenta * v.Cantidad) * (descuento/100))) 
-
(v.Costo * v.Cantidad)) Resultado,'V Directa' Modulo
FROM Venta v
INNER JOIN Producto p ON p.Item = v.Producto
WHERE Domicilio IS NULL AND SistemaSeparado IS NULL
AND CONVERT(date,v.Fecha) BETWEEN @FechaInici AND @FechaFin
GROUP BY Producto,p.CodigoBarras,p.Referencia,p.Nombre,p.Descripcion
UNION ALL

--Reporte de Ventas Domicilios
SELECT 
Producto,p.CodigoBarras,p.Referencia,p.Nombre,p.Descripcion,SUM(v.Cantidad) Cantidad,SUM((v.Costo * v.Cantidad)) CostoTotal,SUM((v.PrecioVenta * v.Cantidad)) SubTotal,
SUM((v.PrecioVenta * v.Cantidad) * (descuento/100)) ValorDescuento,
SUM(((v.PrecioVenta * v.Cantidad) - ((v.PrecioVenta * v.Cantidad) * (descuento/100)))) Total,
SUM(((v.PrecioVenta * v.Cantidad) - ((v.PrecioVenta * v.Cantidad) * (descuento/100))) 
-
(v.Costo * v.Cantidad)) Resultado,'V Domicilio' Modulo
FROM Venta v
INNER JOIN Producto p ON p.Item = v.Producto
INNER JOIN Domicilio d ON d.Codigo = v.Domicilio
WHERE Domicilio IS NOT NULL AND d.Estado = 'Pago' OR d.Estado = 'Procesado'
AND CONVERT(date,v.Fecha) BETWEEN @FechaInici AND @FechaFin
GROUP BY Producto,p.CodigoBarras,p.Referencia,p.Nombre,p.Descripcion




GO
/****** Object:  StoredProcedure [dbo].[SP_STOCK_PRODUCTOS]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [dbo].[SP_STOCK_PRODUCTOS]
@Producto AS VARCHAR(MAX)
AS
IF(ISNUMERIC(@Producto) = 1)
BEGIN
SELECT 
p.Item
,p.Nombre
,p.Stock_minimo
,p.Stock_maximo 
,(SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) Stock
,ISNULL(CASE WHEN (((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) <= p.Stock_minimo) 
AND
((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) > 0
  THEN 
'STOCK MIN' END,'') Alerta_Stock_minimo
,ISNULL(CASE WHEN (((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) >= p.Stock_maximo) 
AND
((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) > 0
THEN 
'STOCK MAX' END,'') Alerta_Stock_Maximo,
CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) <= 0 THEN
'AGOTADO' ELSE '' END Alerta_stock_agotado
FROM Producto p
WHERE ModoVenta = 'Unidad' AND p.Item = @Producto
UNION ALL
SELECT 
p.Item
,p.Nombre
,p.Stock_minimo
,p.Stock_maximo 
,(SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) Stock
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) <= p.Stock_minimo THEN 
'STOCK MIN' END,'') Alerta_Stock_minimo
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) >= p.Stock_maximo THEN 
'STOCK MAX' END,'') Alerta_Stock_Maximo,
CASE WHEN (SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) <= 0 THEN
'AGOTADO'
ELSE
''
END Alerta_stock_agotado
FROM Producto p
WHERE ModoVenta = 'Pesaje'  AND p.Item = @Producto
UNION ALL
SELECT 
p.Item
,p.Nombre
,p.Stock_minimo
,p.Stock_maximo 
,(SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) Stock
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) <= p.Stock_minimo THEN 
'STOCK MIN' END,'') Alerta_Stock_minimo
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) >= p.Stock_maximo THEN 
'STOCK MAX' END,'') Alerta_Stock_Maximo,
CASE WHEN (SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) <= 0 THEN
'AGOTADO' 
ELSE
''
END Alerta_stock_agotado
FROM Producto p
WHERE ModoVenta = 'Multi' AND p.Item = @Producto
UNION ALL
SELECT 
p.Item
,p.Nombre
,p.Stock_minimo
,p.Stock_maximo 
,(SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) Stock
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) <= p.Stock_minimo THEN 
'STOCK MIN' END,'') Alerta_Stock_minimo
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) >= p.Stock_maximo THEN 
'STOCK MAX' END,'') Alerta_Stock_Maximo,
CASE WHEN (SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) <= 0 THEN
'AGOTADO'
ELSE
''
END Alerta_stock_agotado
FROM Producto p
WHERE ModoVenta = 'Desechable' AND p.Item = @Producto
END
ELSE
BEGIN
SELECT 
p.Item
,p.Nombre
,p.Stock_minimo
,p.Stock_maximo 
,(SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) Stock
,ISNULL(CASE WHEN (((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) <= p.Stock_minimo) 
AND
((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) > 0
  THEN 
'STOCK MIN' END,'') Alerta_Stock_minimo
,ISNULL(CASE WHEN (((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) >= p.Stock_maximo) 
AND
((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) > 0
THEN 
'STOCK MAX' END,'') Alerta_Stock_Maximo,
CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) <= 0 THEN
'AGOTADO' ELSE '' END Alerta_stock_agotado
FROM Producto p
WHERE ModoVenta = 'Unidad'AND p.Nombre LIKE @Producto+'%'
UNION ALL
SELECT 
p.Item
,p.Nombre
,p.Stock_minimo
,p.Stock_maximo 
,(SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) Stock
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) <= p.Stock_minimo THEN 
'STOCK MIN' END,'') Alerta_Stock_minimo
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) >= p.Stock_maximo THEN 
'STOCK MAX' END,'') Alerta_Stock_Maximo,
CASE WHEN (SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) <= 0 THEN
'AGOTADO'
ELSE
''
END Alerta_stock_agotado
FROM Producto p
WHERE ModoVenta = 'Pesaje'  AND p.Nombre LIKE @Producto+'%'
UNION ALL
SELECT 
p.Item
,p.Nombre
,p.Stock_minimo
,p.Stock_maximo 
,(SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) Stock
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) <= p.Stock_minimo THEN 
'STOCK MIN' END,'') Alerta_Stock_minimo
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) >= p.Stock_maximo THEN 
'STOCK MAX' END,'') Alerta_Stock_Maximo,
CASE WHEN (SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) <= 0 THEN
'AGOTADO' 
ELSE
''
END Alerta_stock_agotado
FROM Producto p
WHERE ModoVenta = 'Multi'  AND p.Nombre LIKE @Producto+'%'
UNION ALL
SELECT 
p.Item
,p.Nombre
,p.Stock_minimo
,p.Stock_maximo 
,(SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) Stock
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) <= p.Stock_minimo THEN 
'STOCK MIN' END,'') Alerta_Stock_minimo
,ISNULL(CASE WHEN ((SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item)) >= p.Stock_maximo THEN 
'STOCK MAX' END,'') Alerta_Stock_Maximo,
CASE WHEN (SELECT SUM(CASE WHEN k.movimiento = 'Salida -' THEN k.Cantidad * -1 ELSE k.Cantidad END) FROM Kardex k WHERE k.Item = p.Item) <= 0 THEN
'AGOTADO'
ELSE
''
END Alerta_stock_agotado
FROM Producto p
WHERE ModoVenta = 'Desechable' AND p.Nombre LIKE @Producto+'%'
END


GO
/****** Object:  StoredProcedure [dbo].[sp_verificar_login]    Script Date: 12/11/2019 23:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	--Creacion de procedimientos almacenados
	CREATE PROCEDURE  [dbo].[sp_verificar_login]
	@Usuarios VARCHAR(50),
	@Contrasenas VARCHAR(50)
	AS
	DECLARE
	@PassEncritado VARCHAR(300),
	@PassDecifrado VARCHAR(300)

	SET @PassEncritado = (SELECT Contrasena FROM Usuario WHERE NombreUsuario = @Usuarios)
	SET	@PassDecifrado = DECRYPTBYPASSPHRASE('password', @PassEncritado)
	IF(@PassDecifrado = @Contrasenas)
	SELECT Codigo,Nombres+' '+Apellidos Nombre,NombreUsuario FROM Usuario WHERE NombreUsuario = @Usuarios
	ELSE
	SELECT Codigo,Nombres+' '+Apellidos Nombre,NombreUsuario FROM Usuario WHERE Codigo = 0


GO
USE [master]
GO
ALTER DATABASE [DB_SBX] SET  READ_WRITE 
GO
