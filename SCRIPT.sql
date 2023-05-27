/*    ==Параметры сценариев==

    Версия исходного сервера : SQL Server 2014 (12.0.2000)
    Выпуск исходного ядра СУБД : Выпуск Microsoft SQL Server Express Edition
    Тип исходного ядра СУБД : Изолированный SQL Server

    Версия целевого сервера : SQL Server 2017
    Выпуск целевого ядра СУБД : Выпуск Microsoft SQL Server Standard Edition
    Тип целевого ядра СУБД : Изолированный SQL Server
*/
USE [master]
GO
/****** Object:  Database [EnglishSchoolABC]    Script Date: 27.05.2023 9:50:17 ******/
CREATE DATABASE [EnglishSchoolABC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnglishSchoolABC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EnglishSchoolABC.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EnglishSchoolABC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EnglishSchoolABC_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EnglishSchoolABC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnglishSchoolABC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnglishSchoolABC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EnglishSchoolABC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnglishSchoolABC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnglishSchoolABC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EnglishSchoolABC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnglishSchoolABC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EnglishSchoolABC] SET  MULTI_USER 
GO
ALTER DATABASE [EnglishSchoolABC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnglishSchoolABC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnglishSchoolABC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnglishSchoolABC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EnglishSchoolABC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EnglishSchoolABC]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DateOfRegistration] [date] NOT NULL,
	[ClientTypeId] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientType]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientType](
	[ClientTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ClientTypeName] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_ClientType] PRIMARY KEY CLUSTERED 
