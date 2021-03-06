USE [master]
GO
/****** Object:  Database [Angularcapstone]    Script Date: 10/20/2020 11:37:30 PM ******/
CREATE DATABASE [Angularcapstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Angularcapstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Angularcapstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Angularcapstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Angularcapstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Angularcapstone] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Angularcapstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Angularcapstone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Angularcapstone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Angularcapstone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Angularcapstone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Angularcapstone] SET ARITHABORT OFF 
GO
ALTER DATABASE [Angularcapstone] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Angularcapstone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Angularcapstone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Angularcapstone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Angularcapstone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Angularcapstone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Angularcapstone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Angularcapstone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Angularcapstone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Angularcapstone] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Angularcapstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Angularcapstone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Angularcapstone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Angularcapstone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Angularcapstone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Angularcapstone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Angularcapstone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Angularcapstone] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Angularcapstone] SET  MULTI_USER 
GO
ALTER DATABASE [Angularcapstone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Angularcapstone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Angularcapstone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Angularcapstone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Angularcapstone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Angularcapstone] SET QUERY_STORE = OFF
GO
USE [Angularcapstone]
GO
/****** Object:  User [dbuser]    Script Date: 10/20/2020 11:37:30 PM ******/
CREATE USER [dbuser] FOR LOGIN [dbuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dbuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [dbuser]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 10/20/2020 11:37:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[qID] [int] NOT NULL,
	[userID] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QandA]    Script Date: 10/20/2020 11:37:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QandA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](1000) NOT NULL,
	[answer] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_QandA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Favorites] ([qID], [userID]) VALUES (1, N'test')
INSERT [dbo].[Favorites] ([qID], [userID]) VALUES (2, N'AngTest')
INSERT [dbo].[Favorites] ([qID], [userID]) VALUES (55, N'AngTest')
INSERT [dbo].[Favorites] ([qID], [userID]) VALUES (555, N'AngTest')
INSERT [dbo].[Favorites] ([qID], [userID]) VALUES (1, N'AngTest')
INSERT [dbo].[Favorites] ([qID], [userID]) VALUES (3, N'AngTest')
GO
SET IDENTITY_INSERT [dbo].[QandA] ON 

INSERT [dbo].[QandA] ([id], [question], [answer]) VALUES (1, N'What is your name?', N'Sir Launcelot of Camelot!')
INSERT [dbo].[QandA] ([id], [question], [answer]) VALUES (2, N'What is your quest?', N'To seek the Holy Grail!')
INSERT [dbo].[QandA] ([id], [question], [answer]) VALUES (3, N'What.... is your favorite color?', N'Blue')
INSERT [dbo].[QandA] ([id], [question], [answer]) VALUES (4, N'What is your name?', N'Sir Robin of Camelot')
INSERT [dbo].[QandA] ([id], [question], [answer]) VALUES (5, N'What is your quest?', N'To seek the Holy Grail...')
INSERT [dbo].[QandA] ([id], [question], [answer]) VALUES (6, N'What... is the capital of Assyria??', N'???')
INSERT [dbo].[QandA] ([id], [question], [answer]) VALUES (7, N'Test1', N'Answer1')
SET IDENTITY_INSERT [dbo].[QandA] OFF
GO
USE [master]
GO
ALTER DATABASE [Angularcapstone] SET  READ_WRITE 
GO
