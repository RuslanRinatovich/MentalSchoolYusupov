USE [master]
GO
/****** Object:  Database [MentalSchoolBD]    Script Date: 27.05.2023 13:03:09 ******/
CREATE DATABASE [MentalSchoolBD]
GO

USE [MentalSchoolBD]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[Client]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[ClientType]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[Complect]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[Developer]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[Good]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[Sell]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[Speciality]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[Store]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[Visit]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[Worker]    Script Date: 27.05.2023 13:03:10 ******/
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
/****** Object:  Table [dbo].[WorkerSpec]    Script Date: 27.05.2023 13:03:10 ******/
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

INSERT [dbo].[Complect] ([ComplectId], [MainGoodId], [SecondGoodId]) VALUES (6, 101, 4)
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
INSERT [dbo].[Developer] ([DeveloperId], [DeveloperName], [WorkBeginDate]) VALUES (38, N'Издательство Питер', CAST(N'2015-08-18' AS Date))
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

INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (4, NULL, N'Вендланд Д.П. "Ментальная арифметика 3. Учим математику при помощи абакуса. Задачи на умножение"', N'1.jpg', NULL, 931, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (23, NULL, N'Невзорова А. "МоМентальная арифметика. Пособие по ментальной арифметике и логике" офсетная', N'2.jpg', NULL, 757, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (101, NULL, N'Ментальная арифметика 2', N'23.jpg', NULL, 1600, NULL, NULL, NULL, NULL, 38, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (102, NULL, N'Обучающая книга "Ментальная арифметика", от 5 лет, 44 стр.', N'124.jpg', NULL, 659, NULL, NULL, NULL, NULL, 4, 1)
INSERT [dbo].[Good] ([GoodId], [CategoryId], [GoodName], [MainPhoto], [SecondPhotos], [Price], [Weight], [Width], [Heigth], [Length], [DeveloperId], [Active]) VALUES (103, NULL, N'Ментальная арифметика Считаем быстрее калькулято', N'125.jpg', NULL, 510, NULL, NULL, NULL, NULL, 14, 1)
SET IDENTITY_INSERT [dbo].[Good] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (1, N'ADMIN')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (2, N'USER')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (11, N'Персональные занятия по Ментальной арифметике', NULL, 1140, 50, N'6.jpg', 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (101, N'Персональные занятия по Скорочтению.', N'При покупке мы БЕСПЛАТНО отправим вам электронную рабочую тетрадь.', 1050, 60, N'17.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (102, N'Персональные занятия по Основам арифметики 3+', N'При покупке мы БЕСПЛАТНО отправим вам электронную рабочую тетрадь.', 1050, 60, N'18.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (103, N'Персональные занятия по курсу «Таблица умножения»', N'Самый эффективный способ занятий! Рекомендуем заниматься 2-3 раза в неделю.', 1600, 60, N'19.jpg', 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [Discount]) VALUES (104, N'Персональные занятия по  Математике 1-4 класс', N'Самый эффективный способ занятий! При покупке мы БЕСПЛАТНО отправим вам электронную рабочую тетрадь.', 1100, 60, N'110.jpg', 10)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[Speciality] ON 

INSERT [dbo].[Speciality] ([SpecialityId], [SpecialityPay], [SpecialityName]) VALUES (1, 501, N'Основы арифметики 3+')
INSERT [dbo].[Speciality] ([SpecialityId], [SpecialityPay], [SpecialityName]) VALUES (2, 600, N'Ментальная арифметика 4+')
INSERT [dbo].[Speciality] ([SpecialityId], [SpecialityPay], [SpecialityName]) VALUES (3, 400, N'Математика 1-4 класс')
INSERT [dbo].[Speciality] ([SpecialityId], [SpecialityPay], [SpecialityName]) VALUES (4, 500, N'Чтение 4+')
INSERT [dbo].[Speciality] ([SpecialityId], [SpecialityPay], [SpecialityName]) VALUES (6, 650, N'Рисование 5+')
SET IDENTITY_INSERT [dbo].[Speciality] OFF
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (41, 4, 5)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (42, 23, 5)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (43, 101, 5)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (44, 102, 10)
INSERT [dbo].[Store] ([StoreId], [GoodId], [Count]) VALUES (45, 103, 5)
SET IDENTITY_INSERT [dbo].[Store] OFF
SET IDENTITY_INSERT [dbo].[Worker] ON 

INSERT [dbo].[Worker] ([WorkerId], [LastName], [FirstName], [MiddleName], [Birthday], [WorkExperience], [Info], [Photo]) VALUES (1, N'Кузьмина', N'Дина', N'Андреевна', CAST(N'1995-01-01' AS Date), 5, N'Высшая категория', N'11.png')
INSERT [dbo].[Worker] ([WorkerId], [LastName], [FirstName], [MiddleName], [Birthday], [WorkExperience], [Info], [Photo]) VALUES (2, N'Васильева', N'Екатерина', N'Дмитриевна', CAST(N'1994-05-21' AS Date), 12, N'Высшая категория', N'12.png')
INSERT [dbo].[Worker] ([WorkerId], [LastName], [FirstName], [MiddleName], [Birthday], [WorkExperience], [Info], [Photo]) VALUES (3, N'Муравьёва', N'Евгения', N'Александровна', CAST(N'1998-03-12' AS Date), 10, N'Высшая категория', N'13.jpg')
INSERT [dbo].[Worker] ([WorkerId], [LastName], [FirstName], [MiddleName], [Birthday], [WorkExperience], [Info], [Photo]) VALUES (4, N'Носова', N'Ксения', N'Эдуардовна', CAST(N'2021-06-17' AS Date), 6, N'Высшая категория', N'14.jpg')
INSERT [dbo].[Worker] ([WorkerId], [LastName], [FirstName], [MiddleName], [Birthday], [WorkExperience], [Info], [Photo]) VALUES (5, N'Февралева', N'Елена', N'Владимировна', CAST(N'2021-06-17' AS Date), 4, N'Высшая категория', N'15.jpg')
SET IDENTITY_INSERT [dbo].[Worker] OFF
SET IDENTITY_INSERT [dbo].[WorkerSpec] ON 

INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (9, 2, 2)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (10, 3, 2)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (11, 1, 1)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (12, 4, 1)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (13, 1, 3)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (14, 2, 3)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (15, 6, 3)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (16, 1, 4)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (17, 4, 4)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (18, 6, 4)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (19, 2, 5)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (20, 3, 5)
INSERT [dbo].[WorkerSpec] ([Id], [SpecialityId], [WorkerId]) VALUES (21, 4, 5)
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
ALTER DATABASE [MentalSchoolBD] SET  READ_WRITE 
GO