(
	[ClientTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complect]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complect](
	[ComplectId] [int] IDENTITY(1,1) NOT NULL,
	[MainGoodId] [int] NOT NULL,
	[SecondGoodId] [int] NOT NULL,
 CONSTRAINT [PK_Coplect] PRIMARY KEY CLUSTERED 
(
	[ComplectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Developer]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developer](
	[DeveloperId] [int] IDENTITY(1,1) NOT NULL,
	[DeveloperName] [nvarchar](1000) NOT NULL,
	[WorkBeginDate] [date] NOT NULL,
 CONSTRAINT [PK_Developer] PRIMARY KEY CLUSTERED 
(
	[DeveloperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Good]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Good](
	[GoodId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[GoodName] [nvarchar](200) NOT NULL,
	[MainPhoto] [nvarchar](50) NOT NULL,
	[SecondPhotos] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[Weight] [float] NULL,
	[Width] [float] NULL,
	[Heigth] [float] NULL,
	[Length] [float] NULL,
	[DeveloperId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Good] PRIMARY KEY CLUSTERED 
(
	[GoodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sell]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sell](
	[SellId] [int] IDENTITY(1,1) NOT NULL,
	[GoodId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[DateSell] [datetime] NOT NULL,
	[UserName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Sell] PRIMARY KEY CLUSTERED 
(
	[SellId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](200) NOT NULL,
	[ServiceDescription] [nvarchar](1000) NULL,
	[Price] [float] NOT NULL,
	[TimeLength] [int] NOT NULL,
	[MainPhoto] [nvarchar](100) NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[SpecialityId] [int] IDENTITY(1,1) NOT NULL,
	[SpecialityPay] [float] NOT NULL,
	[SpecialityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[SpecialityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[GoodId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[TimeSheetId] [int] IDENTITY(1,1) NOT NULL,
	[WorkerId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[ServiceTime] [time](7) NOT NULL,
	[DayWeek] [nvarchar](50) NULL,
 CONSTRAINT [PK_TimeSheet] PRIMARY KEY CLUSTERED 
(
	[TimeSheetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[VisitId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[Paid] [bit] NULL,
	[Rewiew] [nvarchar](1000) NULL,
	[DateActual] [datetime] NOT NULL,
 CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED 
(
	[VisitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[WorkerId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[WorkExperience] [int] NOT NULL,
	[Info] [nvarchar](1000) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[WorkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerSpec]    Script Date: 27.05.2023 9:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerSpec](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecialityId] [int] NOT NULL,
	[WorkerId] [int] NOT NULL,
 CONSTRAINT [PK_WorkerSpec] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Книги')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Игрушки')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Диски')
SET IDENTITY_INSERT [dbo].[Category] OFF
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'admin', N'1', N'Admin', N'admin', N'admin', CAST(N'1999-01-29' AS Date), N'11111111', N'admin@admin.ru', CAST(N'1999-01-19' AS Date), 4, 1)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'agapow', N'x', N'Беляева', N'Сабрина', N'Федосеевна', CAST(N'1972-07-26' AS Date), N' 7(6580)534-32-58 ', N' agapow@gmail.com', CAST(N'2017-06-14' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'andreeva', N'x', N'Андреева', N'Патрисия', N'Валерьевна', CAST(N'1993-11-18' AS Date), N' 7(9648)953-81-26 ', N' jigsaw@aol.com', CAST(N'2016-07-17' AS Date), 2, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'aschmitz', N'x', N'Калинин', N'Петр', N'Иванович', CAST(N'1993-09-08' AS Date), N' 7(90)316-07-17 ', N' aschmitz@hotmail.com', CAST(N'2016-05-26' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'attwood', N'x', N'Суворова', N'Божена', N'Анатольевна', CAST(N'1981-03-09' AS Date), N' 7(347)895-86-57 ', N' attwood@aol.com', CAST(N'2016-01-28' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'balchen', N'x', N'Блохин', N'Пантелеймон', N'Феликсович', CAST(N'1978-03-06' AS Date), N' 7(9524)556-48-98 ', N' balchen@comcast.net', CAST(N'2018-02-14' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'bigmauler', N'x', N'Александров', N'Станислав', N'Эдуардович', CAST(N'1981-07-04' AS Date), N' 7(18)164-05-12 ', N' bigmauler@aol.com', CAST(N'2018-11-08' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'brickbat', N'x', N'Зуев', N'Матвей', N'Иванович', CAST(N'1981-03-28' AS Date), N' 7(5383)893-04-66 ', N' brickbat@verizon.net', CAST(N'2018-12-18' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'budinger', N'x', N'Андреев', N'Станислав', N'Максович', CAST(N'1975-10-10' AS Date), N' 7(02)993-91-28 ', N' budinger@mac.com', CAST(N'2017-12-26' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'claesjac', N'x', N'Лазарев', N'Алексей', N'Богданович', CAST(N'1977-03-10' AS Date), N' 7(0055)737-37-48 ', N' claesjac@me.com', CAST(N'2017-01-02' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'cmdrgravy', N'x', N'Журавлёв', N'Леонтий', N'Яковлевич', CAST(N'2000-03-02' AS Date), N' 7(4403)308-56-96 ', N' cmdrgravy@me.com', CAST(N'2018-01-15' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'csilvers', N'x', N'Бобылёв', N'Георгий', N'Витальевич', CAST(N'1983-12-19' AS Date), N' 7(88)685-13-51 ', N' csilvers@mac.com', CAST(N'2018-04-06' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'dalamb', N'x', N'Киселёв', N'Устин', N'Яковлевич', CAST(N'1985-01-08' AS Date), N' 7(83)334-52-76 ', N' dalamb@verizon.net', CAST(N'2018-06-21' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'dieman', N'x', N'Игнатов', N'Захар', N'Павлович', CAST(N'1998-10-07' AS Date), N' 7(578)574-73-36 ', N' dieman@icloud.com', CAST(N'2017-11-10' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'dogdude', N'x', N'Некрасов', N'Варлам', N'Михайлович', CAST(N'2000-11-12' AS Date), N' 7(019)258-06-35 ', N' dogdude@verizon.net', CAST(N'2017-12-03' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'drezet', N'x', N'Егорова', N'Амалия', N'Дамировна', CAST(N'1999-09-28' AS Date), N' 7(7486)408-12-26 ', N' drezet@yahoo.com', CAST(N'2016-06-30' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'firstpr', N'x', N'Попова', N'Харита', N'Якуновна', CAST(N'1997-12-16' AS Date), N' 7(335)386-81-06 ', N' firstpr@verizon.net', CAST(N'2016-07-05' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'gordonjcp', N'x', N'Костина', N'Любава', N'Авксентьевна', CAST(N'1972-07-13' AS Date), N' 7(6419)959-21-87 ', N' gordonjcp@hotmail.com', CAST(N'2016-02-26' AS Date), 2, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'hedwig', N'x', N'Горбачёв', N'Давид', N'Тимурович', CAST(N'1983-05-22' AS Date), N' 7(53)602-85-41 ', N' hedwig@att.net', CAST(N'2018-12-17' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'hllam', N'x', N'Медведев', N'Святослав', N'Юлианович', CAST(N'1972-10-04' AS Date), N' 7(3520)435-21-20 ', N' hllam@comcast.net', CAST(N'2018-10-13' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'ilikered', N'x', N'Куликова', N'Эвелина', N'Вячеславовна', CAST(N'1997-11-14' AS Date), N' 7(0236)682-42-78 ', N' ilikered@hotmail.com', CAST(N'2018-02-01' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'jgmyers', N'x', N'Баранова', N'Эльмира', N'Дмитриевна', CAST(N'1977-01-15' AS Date), N' 7(9240)643-15-50 ', N' jgmyers@comcast.net', CAST(N'2016-07-08' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'jigsaw', N'x', N'Селиверстов', N'Глеб', N'Максимович', CAST(N'1999-06-20' AS Date), N' 7(20)554-28-68 ', N' jigsaw@sbcglobal.net', CAST(N'2016-01-07' AS Date), 2, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'jonathan', N'x', N'Корнилова', N'Анэля', N'Михайловна', CAST(N'1973-04-02' AS Date), N' 7(20)980-01-60 ', N' jonathan@aol.com', CAST(N'2016-05-22' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'jorgb', N'x', N'Комиссарова', N'Амалия', N'Робертовна', CAST(N'1971-08-18' AS Date), N' 7(22)647-46-32 ', N' jorgb@msn.com', CAST(N'2017-08-04' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'jrkorson', N'x', N'Волков', N'Людвиг', N'Витальевич', CAST(N'1977-12-27' AS Date), N' 7(8459)592-05-58 ', N' jrkorson@msn.com', CAST(N'2016-04-27' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'kildjean', N'x', N'Воронова', N'Изабелла', N'Вячеславовна', CAST(N'1999-09-24' AS Date), N' 7(17)433-44-98 ', N' kildjean@sbcglobal.net', CAST(N'2017-12-21' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'kwilliams', N'x', N'Ефремов', N'Витольд', N'Авксентьевич', CAST(N'1975-12-02' AS Date), N' 7(93)922-14-03 ', N' kwilliams@yahoo.ca', CAST(N'2018-04-09' AS Date), 3, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'lishoy', N'x', N'Гущина1', N'Янита', N'Федоровна', CAST(N'1999-03-02' AS Date), N' 7(4544)716-68-96 ', N' lishoy@att.net', CAST(N'2018-02-01' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'miturria', N'x', N'Васильев', N'Оскар', N'Богданович', CAST(N'1971-01-30' AS Date), N' 7(585)801-94-29 ', N' miturria@verizon.net', CAST(N'2017-05-28' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'moxfulder', N'x', N'Блинов', N'Евгений', N'Мэлсович', CAST(N'1994-01-05' AS Date), N' 7(0852)321-82-64 ', N' moxfulder@outlook.com', CAST(N'2017-05-07' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'nichoj', N'x', N'Кузьмина', N'Дэнна', N'Витальевна', CAST(N'1993-08-24' AS Date), N' 7(9940)977-45-73 ', N' nichoj@mac.com', CAST(N'2016-03-27' AS Date), 2, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'oevans', N'x', N'Калашников', N'Артур', N'Юрьевич', CAST(N'1972-12-13' AS Date), N' 7(147)947-47-21 ', N' oevans@aol.com', CAST(N'2017-08-20' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'ozawa', N'x', N'Казаков', N'Дмитрий', N'Русланович', CAST(N'1978-12-15' AS Date), N' 7(51)682-19-40 ', N' ozawa@verizon.net', CAST(N'2016-05-21' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'parkes', N'x', N'Колобов', N'Орест', N'Юлианович', CAST(N'2001-07-14' AS Date), N' 7(1680)508-58-26 ', N' parkes@verizon.net', CAST(N'2017-01-01' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'parsimony', N'x', N'Евсеев', N'Макар', N'Васильевич', CAST(N'1977-09-13' AS Date), N' 7(2141)077-85-70 ', N' parsimony@sbcglobal.net', CAST(N'2018-12-05' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'penna', N'x', N'Федотова', N'Сандра', N'Владленовна', CAST(N'1985-03-29' AS Date), N' 7(126)195-25-86 ', N' penna@verizon.net', CAST(N'2016-11-08' AS Date), 3, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'petersen', N'x', N'Бобров', N'Агафон', N'Лаврентьевич', CAST(N'1995-07-29' AS Date), N' 7(2159)507-39-57 ', N' petersen@comcast.net', CAST(N'2017-05-09' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'rasca', N'x', N'Степанова', N'Амелия', N'Робертовна', CAST(N'1970-06-06' AS Date), N' 7(1217)441-28-42 ', N' rasca@hotmail.com', CAST(N'2017-09-27' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'rbarreira', N'x', N'Ефимова', N'Магда', N'Платоновна', CAST(N'1995-08-16' AS Date), N' 7(9261)386-15-92 ', N' rbarreira@me.com', CAST(N'2017-08-01' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'rfoley', N'x', N'Мамонтова', N'Марфа', N'Мироновна', CAST(N'1984-10-19' AS Date), N' 7(38)095-64-18 ', N' rfoley@verizon.net', CAST(N'2018-02-27' AS Date), 2, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'rnelson', N'x', N'Орлова', N'Влада', N'Мартыновна', CAST(N'1990-06-26' AS Date), N' 7(2506)433-38-35 ', N' rnelson@yahoo.ca', CAST(N'2016-03-21' AS Date), 2, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'salesgeek', N'x', N'Морозов', N'Наум', N'Валерьянович', CAST(N'1985-07-04' AS Date), N' 7(636)050-96-13 ', N' salesgeek@mac.com', CAST(N'2016-05-02' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'sinkou', N'x', N'Колобова', N'Злата', N'Романовна', CAST(N'1994-08-25' AS Date), N' 7(50)884-07-35 ', N' sinkou@aol.com', CAST(N'2016-12-03' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'sjava', N'x', N'Ершов', N'Глеб', N'Федорович', CAST(N'1970-06-14' AS Date), N' 7(2608)298-40-82 ', N' sjava@aol.com', CAST(N'2016-09-14' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'smcnabb', N'x', N'Голубев', N'Иосиф', N'Тимофеевич', CAST(N'1982-05-06' AS Date), N' 7(78)972-73-11 ', N' smcnabb@att.net', CAST(N'2018-08-18' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'solomon', N'x', N'Абрамов', N'Станислав', N'Филатович', CAST(N'1989-05-18' AS Date), N' 7(6545)478-87-79 ', N' solomon@att.net', CAST(N'2016-12-08' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'staffelb', N'x', N'Агафонов', N'Юстиниан', N'Олегович', CAST(N'1997-02-02' AS Date), N' 7(303)810-28-78 ', N' staffelb@sbcglobal.net', CAST(N'2016-06-08' AS Date), 2, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'uncle', N'x', N'Большаков', N'Вадим', N'Данилович', CAST(N'1970-05-15' AS Date), N' 7(386)641-13-37 ', N' uncle@gmail.com', CAST(N'2018-08-04' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'vmalik', N'x', N'Дмитриева', N'Элина', N'Даниловна', CAST(N'1988-12-10' AS Date), N' 7(787)140-48-84 ', N' vmalik@live.com', CAST(N'2017-02-11' AS Date), 1, 2)
INSERT [dbo].[Client] ([UserName], [Password], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Phone], [Email], [DateOfRegistration], [ClientTypeId], [RoleId]) VALUES (N'yruan', N'x', N'Турова', N'Георгина', N'Семёновна', CAST(N'1974-05-28' AS Date), N' 7(555)321-42-99 ', N' yruan@optonline.net', CAST(N'2018-02-22' AS Date), 3, 2)
SET IDENTITY_INSERT [dbo].[ClientType] ON 

INSERT [dbo].[ClientType] ([ClientTypeId], [ClientTypeName], [Color]) VALUES (1, N'Basic', N'#FFFFFFFF')
INSERT [dbo].[ClientType] ([ClientTypeId], [ClientTypeName], [Color]) VALUES (2, N'Silver', N'#FFC0C0C0')
INSERT [dbo].[ClientType] ([ClientTypeId], [ClientTypeName], [Color]) VALUES (3, N'Gold', N'#FFFFD700')
INSERT [dbo].[ClientType] ([ClientTypeId], [ClientTypeName], [Color]) VALUES (4, N'Platimun', N'#FF7F7679')
SET IDENTITY_INSERT [dbo].[ClientType] OFF
SET IDENTITY_INSERT [dbo].[Complect] ON 

INSERT [dbo].[Complect] ([ComplectId], [MainGoodId], [SecondGoodId]) VALUES (1, 93, 2)
INSERT [dbo].[Complect] ([ComplectId], [MainGoodId], [SecondGoodId]) VALUES (2, 4, 2)
INSERT [dbo].[Complect] ([ComplectId], [MainGoodId], [SecondGoodId]) VALUES (3, 75, 2)
INSERT [dbo].[Complect] ([ComplectId], [MainGoodId], [SecondGoodId]) VALUES (4, 2, 3)
INSERT [dbo].[Complect] ([ComplectId], [MainGoodId], [SecondGoodId]) VALUES (5, 2, 5)
SET IDENTITY_INSERT [dbo].[Complect] OFF
SET IDENTITY_INSERT [dbo].[Developer] ON 

INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (1, N'Princeton Review', CAST(N'2015-01-06' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (2, N'Кнорус', CAST(N'2017-08-18' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (3, N'Яуза', CAST(N'2015-10-22' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (4, N'Аванта+', CAST(N'2017-02-22' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (5, N'Dorling Kindersley', CAST(N'2015-01-02' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (6, N'Delta Publishing', CAST(N'2017-05-17' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (7, N'Проспект', CAST(N'2017-11-16' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (8, N'Express Publishing', CAST(N'2016-09-15' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (9, N'Эксмо-Пресс', CAST(N'2018-02-26' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (10, N'Розовый жираф', CAST(N'2017-09-20' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (11, N'Стандарт-Коллекция', CAST(N'2015-11-07' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (12, N'Медиарама', CAST(N'2016-10-17' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (13, N'Вагриус', CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (14, N'Академкнига', CAST(N'2015-05-13' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (15, N'Прогресс', CAST(N'2018-06-16' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (16, N'Возвращение', CAST(N'2017-01-16' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (17, N'АСТ', CAST(N'2017-10-31' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (18, N'Ladybird', CAST(N'2017-02-15' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (19, N'ЛитРес', CAST(N'2017-06-21' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (20, N'Матезис', CAST(N'2017-10-12' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (21, N'Gallimard', CAST(N'2016-08-23' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (22, N'Современник', CAST(N'2016-03-16' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (23, N'Алгоритм', CAST(N'2015-07-21' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (24, N'Антология', CAST(N'2017-06-04' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (25, N'Росмэн', CAST(N'2017-04-14' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (26, N'Просвещение', CAST(N'2018-03-24' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (27, N'Мир хобби', CAST(N'2016-09-27' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (28, N'Попурри', CAST(N'2015-05-24' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (29, N'Феникс', CAST(N'2016-09-07' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (30, N'Абрис', CAST(N'2017-10-24' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (31, N'Де Агостини', CAST(N'2015-08-08' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (32, N'Виват', CAST(N'2018-04-11' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (33, N'Весь мир', CAST(N'2017-10-31' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (34, N'Велес-ВА', CAST(N'2017-09-09' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (35, N'Дрофа', CAST(N'2015-08-16' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (36, N'Эксмо', CAST(N'2015-03-16' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (37, N'Аврора', CAST(N'2016-09-24' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (38, N'Cambridge', CAST(N'2015-08-18' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (39, N'Планета', CAST(N'2017-11-04' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (40, N'Вита Нова', CAST(N'2017-03-28' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (41, N'РОССПЭН', CAST(N'2017-09-04' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (42, N'Мир', CAST(N'2017-11-18' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (43, N'Росток', CAST(N'2017-10-20' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (44, N'Питер', CAST(N'2018-05-06' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (45, N'Вита-Пресс', CAST(N'2016-10-25' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (46, N'Литературная Россия', CAST(N'2015-02-03' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (47, N'Флинта', CAST(N'2017-04-10' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (48, N'Академический проект', CAST(N'2016-12-02' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (49, N'ИНФРА-М', CAST(N'2015-11-21' AS Date))
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (50, N'Прометей', CAST(N'2017-02-11' AS Date))
SET IDENTITY_INSERT [dbo].[Developer] OFF
SET IDENTITY_INSERT [dbo].[Good] ON 

INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (1, NULL, N'Super Minds. Level 4. Workbook with Online Resources', N'701132.jpg', NULL, 1210, NULL, NULL, NULL, NULL, 38, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (2, NULL, N'Super Minds. Workbook 2 with Online Resources', N'701128.jpg', NULL, 1200, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (3, NULL, N'Eyes Open. Level 3. Student''s Book', N'700890.jpg', NULL, 1350, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (4, NULL, N'Advanced Grammar in Use. Book without Answers', N'700673.jpg', NULL, 1850, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (5, NULL, N'Английский на каждый день', N'698477.jpg', NULL, 670, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (6, NULL, N'English for Everyone. English Vocabulary Builder', N'715802.jpg', NULL, 1980, NULL, NULL, NULL, NULL, 5, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (7, NULL, N'Cracking GMAT Premium 2020 Edition. 6 Practice Tests', N'724652.jpg', NULL, 3140, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (8, NULL, N'Учебник английского языка. Полный курс', N'729944.jpg', NULL, 1000, NULL, NULL, NULL, NULL, 36, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (9, NULL, N'Английский без страха для тех, кому за...', N'720888.jpg', NULL, 290, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (10, NULL, N'Grammarway 2. Teacher''s Book. Elementary', N'702075.jpg', NULL, 910, NULL, NULL, NULL, NULL, 8, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (11, NULL, N'Tree or Three? An elementary pronunciation course', N'701141.jpg', NULL, 1870, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (12, NULL, N'Prism Reading. Intro. Student''s Book', N'699858.jpg', NULL, 2930, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (13, NULL, N'Think. Level 3. B1+. Student''s Book', N'701135.jpg', NULL, 1640, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (14, NULL, N'Учим английский язык с енотами-полиглотами', N'724934.jpg', NULL, 340, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (15, NULL, N'Super Minds. Workbook 1 with Online Resources', N'701125.jpg', NULL, 1230, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (16, NULL, N'Говори как английская королева. The Queen''s English and how to use it', N'699791.jpg', NULL, 420, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (17, NULL, N'Dive in! Blue', N'729198.jpg', NULL, 630, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (18, NULL, N'Вся грамматика английского языка в таблицах. Учебное пособие', N'716788.jpg', NULL, 390, NULL, NULL, NULL, NULL, 47, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (19, NULL, N'New Enterprise A2. Workbook with digibook app', N'701884.jpg', NULL, 1220, NULL, NULL, NULL, NULL, 8, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (20, NULL, N'Eyes Open Level 1 Student''s Book', N'700889.jpg', NULL, 1340, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (21, NULL, N'Английский язык. Популярный иллюстрированный самоучитель', N'726891.jpg', NULL, 400, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (22, NULL, N'Grammarway 1. Book with Answers. Beginner', N'702074.jpg', NULL, 1270, NULL, NULL, NULL, NULL, 8, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (23, NULL, N'Business Vocabulary in Use. Advanced. Book with Answers', N'700674.jpg', NULL, 2220, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (24, NULL, N'Разговорный английский в диалогах. Учебное пособие', N'730838.jpg', NULL, 1140, NULL, NULL, NULL, NULL, 2, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (25, NULL, N'Английский без барьеров. For beginners', N'722958.jpg', NULL, 420, NULL, NULL, NULL, NULL, 44, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (26, NULL, N'Pocket English Grammar (Карманная грамматика английского языка). Справочное пособие', N'690825.jpg', NULL, 390, NULL, NULL, NULL, NULL, 49, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (27, NULL, N'Evolve. Level 1. Student''s Book', N'702640.jpg', NULL, 1840, NULL, NULL, NULL, NULL, 38, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (28, NULL, N'Реальный English. Как подружиться с грамматикой раз и навсегда', N'704508.jpg', NULL, 690, NULL, NULL, NULL, NULL, 29, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (29, NULL, N'English Vocabulary in Use. Advanced. Book with Answers', N'700703.jpg', NULL, 1860, NULL, NULL, NULL, NULL, 38, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (30, NULL, N'Быстрый английский. Тренажер по чтению', N'715170.jpg', NULL, 240, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (31, NULL, N'Деловой английский язык. (Бакалавриат и магистратура). Учебное пособие', N'712853.jpg', NULL, 1080, NULL, NULL, NULL, NULL, 2, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (32, NULL, N'Английский язык. Самые нужные правила', N'729858.jpg', NULL, 180, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (33, NULL, N'Legal English. Английский язык для юристов. Учебник', N'707289.jpg', NULL, 2720, NULL, NULL, NULL, NULL, 49, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (34, NULL, N'OK English! Все правила английского языка с упражнениями', N'694544.jpg', NULL, 370, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (35, NULL, N'Dive in! Orange', N'729200.jpg', NULL, 650, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (36, NULL, N'Английская грамматика. Просто и понятно: правила, модели, упражнения. Учебное пособие', N'716808.jpg', NULL, 2060, NULL, NULL, NULL, NULL, 50, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (37, NULL, N'Grammar in Use. Intermediate. Student''s Book without Answers', N'700903.jpg', NULL, 1740, NULL, NULL, NULL, NULL, 38, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (38, NULL, N'Современная английская грамматика в таблицах', N'721525.jpg', NULL, 340, NULL, NULL, NULL, NULL, 9, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (39, NULL, N'Everyday Vocabulary + Grammar. For Intermediate Students. Учебное пособие', N'722745.jpg', NULL, 1180, NULL, NULL, NULL, NULL, 24, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (40, NULL, N'English for Everyone. English Idioms', N'715801.jpg', NULL, 2290, NULL, NULL, NULL, NULL, 5, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (41, NULL, N'Вся грамматика английского языка. Теория и практика', N'724335.jpg', NULL, 410, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (42, NULL, N'Говорим по-английски', N'706297.jpg', NULL, 220, NULL, NULL, NULL, NULL, 32, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (43, NULL, N'Business Vocabulary in Use. Intermediate. Book with Answers and Enhanced ebook', N'700676.jpg', NULL, 2690, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (44, NULL, N'Безупречная английская грамматика. Простые правила и увлекательные тесты', N'723769.jpg', NULL, 720, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (45, NULL, N'Exam Booster For Advanced Without Ans Key + Audio', N'714676.jpg', NULL, 1300, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (46, NULL, N'Grammar in Use. Intermediate. Student''s Book with Answers and Interactive eBook', N'700900.jpg', NULL, 2380, NULL, NULL, NULL, NULL, 38, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (47, NULL, N'Английская грамматика в схемах и таблицах', N'713804.jpg', NULL, 170, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (48, NULL, N'Английский язык. Тренажер по чтению', N'710082.jpg', NULL, 170, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (49, NULL, N'Английский язык для технических специальностей. Учебное пособие', N'730048.jpg', NULL, 2550, NULL, NULL, NULL, NULL, 49, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (50, NULL, N'Интенсивный английский 4 в 1: говорим, читаем, пишем, слушаем', N'716807.jpg', NULL, 1840, NULL, NULL, NULL, NULL, 50, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (51, NULL, N'Английские пословицы и поговорки. Учебное пособие', N'714143.jpg', NULL, 260, NULL, NULL, NULL, NULL, 47, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (52, NULL, N'Super Minds. Level 3. Workbook with Online Resources', N'701130.jpg', NULL, 1200, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (53, NULL, N'Английский язык. Времена глаголов', N'710081.jpg', NULL, 150, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (54, NULL, N'Английский курсив: прописи', N'715875.jpg', NULL, 300, NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (55, NULL, N'Английский язык. Фразовые глаголы', N'710083.jpg', NULL, 160, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (56, NULL, N'English for Beginners: Everyday English', N'693086.jpg', NULL, 330, NULL, NULL, NULL, NULL, 18, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (57, NULL, N'Курс английской разговорной речи. Учебное пособие', N'722820.jpg', NULL, 1790, NULL, NULL, NULL, NULL, 50, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (58, NULL, N'New Enterprise A2 Student''s Book with DigiBooks App', N'701882.jpg', NULL, 1650, NULL, NULL, NULL, NULL, 8, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (59, NULL, N'Business Vocabulary in Use. Advanced. Book with Answers and Enhanced ebook', N'700675.jpg', NULL, 2840, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (60, NULL, N'Prepare. Level 2. Student''s Book', N'701088.jpg', NULL, 1780, NULL, NULL, NULL, NULL, 38, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (61, NULL, N'Your Space Level 2 Student''s Book', N'701151.jpg', NULL, 1380, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (62, NULL, N'Вся английская грамматика в схемах и таблицах', N'729025.jpg', NULL, 370, NULL, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (63, NULL, N'Dive in! Green', N'729199.jpg', NULL, 640, NULL, NULL, NULL, NULL, 6, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (64, NULL, N'English Grammar Today Book with Workbook', N'700707.jpg', NULL, 4110, NULL, NULL, NULL, NULL, 38, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (65, NULL, N'Разговорная грамматика английского языка', N'725306.jpg', NULL, 360, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (66, NULL, N'Think. Level 3. B1+. Workbook with Online Practice', N'701138.jpg', NULL, 1140, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (67, NULL, N'Английский язык за 3 месяца. Быстрый восстановитель знаний', N'714131.jpg', NULL, 270, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (68, NULL, N'Prepare. Level 4. B1. Student''s Book', N'701097.jpg', NULL, 1810, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (69, NULL, N'Английский язык. Идиомы (полезные карточки)', N'729857.jpg', NULL, 140, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (70, NULL, N'Английский язык. Все времена и глаголы в схемах и таблицах', N'729495.jpg', NULL, 350, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (71, NULL, N'Английский с нуля. Учебное пособие', N'716806.jpg', NULL, 1840, NULL, NULL, NULL, NULL, 50, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (72, NULL, N'English Vocabulary in Use. Elementary. Book with Answers and Enhanced eBook', N'700704.jpg', NULL, 2380, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (73, NULL, N'Каллиграфия. Английский курсив. Самоучитель', N'721737.jpg', NULL, 270, NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (74, NULL, N'Ship or Sheep? An intermediate pronunciation course', N'701112.jpg', NULL, 2210, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (75, NULL, N'Eyes Open. Level 3. Workbook with Online Practice', N'700891.jpg', NULL, 1110, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (76, NULL, N'New Enterprise A2 - Grammar Book (with Digibooks App)', N'701883.jpg', NULL, 1250, NULL, NULL, NULL, NULL, 8, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (77, NULL, N'Cracking the GRE Premium Edition with 6 Practice Tests, 2020', N'730252.jpg', NULL, 3110, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (78, NULL, N'Prepare. Level 5. B1. Student''s Book', N'701098.jpg', NULL, 1790, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (79, NULL, N'Английский язык для менеджеров. Учебное пособие', N'693032.jpg', NULL, 1280, NULL, NULL, NULL, NULL, 50, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (80, NULL, N'Учебник английского языка. Часть 2', N'717996.jpg', NULL, 690, NULL, NULL, NULL, NULL, 36, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (81, NULL, N'Быстрый английский для начинающих', N'714137.jpg', NULL, 230, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (82, NULL, N'Prepare. Level 3. A2. Student''s Book', N'701094.jpg', NULL, 1810, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (83, NULL, N'Тренажер по чтению. Самый быстрый способ выучить английский язык', N'718058.jpg', NULL, 120, NULL, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (84, NULL, N'English Vocabulary in Use. Upper-Intermediate. Book with Answers', N'700705.jpg', NULL, 1890, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (85, NULL, N'Professional English for PR Students: People and Society', N'716803.jpg', NULL, 780, NULL, NULL, NULL, NULL, 50, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (86, NULL, N'Английский язык. Идиомы', N'713805.jpg', NULL, 130, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (87, NULL, N'Elementary Vocabulary + Grammar. Foe Beginners and Pre-Intermediate Students. Учебное пособие', N'731489.jpg', NULL, 960, NULL, NULL, NULL, NULL, 24, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (88, NULL, N'Самый быстрый способ выучить неправильные английские глаголы', N'718057.jpg', NULL, 70, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (89, NULL, N'English Grammar in Use. Book without Answers', N'700691.jpg', NULL, 1760, NULL, NULL, NULL, NULL, 38, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (90, NULL, N'Английская грамматика. Самое важное. Учебное пособие (мини)', N'726085.jpg', NULL, 80, NULL, NULL, NULL, NULL, 7, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (91, NULL, N'Grammar in Use Intermediate Student''s Book with Answers Self-study Reference and Practice', N'700901.jpg', NULL, 1950, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (92, NULL, N'English Grammar in Use. Book with Answers', N'700689.jpg', NULL, 1950, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (93, NULL, N'Английский для малышей и мам @my_english_baby. Как воспитать билингвального ребенка', N'718408.jpg', NULL, 390, NULL, NULL, NULL, NULL, 17, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (94, NULL, N'Грамматический профиль. Grammar Profile. Учебное пособие', N'710904.jpg', NULL, 450, NULL, NULL, NULL, NULL, 47, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (95, NULL, N'Английский язык на пальцах', N'712495.jpg', NULL, 360, NULL, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (96, NULL, N'Prepare. Level 2. A2. Workbook with Audio Download', N'701093.jpg', NULL, 1340, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (97, NULL, N'Учебник английского языка. Часть 1', N'713136.jpg', NULL, 710, NULL, NULL, NULL, NULL, 36, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (98, NULL, N'Грамматика английского языка. Просто и доступно. Учебное пособие', N'696499.jpg', NULL, 450, NULL, NULL, NULL, NULL, 47, 0)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (99, NULL, N'Безупречный английский. Самоучитель для начинающих', N'727495.jpg', NULL, 680, NULL, NULL, NULL, NULL, 17, 1)
GO
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (100, NULL, N'Your Space. Level 1. Student''s Book', N'701149.jpg', NULL, 1370, NULL, NULL, NULL, NULL, 38, 1)
SET IDENTITY_INSERT [dbo].[Good] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (1, N'ADMIN')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (2, N'USER')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Sell] ON 

INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (1, 92, 1, CAST(N'2019-10-13T18:32:07.000' AS DateTime), N'agapow')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (2, 74, 1, CAST(N'2019-03-11T10:27:29.000' AS DateTime), N'andreeva')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (3, 90, 1, CAST(N'2019-08-10T12:07:36.000' AS DateTime), N'aschmitz')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (4, 89, 1, CAST(N'2019-05-22T12:24:47.000' AS DateTime), N'balchen')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (5, 46, 2, CAST(N'2019-02-09T11:35:40.000' AS DateTime), N'attwood')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (6, 93, 2, CAST(N'2019-07-13T14:32:24.000' AS DateTime), N'balchen')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (7, 20, 1, CAST(N'2019-05-26T17:13:18.000' AS DateTime), N'bigmauler')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (8, 92, 1, CAST(N'2019-03-28T17:54:22.000' AS DateTime), N'brickbat')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (9, 37, 2, CAST(N'2019-10-22T18:55:53.000' AS DateTime), N'budinger')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (10, 1, 2, CAST(N'2019-03-04T09:40:36.000' AS DateTime), N'claesjac')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (11, 51, 1, CAST(N'2019-09-17T19:38:39.000' AS DateTime), N'cmdrgravy')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (12, 28, 2, CAST(N'2019-04-16T18:09:32.000' AS DateTime), N'csilvers')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (13, 24, 1, CAST(N'2019-05-10T12:22:42.000' AS DateTime), N'dalamb')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (14, 37, 2, CAST(N'2019-04-13T08:33:20.000' AS DateTime), N'dieman')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (15, 21, 1, CAST(N'2019-01-31T14:42:16.000' AS DateTime), N'dogdude')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (16, 23, 3, CAST(N'2019-03-29T18:41:11.000' AS DateTime), N'drezet')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (17, 45, 1, CAST(N'2019-08-18T14:30:13.000' AS DateTime), N'firstpr')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (18, 44, 2, CAST(N'2019-05-19T08:41:55.000' AS DateTime), N'gordonjcp')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (19, 54, 2, CAST(N'2019-03-30T19:10:48.000' AS DateTime), N'hedwig')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (20, 95, 1, CAST(N'2019-06-02T14:46:15.000' AS DateTime), N'hllam')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (21, 20, 3, CAST(N'2019-07-05T08:24:15.000' AS DateTime), N'ilikered')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (22, 26, 2, CAST(N'2019-08-29T16:31:11.000' AS DateTime), N'jgmyers')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (23, 38, 3, CAST(N'2019-03-06T11:18:08.000' AS DateTime), N'jigsaw')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (24, 91, 3, CAST(N'2019-04-03T12:42:05.000' AS DateTime), N'jonathan')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (25, 69, 2, CAST(N'2019-02-21T13:28:29.000' AS DateTime), N'jorgb')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (26, 76, 1, CAST(N'2019-09-03T17:04:32.000' AS DateTime), N'jrkorson')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (27, 70, 2, CAST(N'2019-09-26T12:19:46.000' AS DateTime), N'kildjean')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (28, 69, 3, CAST(N'2019-09-21T12:53:52.000' AS DateTime), N'kwilliams')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (29, 15, 1, CAST(N'2019-01-04T08:12:33.000' AS DateTime), N'lishoy')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (30, 53, 2, CAST(N'2019-12-07T08:32:42.000' AS DateTime), N'miturria')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (31, 58, 2, CAST(N'2019-06-20T10:54:48.000' AS DateTime), N'moxfulder')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (32, 35, 1, CAST(N'2019-02-27T08:29:25.000' AS DateTime), N'nichoj')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (33, 82, 3, CAST(N'2019-03-02T19:18:48.000' AS DateTime), N'oevans')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (34, 59, 1, CAST(N'2019-07-10T16:39:00.000' AS DateTime), N'ozawa')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (35, 65, 3, CAST(N'2019-11-01T19:54:54.000' AS DateTime), N'parkes')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (36, 35, 2, CAST(N'2019-08-26T16:34:31.000' AS DateTime), N'parsimony')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (37, 73, 3, CAST(N'2019-08-06T13:00:27.000' AS DateTime), N'penna')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (38, 25, 2, CAST(N'2019-11-23T16:07:16.000' AS DateTime), N'petersen')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (39, 58, 1, CAST(N'2019-10-15T14:11:24.000' AS DateTime), N'rasca')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (40, 20, 3, CAST(N'2019-03-02T15:31:42.000' AS DateTime), N'rbarreira')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (41, 99, 3, CAST(N'2019-02-10T14:04:05.000' AS DateTime), N'rfoley')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (42, 97, 1, CAST(N'2019-11-29T15:42:24.000' AS DateTime), N'rnelson')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (43, 17, 1, CAST(N'2019-07-23T14:24:10.000' AS DateTime), N'salesgeek')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (44, 25, 2, CAST(N'2019-12-08T17:21:01.000' AS DateTime), N'sinkou')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (45, 97, 1, CAST(N'2019-04-09T16:06:23.000' AS DateTime), N'sjava')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (46, 86, 2, CAST(N'2019-02-22T08:55:02.000' AS DateTime), N'smcnabb')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (47, 76, 2, CAST(N'2019-08-17T11:37:30.000' AS DateTime), N'solomon')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (48, 92, 3, CAST(N'2019-03-11T12:49:22.000' AS DateTime), N'staffelb')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (49, 16, 1, CAST(N'2019-03-19T10:57:38.000' AS DateTime), N'uncle')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (50, 31, 1, CAST(N'2019-10-17T17:07:08.000' AS DateTime), N'vmalik')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (51, 89, 2, CAST(N'2019-11-26T13:02:13.000' AS DateTime), N'yruan')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (52, 18, 3, CAST(N'2019-02-16T09:44:38.000' AS DateTime), N'vmalik')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (53, 20, 3, CAST(N'2019-12-31T17:19:38.000' AS DateTime), N'yruan')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (54, 2, 1, CAST(N'2019-11-19T11:34:00.000' AS DateTime), N'uncle')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (55, 48, 1, CAST(N'2019-09-13T16:55:09.000' AS DateTime), N'staffelb')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (56, 72, 2, CAST(N'2019-12-14T10:34:25.000' AS DateTime), N'solomon')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (57, 58, 1, CAST(N'2019-05-20T17:49:34.000' AS DateTime), N'smcnabb')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (58, 100, 2, CAST(N'2019-03-26T14:45:59.000' AS DateTime), N'sjava')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (59, 57, 2, CAST(N'2019-09-14T19:44:46.000' AS DateTime), N'sinkou')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (60, 75, 1, CAST(N'2019-09-06T10:24:55.000' AS DateTime), N'salesgeek')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (61, 61, 3, CAST(N'2019-05-09T13:33:22.000' AS DateTime), N'rnelson')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (62, 93, 2, CAST(N'2019-03-06T13:39:56.000' AS DateTime), N'rfoley')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (63, 17, 1, CAST(N'2019-03-29T08:40:19.000' AS DateTime), N'rbarreira')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (64, 43, 2, CAST(N'2019-07-25T19:00:10.000' AS DateTime), N'rasca')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (65, 3, 3, CAST(N'2019-10-13T09:57:09.000' AS DateTime), N'petersen')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (66, 75, 3, CAST(N'2019-01-06T10:51:04.000' AS DateTime), N'penna')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (67, 2, 1, CAST(N'2019-04-10T14:04:35.000' AS DateTime), N'agapow')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (68, 83, 1, CAST(N'2019-05-13T17:13:38.000' AS DateTime), N'andreeva')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (69, 73, 1, CAST(N'2019-07-25T16:06:16.000' AS DateTime), N'aschmitz')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (70, 58, 2, CAST(N'2019-03-18T17:03:33.000' AS DateTime), N'attwood')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (71, 21, 3, CAST(N'2019-01-05T13:50:53.000' AS DateTime), N'balchen')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (72, 17, 2, CAST(N'2019-03-25T18:38:55.000' AS DateTime), N'bigmauler')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (73, 6, 3, CAST(N'2019-08-13T18:20:29.000' AS DateTime), N'brickbat')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (74, 62, 2, CAST(N'2019-03-25T10:52:42.000' AS DateTime), N'budinger')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (75, 45, 2, CAST(N'2019-02-18T08:40:43.000' AS DateTime), N'claesjac')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (76, 48, 3, CAST(N'2019-02-28T19:19:21.000' AS DateTime), N'cmdrgravy')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (77, 65, 1, CAST(N'2019-06-28T15:42:50.000' AS DateTime), N'csilvers')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (78, 23, 3, CAST(N'2019-11-04T18:31:26.000' AS DateTime), N'dalamb')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (79, 79, 2, CAST(N'2019-11-09T14:55:07.000' AS DateTime), N'dieman')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (80, 53, 2, CAST(N'2019-05-17T09:47:47.000' AS DateTime), N'dogdude')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (81, 74, 2, CAST(N'2019-05-29T15:34:54.000' AS DateTime), N'drezet')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (82, 26, 1, CAST(N'2019-04-11T17:27:37.000' AS DateTime), N'firstpr')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (83, 69, 1, CAST(N'2019-04-15T11:50:19.000' AS DateTime), N'gordonjcp')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (84, 84, 1, CAST(N'2019-12-04T08:46:24.000' AS DateTime), N'hedwig')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (85, 60, 2, CAST(N'2019-02-04T09:53:35.000' AS DateTime), N'hllam')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (86, 2, 3, CAST(N'2019-03-07T15:56:29.000' AS DateTime), N'ilikered')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (87, 67, 1, CAST(N'2019-03-04T16:01:38.000' AS DateTime), N'jgmyers')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (88, 17, 1, CAST(N'2019-10-01T16:57:46.000' AS DateTime), N'jigsaw')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (89, 72, 1, CAST(N'2019-05-23T10:20:58.000' AS DateTime), N'jonathan')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (90, 95, 1, CAST(N'2019-06-10T10:36:57.000' AS DateTime), N'jorgb')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (91, 50, 2, CAST(N'2019-04-24T09:16:41.000' AS DateTime), N'jrkorson')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (92, 80, 2, CAST(N'2019-03-09T14:50:50.000' AS DateTime), N'kildjean')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (93, 93, 1, CAST(N'2019-06-09T19:44:58.000' AS DateTime), N'kwilliams')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (94, 37, 3, CAST(N'2019-10-09T09:47:44.000' AS DateTime), N'lishoy')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (95, 84, 3, CAST(N'2019-07-29T08:20:37.000' AS DateTime), N'miturria')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (96, 34, 2, CAST(N'2019-12-16T11:29:06.000' AS DateTime), N'moxfulder')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (97, 50, 2, CAST(N'2019-08-28T10:57:04.000' AS DateTime), N'nichoj')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (98, 64, 2, CAST(N'2019-06-01T10:23:36.000' AS DateTime), N'oevans')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (99, 37, 1, CAST(N'2019-02-04T19:48:02.000' AS DateTime), N'ozawa')
GO
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (100, 76, 1, CAST(N'2019-10-13T15:39:35.000' AS DateTime), N'parkes')
INSERT [dbo].[Sell] ([SellId], [GoodId], [Count], [DateSell], [UserName]) VALUES (106, 4, 5, CAST(N'2022-05-26T16:13:54.000' AS DateTime), N'parsimony')
SET IDENTITY_INSERT [dbo].[Sell] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (1, N'Занятие с репетитором-носителем китайского языка', NULL, 1860, 120, N'Китайский язык.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (2, N'Индивидуальный урок немецкого языка с преподавателем-носителем языка', NULL, 960, 110, N'Немецкий язык.png', 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (3, N'Киноклуб китайского языка для студентов', NULL, 1250, 100, N'киноклуб.jpg', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (4, N'Индивидуальный онлайн-урок японского языка по Skype', NULL, 1670, 80, N'online lessons.jpg', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (5, N'Киноклуб испанского языка для студентов', NULL, 1050, 40, N'киноклуб.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (6, N'Занятие с русскоязычным репетитором испанского языка', NULL, 1410, 50, N'Испанский язык.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (7, N'Урок в группе итальянского языка для взрослых', NULL, 1450, 40, N'Итальянский язык.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (8, N'Интенсивный онлайн-курс французского языка для компаний по Skype', NULL, 1420, 40, N'online lessons.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (9, N'Индивидуальный урок французского языка с преподавателем-носителем языка', NULL, 1280, 40, N'Французский язык.jpg', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (10, N'Урок в группе французского языка для школьников', NULL, 1940, 100, N'Французский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (11, N'Занятие с репетитором-носителем английского языка', NULL, 1140, 50, N'1Английский язык.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (12, N'Киноклуб французского языка для взрослых', NULL, 1600, 90, N'киноклуб.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (13, N'Киноклуб немецкого языка для взрослых', NULL, 1630, 100, N'киноклуб.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (14, N'Урок в группе японского языка для школьников', NULL, 1510, 80, N'Японский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (15, N'Индивидуальный урок испанского языка с русскоязычным преподавателем', NULL, 1560, 60, N'Испанский язык.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (16, N'Интенсивный онлайн-курс итальянского языка для компаний по Skype', NULL, 1390, 70, N'online lessons.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (17, N'Урок в группе японского языка для студентов', NULL, 1840, 50, N'Японский язык.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (18, N'Интенсивный курс с преподавателем-носителем английского языка для компаний', NULL, 1260, 110, N'for company.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (19, N'Киноклуб итальянского языка для студентов', NULL, 1950, 30, N'киноклуб.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (20, N'Урок в группе испанского языка для взрослых', NULL, 1120, 30, N'Испанский язык.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (21, N'Урок в группе испанского языка для студентов', NULL, 1910, 100, N'Испанский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (22, N'Интенсивный онлайн-курс испанского языка для компаний по Skype', NULL, 1150, 120, N'online lessons.jpg', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (23, N'Урок в группе английского языка для школьников', NULL, 2040, 110, N'Английский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (24, N'Занятие с репетитором-носителем испанского языка', NULL, 1410, 50, N'Испанский язык.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (25, N'Интенсивный курс с преподавателем-носителем итальянского языка для компаний', NULL, 1120, 40, N'for company.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (26, N'Урок в группе китайского языка для студентов', NULL, 1410, 40, N'Китайский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (27, N'Индивидуальный урок испанского языка с преподавателем-носителем языка', NULL, 1200, 90, N'Испанский язык.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (28, N'Интенсивный онлайн-курс португальского языка для компаний по Skype', NULL, 1230, 70, N'online lessons.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (29, N'Подготовка к экзамену ACT', NULL, 1970, 50, N'Подготовка к экзамену ACT.png', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (30, N'Урок в группе китайского языка для взрослых', NULL, 2010, 70, N'Китайский язык.jpg', 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (31, N'Интенсивный онлайн-курс английского языка для компаний по Skype', NULL, 1330, 50, N'online lessons.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (32, N'Подготовка к экзамену TOEFL', NULL, 1620, 100, N'Подготовка к экзамену TOEFL.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (33, N'Занятие с репетитором-носителем итальянского языка', NULL, 1100, 120, N'Итальянский язык.jpg', 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (34, N'Урок в группе английского языка для взрослых', NULL, 1760, 50, N'Английский язык.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (35, N'Киноклуб английского языка для взрослых', NULL, 1860, 70, N'киноклуб.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (36, N'Интенсивный курс с преподавателем-носителем французского языка для компаний', NULL, 1670, 70, N'for company.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (37, N'Урок в группе испанского языка для школьников', NULL, 1910, 120, N'Испанский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (38, N'Подготовка к экзамену GRE', NULL, 900, 80, N'Подготовка к экзамену GRE.jpeg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (39, N'Урок в группе английского языка для студентов', NULL, 1760, 80, N'Английский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (40, N'Занятие с русскоязычным репетитором японского языка', NULL, 1300, 40, N'Японский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (41, N'Индивидуальный онлайн-урок немецкого языка по Skype', NULL, 1610, 90, N'online lessons.jpg', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (42, N'Интенсивный курс японского языка с русскоязычным преподавателем для компаний', NULL, 1090, 80, N'for company.jpg', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (43, N'Киноклуб китайского языка для взрослых', NULL, 1760, 70, N'киноклуб.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (44, N'Индивидуальный урок китайского языка с русскоязычным преподавателем', NULL, 1730, 120, N'Китайский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (45, N'Подготовка к экзамену GMAT', NULL, 1730, 70, N'Подготовка к экзамену GMAT.png', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (46, N'Подготовка к экзамену IELTS', NULL, 900, 120, N'Подготовка к экзамену IELTS.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (47, N'Подготовка к экзамену SAT', NULL, 1290, 40, N'Подготовка к экзамену SAT.png', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (48, N'Урок в группе китайского языка для школьников', NULL, 1870, 50, N'Китайский язык.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (49, N'Киноклуб английского языка для студентов', NULL, 950, 80, N'киноклуб.jpg', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (50, N'Киноклуб португальского языка для студентов', NULL, 1570, 30, N'киноклуб.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (51, N'Киноклуб китайского языка для детей', NULL, 1300, 100, N'киноклуб.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (52, N'Урок в группе немецкого языка для школьников', NULL, 1780, 30, N'Немецкий язык.png', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (53, N'Индивидуальный онлайн-урок испанского языка по Skype', NULL, 2010, 70, N'online lessons.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (54, N'Урок в группе немецкого языка для взрослых', NULL, 1300, 60, N'Немецкий язык.png', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (55, N'Индивидуальный урок китайского языка с преподавателем-носителем языка', NULL, 1440, 90, N'Китайский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (56, N'Занятие с русскоязычным репетитором португальского языка', NULL, 990, 50, N'Португальский язык.jpg', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (57, N'Интенсивный курс китайского языка с русскоязычным преподавателем для компаний', NULL, 1240, 110, N'for company.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (58, N'Занятие с русскоязычным репетитором немецкого языка', NULL, 930, 30, N'Немецкий язык.png', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (59, N'Киноклуб английского языка для детей', NULL, 1180, 40, N'киноклуб.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (60, N'Занятие с репетитором-носителем немецкого языка', NULL, 1950, 120, N'Немецкий язык.png', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (61, N'Индивидуальный онлайн-урок китайского языка по Skype', NULL, 1210, 70, N'online lessons.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (62, N'Индивидуальный урок английского языка с преподавателем-носителем языка', NULL, 1660, 120, N'Английский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (63, N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', NULL, 1560, 120, N'for company.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (64, N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', NULL, 960, 70, N'online lessons.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (65, N'Урок в группе итальянского языка для школьников', NULL, 1910, 100, N'Итальянский язык.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (66, N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', NULL, 1340, 30, N'Итальянский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (67, N'Интенсивный онлайн-курс китайского языка для компаний по Skype', NULL, 1180, 120, N'online lessons.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (68, N'Занятие с русскоязычным репетитором французского языка', NULL, 1580, 100, N'Французский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (69, N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', NULL, 1480, 30, N'Немецкий язык.png', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (70, N'Индивидуальный онлайн-урок английского языка по Skype', NULL, 1000, 100, N'online lessons.jpg', 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (71, N'Индивидуальный урок французского языка с русскоязычным преподавателем', NULL, 1430, 70, N'Французский язык.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (72, N'Интенсивный курс португальского языка с русскоязычным преподавателем для компаний', NULL, 1790, 60, N'for company.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (73, N'Индивидуальный онлайн-урок французского языка по Skype', NULL, 1380, 120, N'online lessons.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (74, N'Интенсивный курс английского языка с русскоязычным преподавателем для компаний', NULL, 1710, 80, N'for company.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (75, N'Урок в группе французского языка для взрослых', NULL, 980, 120, N'Французский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (76, N'Подготовка к экзамену IELTS Speaking Club', NULL, 1730, 90, N'Подготовка к экзамену IELTS.jpg', 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (77, N'Киноклуб итальянского языка для детей', NULL, 1310, 70, N'киноклуб.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (78, N'Урок в группе итальянского языка для студентов', NULL, 970, 110, N'Итальянский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (79, N'Индивидуальный урок итальянского языка с преподавателем-носителем языка', NULL, 1190, 80, N'Итальянский язык.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (80, N'Киноклуб немецкого языка для детей', NULL, 1170, 120, N'киноклуб.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (81, N'Киноклуб итальянского языка для взрослых', NULL, 1500, 110, N'киноклуб.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (82, N'Киноклуб португальского языка для взрослых', NULL, 1970, 30, N'киноклуб.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (83, N'Киноклуб португальского языка для детей', NULL, 1160, 90, N'киноклуб.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (84, N'Киноклуб французского языка для детей', NULL, 1070, 90, N'киноклуб.jpg', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (85, N'Урок в группе японского языка для взрослых', NULL, 2000, 80, N'Японский язык.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (86, N'Интенсивный курс французского языка с русскоязычным преподавателем для компаний', NULL, 1180, 40, N'for company.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (87, N'Занятие с русскоязычным репетитором итальянского языка', NULL, 1480, 70, N'Итальянский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (88, N'Индивидуальный урок английского языка с русскоязычным преподавателем', NULL, 1990, 30, N'Английский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (89, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', NULL, 1000, 30, N'for company.jpg', 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (90, N'Интенсивный курс испанского языка с русскоязычным преподавателем для компаний', NULL, 1420, 90, N'for company.jpg', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (91, N'Киноклуб немецкого языка для студентов', NULL, 910, 50, N'киноклуб.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (92, N'Занятие с репетитором-носителем французского языка', NULL, 1770, 50, N'Французский язык.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (93, N'Урок в группе немецкого языка для студентов', NULL, 1020, 70, N'Немецкий язык.png', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (94, N'Занятие с русскоязычным репетитором китайского языка', NULL, 940, 110, N'Китайский язык.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (95, N'Занятие с репетитором-носителем японского языка', NULL, 1880, 50, N'Японский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (96, N'Урок в группе французского языка для студентов', NULL, 1470, 30, N'Французский язык.jpg', 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (97, N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', NULL, 1800, 110, N'for company.jpg', 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (98, N'Занятие с русскоязычным репетитором английского языка', NULL, 1370, 90, N'Английский язык.jpg', 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (99, N'Интенсивный курс с преподавателем-носителем испанского языка для компаний', NULL, 1010, 90, N'for company.jpg', 25)
GO
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (100, N'Интенсивный курс с преподавателем-носителем японского языка для компаний', NULL, 1690, 70, N'for company.jpg', 0)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[Speciality] ON 

INSERT [dbo].[Speciality] ([SpecialityId], [SpecialityPay], [SpecialityName]) VALUES (1, 501.00000000000023, N'англиийский язык')
INSERT [dbo].[Speciality] ([SpecialityId], [SpecialityPay], [SpecialityName]) VALUES (2, 600, N'португальский язык')
INSERT [dbo].[Speciality] ([SpecialityId], [SpecialityPay], [SpecialityName]) VALUES (3, 400, N'испанский язык')
SET IDENTITY_INSERT [dbo].[Speciality] OFF
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (2, 2, 3)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (3, 3, 4)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (4, 4, 2)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (6, 5, 6)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (7, 6, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (8, 7, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (9, 8, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (10, 9, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (11, 10, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (12, 11, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (13, 12, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (14, 13, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (15, 14, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (16, 15, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (18, 16, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (19, 17, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (20, 18, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (21, 19, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (22, 20, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (23, 21, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (24, 22, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (25, 23, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (26, 24, 4)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (27, 25, 1)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (28, 26, 5)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (29, 27, 9)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (30, 29, 5)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (31, 30, 5)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (33, 31, 6)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (34, 32, 5)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (35, 33, 5)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (36, 34, 5)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (37, 35, 6)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (38, 37, 8)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (39, 38, 9)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (40, 39, 50)
SET IDENTITY_INSERT [dbo].[Store] OFF
SET IDENTITY_INSERT [dbo].[TimeSheet] ON 

INSERT [dbo].[TimeSheet] ([TimeSheetId], [WorkerId], [ServiceId], [ServiceTime], [DayWeek]) VALUES (2, 1, 11, CAST(N'16:00:00' AS Time), N'Четверг')
INSERT [dbo].[TimeSheet] ([TimeSheetId], [WorkerId], [ServiceId], [ServiceTime], [DayWeek]) VALUES (4, 2, 11, CAST(N'18:00:00' AS Time), N'Вторник')
INSERT [dbo].[TimeSheet] ([TimeSheetId], [WorkerId], [ServiceId], [ServiceTime], [DayWeek]) VALUES (5, 2, 70, CAST(N'18:00:00' AS Time), N'Четверг')
INSERT [dbo].[TimeSheet] ([TimeSheetId], [WorkerId], [ServiceId], [ServiceTime], [DayWeek]) VALUES (6, 2, 98, CAST(N'18:00:00' AS Time), N'Пятница')
INSERT [dbo].[TimeSheet] ([TimeSheetId], [WorkerId], [ServiceId], [ServiceTime], [DayWeek]) VALUES (7, 1, 11, CAST(N'17:00:00' AS Time), N'Понедельник')
INSERT [dbo].[TimeSheet] ([TimeSheetId], [WorkerId], [ServiceId], [ServiceTime], [DayWeek]) VALUES (8, 5, 98, CAST(N'16:00:00' AS Time), N'Среда')
SET IDENTITY_INSERT [dbo].[TimeSheet] OFF
SET IDENTITY_INSERT [dbo].[Visit] ON 

INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (1, N'attwood', 10, NULL, NULL, CAST(N'2019-11-16T11:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (2, N'sinkou', 41, NULL, NULL, CAST(N'2019-01-11T18:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (3, N'sinkou', 19, NULL, NULL, CAST(N'2019-12-01T14:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (4, N'sinkou', 28, NULL, NULL, CAST(N'2019-02-11T13:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (5, N'jigsaw', 30, NULL, NULL, CAST(N'2019-09-10T18:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (6, N'ilikered', 26, NULL, NULL, CAST(N'2019-02-12T19:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (7, N'csilvers', 92, NULL, NULL, CAST(N'2019-04-04T09:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (8, N'dalamb', 20, NULL, NULL, CAST(N'2019-05-15T09:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (9, N'jorgb', 52, NULL, NULL, CAST(N'2019-01-16T14:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (10, N'petersen', 34, NULL, NULL, CAST(N'2019-01-16T09:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (11, N'ozawa', 52, NULL, NULL, CAST(N'2019-03-15T10:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (12, N'andreeva', 41, NULL, NULL, CAST(N'2019-01-31T12:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (13, N'budinger', 64, NULL, NULL, CAST(N'2019-11-19T15:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (14, N'oevans', 32, NULL, NULL, CAST(N'2019-01-10T08:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (15, N'penna', 52, NULL, NULL, CAST(N'2019-04-29T15:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (16, N'staffelb', 80, NULL, NULL, CAST(N'2019-10-12T08:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (17, N'ilikered', 48, NULL, NULL, CAST(N'2019-02-13T18:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (18, N'oevans', 64, NULL, NULL, CAST(N'2019-02-01T18:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (19, N'petersen', 63, NULL, NULL, CAST(N'2019-11-12T18:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (20, N'uncle', 83, NULL, NULL, CAST(N'2019-01-11T12:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (21, N'bigmauler', 50, NULL, NULL, CAST(N'2019-03-23T19:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (22, N'staffelb', 12, NULL, NULL, CAST(N'2019-06-23T08:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (23, N'dogdude', 18, NULL, NULL, CAST(N'2019-05-25T17:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (24, N'uncle', 67, NULL, NULL, CAST(N'2019-02-18T18:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (25, N'penna', 13, NULL, NULL, CAST(N'2019-07-17T08:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (26, N'penna', 92, NULL, NULL, CAST(N'2019-08-06T16:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (27, N'miturria', 77, NULL, NULL, CAST(N'2019-12-14T08:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (28, N'brickbat', 76, NULL, NULL, CAST(N'2019-06-28T14:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (29, N'ilikered', 97, NULL, NULL, CAST(N'2019-06-06T19:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (30, N'csilvers', 50, NULL, NULL, CAST(N'2019-06-07T17:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (31, N'kildjean', 23, NULL, NULL, CAST(N'2019-04-30T18:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (32, N'budinger', 83, NULL, NULL, CAST(N'2019-08-30T11:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (33, N'kwilliams', 20, NULL, NULL, CAST(N'2019-05-08T14:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (34, N'agapow', 66, NULL, NULL, CAST(N'2019-10-27T16:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (35, N'petersen', 13, NULL, NULL, CAST(N'2019-01-05T08:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (36, N'brickbat', 27, NULL, NULL, CAST(N'2019-03-04T17:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (37, N'drezet', 69, NULL, NULL, CAST(N'2019-09-29T13:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (38, N'rbarreira', 3, NULL, NULL, CAST(N'2019-01-22T10:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (39, N'petersen', 64, NULL, NULL, CAST(N'2019-12-19T19:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (40, N'lishoy', 29, NULL, NULL, CAST(N'2019-11-15T17:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (41, N'jgmyers', 9, NULL, NULL, CAST(N'2019-07-04T17:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (42, N'dalamb', 41, NULL, NULL, CAST(N'2019-08-06T11:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (43, N'penna', 80, NULL, NULL, CAST(N'2019-11-09T13:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (44, N'csilvers', 62, NULL, NULL, CAST(N'2019-02-16T18:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (45, N'sjava', 69, NULL, NULL, CAST(N'2019-03-03T17:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (46, N'rasca', 23, NULL, NULL, CAST(N'2019-05-22T16:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (47, N'nichoj', 10, NULL, NULL, CAST(N'2019-07-31T18:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (48, N'jorgb', 27, NULL, NULL, CAST(N'2019-08-29T19:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (49, N'dalamb', 13, NULL, NULL, CAST(N'2019-10-02T10:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (50, N'gordonjcp', 41, NULL, NULL, CAST(N'2019-03-16T11:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (51, N'staffelb', 29, NULL, NULL, CAST(N'2019-08-27T11:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (52, N'solomon', 66, NULL, NULL, CAST(N'2019-06-13T11:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (53, N'firstpr', 80, NULL, NULL, CAST(N'2019-08-18T16:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (54, N'hedwig', 34, NULL, NULL, CAST(N'2019-12-26T16:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (55, N'salesgeek', 7, NULL, NULL, CAST(N'2019-11-27T18:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (56, N'hllam', 13, NULL, NULL, CAST(N'2019-09-06T19:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (57, N'kildjean', 98, NULL, NULL, CAST(N'2019-09-24T13:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (58, N'lishoy', 89, NULL, NULL, CAST(N'2019-03-01T11:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (59, N'yruan', 7, NULL, NULL, CAST(N'2019-09-28T10:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (60, N'jrkorson', 92, NULL, NULL, CAST(N'2019-03-20T10:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (61, N'jonathan', 80, NULL, NULL, CAST(N'2019-11-27T11:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (62, N'ozawa', 60, NULL, NULL, CAST(N'2019-01-23T18:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (63, N'rbarreira', 27, NULL, NULL, CAST(N'2019-10-21T10:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (64, N'smcnabb', 92, NULL, NULL, CAST(N'2019-08-11T12:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (65, N'rnelson', 13, NULL, NULL, CAST(N'2019-01-03T14:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (66, N'oevans', 64, NULL, NULL, CAST(N'2019-12-31T08:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (67, N'aschmitz', 20, NULL, NULL, CAST(N'2019-08-29T10:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (68, N'rasca', 19, NULL, NULL, CAST(N'2019-01-03T18:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (69, N'hedwig', 30, NULL, NULL, CAST(N'2019-04-09T11:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (70, N'rbarreira', 12, NULL, NULL, CAST(N'2019-12-31T19:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (71, N'claesjac', 19, NULL, NULL, CAST(N'2019-10-17T13:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (72, N'kildjean', 69, NULL, NULL, CAST(N'2019-05-17T13:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (73, N'salesgeek', 14, NULL, NULL, CAST(N'2019-11-23T18:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (74, N'jonathan', 83, NULL, NULL, CAST(N'2019-07-10T15:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (75, N'sinkou', 40, NULL, NULL, CAST(N'2019-06-09T13:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (76, N'sjava', 69, NULL, NULL, CAST(N'2019-01-09T10:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (77, N'claesjac', 60, NULL, NULL, CAST(N'2019-08-15T18:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (78, N'parsimony', 83, NULL, NULL, CAST(N'2019-07-15T14:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (79, N'dalamb', 14, NULL, NULL, CAST(N'2019-12-31T18:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (80, N'lishoy', 7, NULL, NULL, CAST(N'2019-12-22T09:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (81, N'hedwig', 51, NULL, NULL, CAST(N'2019-12-28T16:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (82, N'oevans', 69, NULL, NULL, CAST(N'2019-06-26T10:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (83, N'jonathan', 10, NULL, NULL, CAST(N'2019-04-29T12:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (84, N'ilikered', 10, NULL, NULL, CAST(N'2019-04-13T09:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (85, N'sjava', 48, NULL, NULL, CAST(N'2019-01-05T16:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (86, N'yruan', 40, NULL, NULL, CAST(N'2019-03-25T18:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (87, N'parsimony', 18, NULL, NULL, CAST(N'2019-11-09T18:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (88, N'dieman', 41, NULL, NULL, CAST(N'2019-04-07T10:40:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (89, N'attwood', 67, NULL, NULL, CAST(N'2019-11-11T18:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (90, N'vmalik', 13, NULL, NULL, CAST(N'2019-01-06T15:00:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (91, N'firstpr', 48, NULL, NULL, CAST(N'2019-08-20T19:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (92, N'moxfulder', 48, NULL, NULL, CAST(N'2019-04-16T13:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (93, N'rbarreira', 52, NULL, NULL, CAST(N'2019-12-22T15:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (94, N'balchen', 83, NULL, NULL, CAST(N'2019-01-22T16:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (95, N'gordonjcp', 18, NULL, NULL, CAST(N'2019-09-04T08:10:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (96, N'aschmitz', 77, NULL, NULL, CAST(N'2019-01-01T14:50:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (97, N'penna', 14, NULL, NULL, CAST(N'2019-01-29T16:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (98, N'balchen', 49, NULL, NULL, CAST(N'2019-07-06T11:30:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (99, N'smcnabb', 98, NULL, NULL, CAST(N'2019-12-05T10:20:00.000' AS DateTime))
GO
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (100, N'jigsaw', 48, NULL, NULL, CAST(N'2019-04-05T13:20:00.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (101, N'hllam', 15, NULL, NULL, CAST(N'2022-05-26T16:50:38.000' AS DateTime))
INSERT [dbo].[Visit] ([VisitId], [UserName], [ServiceId], [Paid], [Rewiew], [DateActual]) VALUES (103, N'petersen', 41, NULL, NULL, CAST(N'2022-05-27T10:55:50.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Visit] OFF
SET IDENTITY_INSERT [dbo].[Worker] ON 

INSERT [dbo].[Worker] ([WorkerId], [LastName], [FirstName], [MiddleName], [Birthday], [WorkExperience], [Info], [Photo]) VALUES (1, N'Кузьмина', N'Дина', N'Андреевна', CAST(N'1995-01-01' AS Date), 5, N'Высшая категория', N'11.png')
INSERT [dbo].[Worker] ([WorkerId], [LastName], [FirstName], [MiddleName], [Birthday], [WorkExperience], [Info], [Photo]) VALUES (2, N'Васильева', N'Екатерина', N'Дмитриевна', CAST(N'1994-05-21' AS Date), 12, N'Высшая категория', N'12.png')
INSERT [dbo].[Worker] ([WorkerId], [LastName], [FirstName], [MiddleName], [Birthday], [WorkExperience], [Info], [Photo]) VALUES (3, N'Муравьёва', N'Евгения', N'Александровна', CAST(N'1998-03-12' AS Date), 10, N'Высшая категория', N'13.jpg')
INSERT [dbo].[Worker] ([WorkerId], [LastName], [FirstName], [MiddleName], [Birthday], [WorkExperience], [Info], [Photo]) VALUES (4, N'Носова', N'Ксения', N'Эдуардовна', CAST(N'2021-06-17' AS Date), 6, N'Высшая категория', N'14.jpg')
INSERT [dbo].[Worker] ([WorkerId], [LastName], [FirstName], [MiddleName], [Birthday], [WorkExperience], [Info], [Photo]) VALUES (5, N'Февралева', N'Елена', N'Владимировна', CAST(N'2021-06-17' AS Date), 4, N'Высшая категория', N'15.jpg')
SET IDENTITY_INSERT [dbo].[Worker] OFF
SET IDENTITY_INSERT [dbo].[WorkerSpec] ON 

INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (1, 1, 2)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (2, 2, 2)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (3, 3, 2)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (4, 1, 1)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (5, 3, 1)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (6, 2, 3)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (7, 1, 4)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (8, 2, 5)
SET IDENTITY_INSERT [dbo].[WorkerSpec] OFF
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientType] FOREIGN KEY([ClientTypeId])
REFERENCES [dbo].[ClientType] ([ClientTypeId])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_ClientType]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Role]
GO
ALTER TABLE [dbo].[Complect]  WITH CHECK ADD  CONSTRAINT [FK_Complect_Good] FOREIGN KEY([MainGoodId])
REFERENCES [dbo].[Good] ([GoodId])
GO
ALTER TABLE [dbo].[Complect] CHECK CONSTRAINT [FK_Complect_Good]
GO
ALTER TABLE [dbo].[Complect]  WITH CHECK ADD  CONSTRAINT [FK_Complect_Good1] FOREIGN KEY([SecondGoodId])
REFERENCES [dbo].[Good] ([GoodId])
GO
ALTER TABLE [dbo].[Complect] CHECK CONSTRAINT [FK_Complect_Good1]
GO
ALTER TABLE [dbo].[Good]  WITH CHECK ADD  CONSTRAINT [FK_Good_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Good] CHECK CONSTRAINT [FK_Good_Category]
GO
ALTER TABLE [dbo].[Good]  WITH CHECK ADD  CONSTRAINT [FK_Good_Developer] FOREIGN KEY([DeveloperId])
REFERENCES [dbo].[Developer] ([DeveloperId])
GO
ALTER TABLE [dbo].[Good] CHECK CONSTRAINT [FK_Good_Developer]
GO
ALTER TABLE [dbo].[Sell]  WITH CHECK ADD  CONSTRAINT [FK_Sell_Client] FOREIGN KEY([UserName])
REFERENCES [dbo].[Client] ([UserName])
GO
ALTER TABLE [dbo].[Sell] CHECK CONSTRAINT [FK_Sell_Client]
GO
ALTER TABLE [dbo].[Sell]  WITH CHECK ADD  CONSTRAINT [FK_Sell_Good] FOREIGN KEY([GoodId])
REFERENCES [dbo].[Good] ([GoodId])
GO
ALTER TABLE [dbo].[Sell] CHECK CONSTRAINT [FK_Sell_Good]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_Good] FOREIGN KEY([GoodId])
REFERENCES [dbo].[Good] ([GoodId])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_Good]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([ServiceId])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Service]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Worker] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Worker] ([WorkerId])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Worker]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Client] FOREIGN KEY([UserName])
REFERENCES [dbo].[Client] ([UserName])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Client]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([ServiceId])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Service]
GO
ALTER TABLE [dbo].[WorkerSpec]  WITH CHECK ADD  CONSTRAINT [FK_WorkerSpec_Speciality] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Speciality] ([SpecialityId])
GO
ALTER TABLE [dbo].[WorkerSpec] CHECK CONSTRAINT [FK_WorkerSpec_Speciality]
GO
ALTER TABLE [dbo].[WorkerSpec]  WITH CHECK ADD  CONSTRAINT [FK_WorkerSpec_Worker] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Worker] ([WorkerId])
GO
ALTER TABLE [dbo].[WorkerSpec] CHECK CONSTRAINT [FK_WorkerSpec_Worker]
GO
USE [master]
GO
ALTER DATABASE [EnglishSchoolABC] SET  READ_WRITE 
GO
