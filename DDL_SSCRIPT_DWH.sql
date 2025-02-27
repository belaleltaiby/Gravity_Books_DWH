USE [master]
GO
/****** Object:  Database [DWH_Gravity_books]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE DATABASE [DWH_Gravity_books]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DWH_Gravity_books', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DWH_Gravity_books.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DWH_Gravity_books_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DWH_Gravity_books_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DWH_Gravity_books] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWH_Gravity_books].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DWH_Gravity_books] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET ARITHABORT OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DWH_Gravity_books] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DWH_Gravity_books] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DWH_Gravity_books] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DWH_Gravity_books] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET RECOVERY FULL 
GO
ALTER DATABASE [DWH_Gravity_books] SET  MULTI_USER 
GO
ALTER DATABASE [DWH_Gravity_books] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DWH_Gravity_books] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DWH_Gravity_books] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DWH_Gravity_books] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DWH_Gravity_books] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DWH_Gravity_books] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DWH_Gravity_books', N'ON'
GO
ALTER DATABASE [DWH_Gravity_books] SET QUERY_STORE = ON
GO
ALTER DATABASE [DWH_Gravity_books] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DWH_Gravity_books]
GO
/****** Object:  Table [dbo].[Dim_Author]    Script Date: 1/13/2025 1:30:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Author](
	[AuthorID_PK_SK] [int] IDENTITY(1,1) NOT NULL,
	[authorID_BK] [int] NOT NULL,
	[authorName] [varchar](400) NULL,
	[SSC] [tinyint] NULL,
	[St_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[Is_current] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Book_Author]    Script Date: 1/13/2025 1:30:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Book_Author](
	[FK_BookID_pk] [int] NULL,
	[FK_AuthorID_pk] [int] NULL,
	[SSC] [tinyint] NULL,
	[St_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[Is_current] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_books]    Script Date: 1/13/2025 1:30:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_books](
	[BookID_PK_SK] [int] IDENTITY(1,1) NOT NULL,
	[BookID_BK] [int] NOT NULL,
	[title] [varchar](400) NULL,
	[Isbn] [varchar](13) NULL,
	[numPages] [int] NULL,
	[LanguageID_BK] [int] NOT NULL,
	[languageCode] [varchar](50) NULL,
	[PublisherID_BK] [int] NOT NULL,
	[St_date] [datetime] NULL,
	[End_date] [datetime] NULL,
	[IS_current] [bit] NOT NULL,
	[SSC] [tinyint] NULL,
	[publicationDate] [date] NULL,
	[PublisherName] [nvarchar](1000) NULL,
	[languageName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Customer_Address]    Script Date: 1/13/2025 1:30:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customer_Address](
	[CustomerID_PK_SK] [int] IDENTITY(1,1) NOT NULL,
	[customerID_BK] [int] NOT NULL,
	[Fname] [varchar](200) NULL,
	[Lname] [varchar](200) NULL,
	[Email] [varchar](350) NULL,
	[addressID_BK] [int] NULL,
	[streetNum] [varchar](10) NULL,
	[streetName] [varchar](200) NULL,
	[city] [varchar](100) NULL,
	[countryID_BK] [int] NULL,
	[countryName] [varchar](200) NULL,
	[statusID_BK] [int] NULL,
	[address_Status] [varchar](30) NULL,
	[St_date] [date] NULL,
	[End_date] [date] NULL,
	[SSC] [tinyint] NULL,
	[Is_current] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Orders_Address]    Script Date: 1/13/2025 1:30:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Orders_Address](
	[OrderID_PK_SK] [int] IDENTITY(1,1) NOT NULL,
	[orderID_BK] [int] NOT NULL,
	[customerID_BK] [int] NULL,
	[orderDate] [datetime] NULL,
	[shippingMethodID] [int] NULL,
	[shippingMethodName] [varchar](100) NULL,
	[shippingCost] [decimal](6, 2) NULL,
	[orderHistory_BK] [int] NULL,
	[statusDate] [datetime] NULL,
	[orderStatusID_BK] [int] NULL,
	[statusValue] [varchar](200) NULL,
	[order_street_num] [varchar](10) NULL,
	[order_street_name] [varchar](200) NULL,
	[order_city] [varchar](100) NULL,
	[St_date] [date] NULL,
	[End_date] [date] NULL,
	[Is_current] [bit] NULL,
	[dest_Address_ID] [int] NULL,
	[SSC] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 1/13/2025 1:30:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateSK] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [char](2) NOT NULL,
	[DaySuffix] [varchar](4) NOT NULL,
	[DayOfWeek] [varchar](9) NOT NULL,
	[DOWInMonth] [tinyint] NOT NULL,
	[DayOfYear] [int] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[WeekOfMonth] [tinyint] NOT NULL,
	[Month] [char](2) NOT NULL,
	[MonthName] [varchar](9) NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) NOT NULL,
	[Year] [char](4) NOT NULL,
	[StandardDate] [varchar](10) NULL,
	[HolidayText] [varchar](50) NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_Sales]    Script Date: 1/13/2025 1:30:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_Sales](
	[Fact_Sales_PK_SK] [int] IDENTITY(1,1) NOT NULL,
	[FK_DateID] [int] NULL,
	[FK_BookID] [int] NULL,
	[Price] [decimal](5, 2) NULL,
	[FK_OrderID] [int] NULL,
	[FK_CustomerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Fact_Sales_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_dim_Time_HolidayText]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_dim_Time_HolidayText] ON [dbo].[DimDate]
(
	[HolidayText] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_Date]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_DimDate_Date] ON [dbo].[DimDate]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_Day]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Day] ON [dbo].[DimDate]
(
	[Day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_DayOfWeek]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_DayOfWeek] ON [dbo].[DimDate]
(
	[DayOfWeek] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_DayOfYear]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_DayOfYear] ON [dbo].[DimDate]
(
	[DayOfYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_DOWInMonth]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_DOWInMonth] ON [dbo].[DimDate]
(
	[DOWInMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_Month]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Month] ON [dbo].[DimDate]
(
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_MonthName]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_MonthName] ON [dbo].[DimDate]
(
	[MonthName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_Quarter]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Quarter] ON [dbo].[DimDate]
(
	[Quarter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_QuarterName]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_QuarterName] ON [dbo].[DimDate]
(
	[QuarterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_WeekOfMonth]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_WeekOfMonth] ON [dbo].[DimDate]
(
	[WeekOfMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_WeekOfYear]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_WeekOfYear] ON [dbo].[DimDate]
(
	[WeekOfYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_Year]    Script Date: 1/13/2025 1:30:13 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Year] ON [dbo].[DimDate]
(
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Book_Author]  WITH CHECK ADD  CONSTRAINT [FK_AuthorID] FOREIGN KEY([FK_AuthorID_pk])
REFERENCES [dbo].[Dim_Author] ([AuthorID_PK_SK])
GO
ALTER TABLE [dbo].[Dim_Book_Author] CHECK CONSTRAINT [FK_AuthorID]
GO
ALTER TABLE [dbo].[Dim_Book_Author]  WITH CHECK ADD  CONSTRAINT [FK_BookID] FOREIGN KEY([FK_BookID_pk])
REFERENCES [dbo].[Dim_books] ([BookID_PK_SK])
GO
ALTER TABLE [dbo].[Dim_Book_Author] CHECK CONSTRAINT [FK_BookID]
GO
ALTER TABLE [dbo].[fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_BookID_] FOREIGN KEY([FK_BookID])
REFERENCES [dbo].[Dim_books] ([BookID_PK_SK])
GO
ALTER TABLE [dbo].[fact_Sales] CHECK CONSTRAINT [FK_BookID_]
GO
ALTER TABLE [dbo].[fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_CutomerID] FOREIGN KEY([FK_CustomerID])
REFERENCES [dbo].[Dim_Customer_Address] ([CustomerID_PK_SK])
GO
ALTER TABLE [dbo].[fact_Sales] CHECK CONSTRAINT [FK_CutomerID]
GO
ALTER TABLE [dbo].[fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_DateID_] FOREIGN KEY([FK_DateID])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].[fact_Sales] CHECK CONSTRAINT [FK_DateID_]
GO
ALTER TABLE [dbo].[fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_orderID] FOREIGN KEY([FK_OrderID])
REFERENCES [dbo].[Dim_Orders_Address] ([OrderID_PK_SK])
GO
ALTER TABLE [dbo].[fact_Sales] CHECK CONSTRAINT [FK_orderID]
GO
USE [master]
GO
ALTER DATABASE [DWH_Gravity_books] SET  READ_WRITE 
GO
