USE [master]
GO
/****** Object:  Database [TestRez]    Script Date: 08.12.2023 15:41:47 ******/
CREATE DATABASE [TestRez]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestRez', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestRez.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestRez_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestRez_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TestRez] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestRez].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestRez] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestRez] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestRez] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestRez] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestRez] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestRez] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestRez] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestRez] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestRez] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestRez] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestRez] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestRez] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestRez] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestRez] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestRez] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestRez] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestRez] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestRez] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestRez] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestRez] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestRez] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestRez] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestRez] SET RECOVERY FULL 
GO
ALTER DATABASE [TestRez] SET  MULTI_USER 
GO
ALTER DATABASE [TestRez] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestRez] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestRez] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestRez] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestRez] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestRez] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestRez', N'ON'
GO
ALTER DATABASE [TestRez] SET QUERY_STORE = ON
GO
ALTER DATABASE [TestRez] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TestRez]
GO
/****** Object:  Table [dbo].[Должности]    Script Date: 08.12.2023 15:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должности](
	[КодДолжности] [int] NOT NULL,
	[Название] [varchar](50) NULL,
 CONSTRAINT [PK_Должности] PRIMARY KEY CLUSTERED 
(
	[КодДолжности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[КатегорииППО]    Script Date: 08.12.2023 15:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[КатегорииППО](
	[КодКатегории] [int] NOT NULL,
	[Название] [varchar](50) NULL,
 CONSTRAINT [PK_КатегорииППО] PRIMARY KEY CLUSTERED 
(
	[КодКатегории] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ППО]    Script Date: 08.12.2023 15:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ППО](
	[КодППО] [int] NOT NULL,
	[Название] [varchar](50) NULL,
	[Категория] [int] NULL,
 CONSTRAINT [PK_ППО] PRIMARY KEY CLUSTERED 
(
	[КодППО] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[РезультатыТестирования]    Script Date: 08.12.2023 15:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[РезультатыТестирования](
	[НомерТестирования] [int] NOT NULL,
	[Сотрудник] [int] NULL,
	[ППО] [int] NULL,
	[Результат] [varchar](50) NULL,
	[Дата] [date] NULL,
 CONSTRAINT [PK_РезультатыТестирования] PRIMARY KEY CLUSTERED 
(
	[НомерТестирования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 08.12.2023 15:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[КодРоли] [int] NOT NULL,
	[Название] [varchar](50) NULL,
 CONSTRAINT [PK_Роли] PRIMARY KEY CLUSTERED 
(
	[КодРоли] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 08.12.2023 15:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[КодСотрудника] [int] NOT NULL,
	[ФИО] [varchar](50) NULL,
	[Должность] [int] NULL,
	[Роль] [int] NULL,
	[Стаж] [int] NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[КодСотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Должности] ([КодДолжности], [Название]) VALUES (200, N'Начальник')
INSERT [dbo].[Должности] ([КодДолжности], [Название]) VALUES (201, N'Инженер-программист')
INSERT [dbo].[Должности] ([КодДолжности], [Название]) VALUES (202, N'Инженер-техник')
GO
INSERT [dbo].[КатегорииППО] ([КодКатегории], [Название]) VALUES (400, N'Табличный процессор')
INSERT [dbo].[КатегорииППО] ([КодКатегории], [Название]) VALUES (401, N'Текстовый процессор')
INSERT [dbo].[КатегорииППО] ([КодКатегории], [Название]) VALUES (402, N'Редактор презентаций')
GO
INSERT [dbo].[ППО] ([КодППО], [Название], [Категория]) VALUES (500, N'Учет оборудования', 400)
INSERT [dbo].[ППО] ([КодППО], [Название], [Категория]) VALUES (501, N'Учет сотрудников', 400)
INSERT [dbo].[ППО] ([КодППО], [Название], [Категория]) VALUES (502, N'Бланк заявления', 401)
INSERT [dbo].[ППО] ([КодППО], [Название], [Категория]) VALUES (503, N'Учет абитуриентов', 400)
INSERT [dbo].[ППО] ([КодППО], [Название], [Категория]) VALUES (504, N'Презентация Департамента', 402)
INSERT [dbo].[ППО] ([КодППО], [Название], [Категория]) VALUES (505, N'Презентация ВУЗа', 402)
GO
INSERT [dbo].[РезультатыТестирования] ([НомерТестирования], [Сотрудник], [ППО], [Результат], [Дата]) VALUES (1, 500, 500, N'Ошибка вывода!', CAST(N'2023-12-01' AS Date))
INSERT [dbo].[РезультатыТестирования] ([НомерТестирования], [Сотрудник], [ППО], [Результат], [Дата]) VALUES (2, 501, 503, N'Ошибка отчетности!', CAST(N'2023-12-01' AS Date))
INSERT [dbo].[РезультатыТестирования] ([НомерТестирования], [Сотрудник], [ППО], [Результат], [Дата]) VALUES (3, 501, 504, N'Ошибка вывода!', CAST(N'2023-12-02' AS Date))
INSERT [dbo].[РезультатыТестирования] ([НомерТестирования], [Сотрудник], [ППО], [Результат], [Дата]) VALUES (4, 502, 504, N'Тестирование успешно!', CAST(N'2023-12-03' AS Date))
INSERT [dbo].[РезультатыТестирования] ([НомерТестирования], [Сотрудник], [ППО], [Результат], [Дата]) VALUES (5, 502, 500, N'Ошибка отчетности!', CAST(N'2023-12-04' AS Date))
INSERT [dbo].[РезультатыТестирования] ([НомерТестирования], [Сотрудник], [ППО], [Результат], [Дата]) VALUES (6, 502, 501, N'Ошибка отчетности!', CAST(N'2023-12-04' AS Date))
INSERT [dbo].[РезультатыТестирования] ([НомерТестирования], [Сотрудник], [ППО], [Результат], [Дата]) VALUES (7, 503, 502, N'Тестирование успешно!', CAST(N'2023-12-05' AS Date))
INSERT [dbo].[РезультатыТестирования] ([НомерТестирования], [Сотрудник], [ППО], [Результат], [Дата]) VALUES (8, 504, 500, N'Тестирование успешно!', CAST(N'2023-12-05' AS Date))
INSERT [dbo].[РезультатыТестирования] ([НомерТестирования], [Сотрудник], [ППО], [Результат], [Дата]) VALUES (9, 504, 501, N'Тестирование успешно!', CAST(N'2023-12-05' AS Date))
INSERT [dbo].[РезультатыТестирования] ([НомерТестирования], [Сотрудник], [ППО], [Результат], [Дата]) VALUES (10, 504, 503, N'Тестирование успешно!', CAST(N'2023-12-05' AS Date))
GO
INSERT [dbo].[Роли] ([КодРоли], [Название]) VALUES (100, N'Администратор')
INSERT [dbo].[Роли] ([КодРоли], [Название]) VALUES (101, N'Тестировщик')
INSERT [dbo].[Роли] ([КодРоли], [Название]) VALUES (102, N'Начальник')
GO
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [Должность], [Роль], [Стаж]) VALUES (500, N'Семаков П.А.', 200, 102, 9)
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [Должность], [Роль], [Стаж]) VALUES (501, N'Павлов К.К.', 201, 100, 13)
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [Должность], [Роль], [Стаж]) VALUES (502, N'Петров И.М.', 201, 101, 6)
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [Должность], [Роль], [Стаж]) VALUES (503, N'Ульский Н.Е.', 202, 101, 11)
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [Должность], [Роль], [Стаж]) VALUES (504, N'Егоров К.А.', 202, 101, 10)
GO
ALTER TABLE [dbo].[ППО]  WITH CHECK ADD  CONSTRAINT [FK_ППО_КатегорииППО] FOREIGN KEY([Категория])
REFERENCES [dbo].[КатегорииППО] ([КодКатегории])
GO
ALTER TABLE [dbo].[ППО] CHECK CONSTRAINT [FK_ППО_КатегорииППО]
GO
ALTER TABLE [dbo].[РезультатыТестирования]  WITH CHECK ADD  CONSTRAINT [FK_РезультатыТестирования_ППО] FOREIGN KEY([ППО])
REFERENCES [dbo].[ППО] ([КодППО])
GO
ALTER TABLE [dbo].[РезультатыТестирования] CHECK CONSTRAINT [FK_РезультатыТестирования_ППО]
GO
ALTER TABLE [dbo].[РезультатыТестирования]  WITH CHECK ADD  CONSTRAINT [FK_РезультатыТестирования_Сотрудники] FOREIGN KEY([Сотрудник])
REFERENCES [dbo].[Сотрудники] ([КодСотрудника])
GO
ALTER TABLE [dbo].[РезультатыТестирования] CHECK CONSTRAINT [FK_РезультатыТестирования_Сотрудники]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Должности] FOREIGN KEY([Должность])
REFERENCES [dbo].[Должности] ([КодДолжности])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Должности]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Роли] FOREIGN KEY([Роль])
REFERENCES [dbo].[Роли] ([КодРоли])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Роли]
GO
USE [master]
GO
ALTER DATABASE [TestRez] SET  READ_WRITE 
GO
