USE [master]
GO
/****** Object:  Database [Nexos]    Script Date: 18/07/2020 23:56:26 ******/
CREATE DATABASE [Nexos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nexos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2019\MSSQL\DATA\Nexos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Nexos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2019\MSSQL\DATA\Nexos_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Nexos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nexos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nexos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nexos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nexos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nexos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nexos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nexos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nexos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nexos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nexos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nexos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nexos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nexos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nexos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nexos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nexos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Nexos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nexos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nexos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nexos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nexos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nexos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nexos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nexos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Nexos] SET  MULTI_USER 
GO
ALTER DATABASE [Nexos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nexos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nexos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nexos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Nexos] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Nexos]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18/07/2020 23:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Atencion]    Script Date: 18/07/2020 23:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atencion](
	[IdAtencion] [int] IDENTITY(1,1) NOT NULL,
	[IdDoctor] [int] NOT NULL,
	[IdPaciente] [int] NOT NULL,
 CONSTRAINT [PK_Atencion] PRIMARY KEY CLUSTERED 
(
	[IdAtencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 18/07/2020 23:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[IdDoctor] [int] IDENTITY(1,1) NOT NULL,
	[IdHospital] [int] NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Apellido] [nvarchar](max) NULL,
	[Especialidad] [nvarchar](max) NULL,
	[NumCredencial] [nvarchar](max) NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[IdDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 18/07/2020 23:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[IdHospital] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Direccion] [nvarchar](max) NULL,
	[Telefono] [nvarchar](max) NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[IdHospital] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogDatos]    Script Date: 18/07/2020 23:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogDatos](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[Evento] [nvarchar](max) NOT NULL,
	[Mensaje] [nvarchar](max) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Excepcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LogDatos] PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 18/07/2020 23:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Apellido] [nvarchar](max) NULL,
	[NumSeguroSocial] [nvarchar](max) NULL,
	[CodigoPostal] [nvarchar](max) NULL,
	[Telefono] [nvarchar](max) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200718161148_FirstMigration', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200719032347_LogMigracion', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200719040307_LogDatosMigration', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200719044950_LogDatosMigratio', N'2.2.6-servicing-10079')
SET IDENTITY_INSERT [dbo].[Atencion] ON 

INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (1, 1, 1)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (2, 6, 11)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (3, 1, 11)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (4, 5, 11)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (5, 9, 12)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (6, 5, 12)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (7, 6, 12)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (8, 8, 12)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (9, 10, 13)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (10, 8, 14)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (11, 5, 14)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (14, 12, 3)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (15, 13, 5)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (16, 14, 9)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (17, 15, 9)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (18, 15, 13)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (19, 16, 9)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (20, 16, 13)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (21, 17, 7)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (22, 18, 8)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (23, 19, 8)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (24, 19, 12)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (25, 19, 1)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (26, 20, 12)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (27, 21, 12)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (28, 22, 13)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (29, 22, 5)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (30, 23, 13)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (31, 23, 5)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (32, 24, 8)
INSERT [dbo].[Atencion] ([IdAtencion], [IdDoctor], [IdPaciente]) VALUES (33, 18, 1)
SET IDENTITY_INSERT [dbo].[Atencion] OFF
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (1, 1, N'Pepito', N'Perez', N'odontologia', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (2, 1, N'Luis', N'Molina', N'123', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (3, 1, N'Carlos', N'Rubio', N'Dermatología', N'123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (4, 1, N'Andres', N'Cano', N'Oftalmología', N'1231233')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (5, 1, N'Ramon ', N'Garrido', N'Otorrinolaringología', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (6, 1, N'Alvaro ', N'Ortiz', N'Urología', N'12312312')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (7, 1, N'Emilio', N'Rodenas', N'Traumatología', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (8, 1, N'Alicia', N'Pardo', N'Angiología', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (9, 1, N'Rocio', N'Nuñez', N'Ginecología ', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (10, 1, N'Consuelo', N'Moya', N'obstetricia ', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (11, 1, N'Rosa', N'Requena', N'tocología', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (12, 1, N'Antonio', N'Garrido', N'Dermatología', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (13, 1, N'Alvaro ', N'Saez', N'obstetricia ', N'1231233')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (14, 1, N'Carolina', N'Rios', N'Dermatología', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (15, 1, N'Carolina', N'Rios', N'Dermatología', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (16, 1, N'Carolina', N'Rios', N'Dermatología', N'123123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (17, 1, N'sofia', N'Gonzales', N'123', N'123')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (18, 1, N'Pepito', N'Ardila', N'prueba', N'12312')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (19, 1, N'Julian', N'Tovallo', N'Dermatología', N'1231233')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (20, 1, N'qweqwe', N'qweqwe', N'weqweqw', N'qweqwe')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (21, 1, N'qweqwe', N'qweqwe', N'weqweqw', N'qweqwe')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (22, 1, N'Julio', N'Maldonado', N'Otorrinolaringología', N'12312333')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (23, 1, N'Julio', N'Maldonado', N'Otorrinolaringología', N'12312333')
INSERT [dbo].[Doctor] ([IdDoctor], [IdHospital], [Nombre], [Apellido], [Especialidad], [NumCredencial]) VALUES (24, 1, N'Wilson', N'Santander', N'Dermatología', N'23133')
SET IDENTITY_INSERT [dbo].[Doctor] OFF
SET IDENTITY_INSERT [dbo].[Hospital] ON 

INSERT [dbo].[Hospital] ([IdHospital], [Nombre], [Direccion], [Telefono]) VALUES (1, N'Test', N'Cll 7 - # 10 - 13', N'3124561')
SET IDENTITY_INSERT [dbo].[Hospital] OFF
SET IDENTITY_INSERT [dbo].[LogDatos] ON 

INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (1, N'INFORMACIÓN', N'Consultando todos los hospitales', CAST(N'2020-07-18 23:51:43.6583492' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (2, N'INFORMACIÓN', N'Consulta todos los pacientes', CAST(N'2020-07-18 23:51:44.5652542' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (3, N'INFORMACIÓN', N'Consulta todos los pacientes', CAST(N'2020-07-18 23:51:47.7915343' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (4, N'INFORMACIÓN', N'Consultando todos los hospitales', CAST(N'2020-07-18 23:51:50.6926991' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (5, N'INFORMACIÓN', N'Consulta todos los pacientes', CAST(N'2020-07-18 23:51:50.7145867' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (6, N'INFORMACIÓN', N'Se ha creado el doctor con id 24', CAST(N'2020-07-18 23:52:18.1180708' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (7, N'INFORMACIÓN', N'Consulta todos los pacientes', CAST(N'2020-07-18 23:52:18.2566407' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (8, N'INFORMACIÓN', N'Consultando todos los doctores', CAST(N'2020-07-18 23:53:15.1722465' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (9, N'INFORMACIÓN', N'Consulta el paciente con id 1', CAST(N'2020-07-18 23:53:15.3613997' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (10, N'INFORMACIÓN', N'Se ha editado el paciente con id 1', CAST(N'2020-07-18 23:53:23.1702968' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (11, N'INFORMACIÓN', N'Consultando todos los doctores', CAST(N'2020-07-18 23:53:41.6049599' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (12, N'ADVERTENCIA', N'Consulta el paciente con id 16', CAST(N'2020-07-18 23:53:41.8336480' AS DateTime2), N'System.Exception: No se ha encontrado el paciente con Id 16
   at PruebaNexos.Modulos.PacientesModulo.GetPaciente(Int32 id) in D:\proyectos\Nexos\PruebaNexos\Modulos\PacientesModulo.cs:line 43
   at PruebaNexos.Controllers.PacientesController.GetPaciente(Int32 id) in D:\proyectos\Nexos\PruebaNexos\Controllers\PacientesController.cs:line 84')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (13, N'INFORMACIÓN', N'Consultando todos los doctores', CAST(N'2020-07-18 23:53:57.5132037' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (14, N'INFORMACIÓN', N'Consulta el paciente con id 8', CAST(N'2020-07-18 23:53:57.7367296' AS DateTime2), N'')
INSERT [dbo].[LogDatos] ([IdLog], [Evento], [Mensaje], [Fecha], [Excepcion]) VALUES (15, N'INFORMACIÓN', N'Consulta todos los pacientes', CAST(N'2020-07-18 23:54:00.7644475' AS DateTime2), N'')
SET IDENTITY_INSERT [dbo].[LogDatos] OFF
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (1, N'Ana Maria', N'Gonzales ', N'123123', N'1234', N'321123321')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (2, N'Julian', N'Ardila', N'123123', N'123123', N'123123')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (3, N'Maria julieta', N'Perez', N'123123', N'123123', N'123123')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (4, N'Sofia', N'Ordoñes', N'123123', N'123123', N'123123')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (5, N'Antonio', N'Garcia', N'123123', N'123', N'123')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (6, N'Jose', N'Martinez', N'123123', N'123123', N'123123')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (7, N'Angel', N'Moreno', N'1231', N'123123', N'123231')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (8, N'David', N'Navarro', N'123', N'123', N'123')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (9, N'Carlos', N'Ruiz', N'123123', N'123', N'1323')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (10, N'Rafael', N'Saez', N'123123', N'123', N'123123')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (11, N'Luisa', N'Ramirez', N'123123', N'123123', N'12312323')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (12, N'Luisa', N'Nuñez', N'123123', N'123123', N'123123')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (13, N'Ester', N'Ramirez', N'123123', N'123123', N'123123')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [NumSeguroSocial], [CodigoPostal], [Telefono]) VALUES (14, N'Sindy', N'Rincon', N'123123', N'123123', N'231213')
SET IDENTITY_INSERT [dbo].[Paciente] OFF
/****** Object:  Index [IX_Atencion_IdDoctor]    Script Date: 18/07/2020 23:56:26 ******/
CREATE NONCLUSTERED INDEX [IX_Atencion_IdDoctor] ON [dbo].[Atencion]
(
	[IdDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Atencion_IdPaciente]    Script Date: 18/07/2020 23:56:26 ******/
CREATE NONCLUSTERED INDEX [IX_Atencion_IdPaciente] ON [dbo].[Atencion]
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Doctor_IdHospital]    Script Date: 18/07/2020 23:56:26 ******/
CREATE NONCLUSTERED INDEX [IX_Doctor_IdHospital] ON [dbo].[Doctor]
(
	[IdHospital] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Atencion]  WITH CHECK ADD  CONSTRAINT [FK_Atencion_Doctor_IdDoctor] FOREIGN KEY([IdDoctor])
REFERENCES [dbo].[Doctor] ([IdDoctor])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Atencion] CHECK CONSTRAINT [FK_Atencion_Doctor_IdDoctor]
GO
ALTER TABLE [dbo].[Atencion]  WITH CHECK ADD  CONSTRAINT [FK_Atencion_Paciente_IdPaciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Atencion] CHECK CONSTRAINT [FK_Atencion_Paciente_IdPaciente]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Hospital_IdHospital] FOREIGN KEY([IdHospital])
REFERENCES [dbo].[Hospital] ([IdHospital])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Hospital_IdHospital]
GO
USE [master]
GO
ALTER DATABASE [Nexos] SET  READ_WRITE 
GO
