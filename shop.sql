USE [master]
GO
/****** Object:  Database [masv_hoten_asm_java5_ud03]    Script Date: 7/11/2021 1:47:31 PM ******/
CREATE DATABASE [masv_hoten_asm_java5_ud03]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'masv_hoten_asm_java5_ud03', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\masv_hoten_asm_java5_ud03.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'masv_hoten_asm_java5_ud03_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\masv_hoten_asm_java5_ud03_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [masv_hoten_asm_java5_ud03].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET ARITHABORT OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET  ENABLE_BROKER 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET  MULTI_USER 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET DB_CHAINING OFF 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET QUERY_STORE = OFF
GO
USE [masv_hoten_asm_java5_ud03]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 7/11/2021 1:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [varchar](255) NOT NULL,
	[activated] [bit] NOT NULL,
	[admin] [bit] NOT NULL,
	[email] [varchar](255) NULL,
	[fullname] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[photo] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 7/11/2021 1:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 7/11/2021 1:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[orderid] [bigint] NULL,
	[productid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 7/11/2021 1:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[createdate] [date] NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 7/11/2021 1:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[createdate] [date] NULL,
	[image] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[price] [float] NULL,
	[categoryid] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKj4gc2ja2otvwemf4rho2lp3s8] FOREIGN KEY([orderid])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKj4gc2ja2otvwemf4rho2lp3s8]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q] FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q]
GO
USE [master]
GO
ALTER DATABASE [masv_hoten_asm_java5_ud03] SET  READ_WRITE 
GO
