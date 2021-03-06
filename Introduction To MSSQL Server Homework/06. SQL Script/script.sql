USE [master]
GO
/****** Object:  Database [School]    Script Date: 6/24/2015 5:52:44 AM ******/
CREATE DATABASE [School]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\School.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'School_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\School_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [School] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [School] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [School] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [School] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [School] SET ARITHABORT OFF 
GO
ALTER DATABASE [School] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [School] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [School] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [School] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [School] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [School] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [School] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [School] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [School] SET  DISABLE_BROKER 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [School] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [School] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [School] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [School] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [School] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [School] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [School] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [School] SET  MULTI_USER 
GO
ALTER DATABASE [School] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [School] SET DB_CHAINING OFF 
GO
ALTER DATABASE [School] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [School] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [School] SET DELAYED_DURABILITY = DISABLED 
GO
USE [School]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 6/24/2015 5:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MaxStudents] [int] NOT NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 6/24/2015 5:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[PhoneNumber] [nchar](10) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (2, N' PHP', 50)
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (3, N'JavaScript', 30)
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (4, N'Java Basics', 200)
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (5, N'C# Basics', 400)
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (6, N'Databases', 120)
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (7, N'HTML&CSS', 88)
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (8, N'Graphic Design', 180)
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (9, N'Data Structures', 300)
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (10, N'C#Advanced', 270)
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (11, N'JavaEnterprise', 160)
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (12, N'SAP_HANA', 30)
SET IDENTITY_INSERT [dbo].[Classes] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (1, N'Ivan Petrov', 22, N'0889456723')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (2, N'Maria Genova', 24, N'02395017  ')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (3, N'Plamen Ignatov', 30, NULL)
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (4, N'Angel Traianov', 25, N'0889450123')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (5, N'Violeta Stratieva', 20, N'0899459967')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (6, N'Gergana Trifonova', 33, N'0899357882')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (7, N'Stefan Georgiev', 34, N'0899451835')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (8, N'Petar Manolov', 26, NULL)
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (9, N'Jasen Baichev', 28, N'027891036 ')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (10, N'Borislav hristov', 29, N'027910380 ')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (11, N'Janeta Yancheva', 30, NULL)
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (12, N'Silviya Todorova', 37, NULL)
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (13, N'Todor Tihomirov', 20, N'0888371038')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (15, N'Alexander Peshev', 22, N'0889455552')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (16, N'Diana Jecheva', 34, N'0888301048')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (17, N'Diliyana Ivanova', 28, N'0889519046')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (18, N'Victoria Beshliiska', 37, NULL)
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (19, N'Cristina Toneva', 17, N'0888501048')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (20, N'Penio Kirazhov', 55, N'0889491048')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (21, N'Dimitar Iliev', 40, N'0889401082')
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (22, N'Plamena Petrova', 37, NULL)
SET IDENTITY_INSERT [dbo].[Students] OFF
USE [master]
GO
ALTER DATABASE [School] SET  READ_WRITE 
GO
