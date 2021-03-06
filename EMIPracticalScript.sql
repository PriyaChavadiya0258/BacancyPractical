USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 03-09-2020 11:57:36 ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TestDB.mdf' , SIZE = 19456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TestDB_log.ldf' , SIZE = 19456KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDB', N'ON'
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = OFF
GO
USE [TestDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TestDB]
GO
/****** Object:  UserDefinedTableType [dbo].[GridDetailstype1]    Script Date: 03-09-2020 11:57:52 ******/
CREATE TYPE [dbo].[GridDetailstype1] AS TABLE(
	[id] [int] NULL,
	[openings] [decimal](18, 0) NULL,
	[principal] [decimal](18, 0) NULL,
	[interest] [decimal](18, 0) NULL,
	[emi] [decimal](18, 0) NULL,
	[closing] [decimal](18, 0) NULL,
	[cuminterest] [decimal](18, 0) NULL
)
GO
/****** Object:  Table [dbo].[ErrorTable]    Script Date: 03-09-2020 11:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorTable](
	[ErrorID] [bigint] IDENTITY(1,1) NOT NULL,
	[ErrorLine] [varchar](max) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorTime] [datetime] NULL,
	[ErrorNumber] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_amortationdetails]    Script Date: 03-09-2020 11:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_amortationdetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[installmentid] [int] NULL,
	[loanid] [int] NULL,
	[openings] [decimal](18, 0) NULL,
	[principal] [decimal](18, 0) NULL,
	[interest] [decimal](18, 0) NULL,
	[emi] [decimal](18, 0) NULL,
	[closing] [decimal](18, 0) NULL,
	[cuminterest] [decimal](18, 0) NULL,
	[inserteddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_loandetails]    Script Date: 03-09-2020 11:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_loandetails](
	[loanid] [int] IDENTITY(1,1) NOT NULL,
	[loanowner] [varchar](100) NULL,
	[loanamount] [decimal](18, 0) NULL,
	[interest] [decimal](18, 0) NULL,
	[noofinstallment] [int] NULL,
	[monthlyrate] [decimal](18, 0) NULL,
	[emi] [decimal](18, 0) NULL,
	[inserteddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[loanid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ErrorTable] ON 

INSERT [dbo].[ErrorTable] ([ErrorID], [ErrorLine], [ErrorMessage], [ErrorTime], [ErrorNumber]) VALUES (1, N'57', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.:GridData', CAST(N'2020-09-02T18:22:57.510' AS DateTime), 512)
SET IDENTITY_INSERT [dbo].[ErrorTable] OFF
SET IDENTITY_INSERT [dbo].[tbl_amortationdetails] ON 

INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (1, 1, 1, CAST(1950000 AS Decimal(18, 0)), CAST(100752 AS Decimal(18, 0)), CAST(16494 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(1849248 AS Decimal(18, 0)), CAST(16494 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (2, 2, 1, CAST(1849248 AS Decimal(18, 0)), CAST(101604 AS Decimal(18, 0)), CAST(15642 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(1747643 AS Decimal(18, 0)), CAST(32135 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (3, 3, 1, CAST(1747643 AS Decimal(18, 0)), CAST(102464 AS Decimal(18, 0)), CAST(14782 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(1645179 AS Decimal(18, 0)), CAST(46917 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (4, 4, 1, CAST(1645179 AS Decimal(18, 0)), CAST(103331 AS Decimal(18, 0)), CAST(13915 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(1541849 AS Decimal(18, 0)), CAST(60833 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (5, 5, 1, CAST(1541849 AS Decimal(18, 0)), CAST(104205 AS Decimal(18, 0)), CAST(13041 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(1437644 AS Decimal(18, 0)), CAST(73874 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (6, 6, 1, CAST(1437644 AS Decimal(18, 0)), CAST(105086 AS Decimal(18, 0)), CAST(12160 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(1332558 AS Decimal(18, 0)), CAST(86034 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (7, 7, 1, CAST(1332558 AS Decimal(18, 0)), CAST(105975 AS Decimal(18, 0)), CAST(11271 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(1226583 AS Decimal(18, 0)), CAST(97306 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (8, 8, 1, CAST(1226583 AS Decimal(18, 0)), CAST(106871 AS Decimal(18, 0)), CAST(10375 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(1119712 AS Decimal(18, 0)), CAST(107681 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (9, 9, 1, CAST(1119712 AS Decimal(18, 0)), CAST(107775 AS Decimal(18, 0)), CAST(9471 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(1011937 AS Decimal(18, 0)), CAST(117151 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (10, 10, 1, CAST(1011937 AS Decimal(18, 0)), CAST(108687 AS Decimal(18, 0)), CAST(8559 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(903250 AS Decimal(18, 0)), CAST(125711 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (11, 11, 1, CAST(903250 AS Decimal(18, 0)), CAST(109606 AS Decimal(18, 0)), CAST(7640 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(793644 AS Decimal(18, 0)), CAST(133351 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (12, 12, 1, CAST(793644 AS Decimal(18, 0)), CAST(110533 AS Decimal(18, 0)), CAST(6713 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(683111 AS Decimal(18, 0)), CAST(140064 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (13, 13, 1, CAST(683111 AS Decimal(18, 0)), CAST(111468 AS Decimal(18, 0)), CAST(5778 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(571643 AS Decimal(18, 0)), CAST(145842 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (14, 14, 1, CAST(571643 AS Decimal(18, 0)), CAST(112411 AS Decimal(18, 0)), CAST(4835 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(459232 AS Decimal(18, 0)), CAST(150677 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (15, 15, 1, CAST(459232 AS Decimal(18, 0)), CAST(113362 AS Decimal(18, 0)), CAST(3884 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(345871 AS Decimal(18, 0)), CAST(154561 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (16, 16, 1, CAST(345871 AS Decimal(18, 0)), CAST(114321 AS Decimal(18, 0)), CAST(2925 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(231550 AS Decimal(18, 0)), CAST(157487 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (17, 17, 1, CAST(231550 AS Decimal(18, 0)), CAST(115288 AS Decimal(18, 0)), CAST(1959 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(116263 AS Decimal(18, 0)), CAST(159445 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (18, 18, 1, CAST(116263 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(983 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(160429 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:03.140' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (20, 1, 3, CAST(1950000 AS Decimal(18, 0)), CAST(77160 AS Decimal(18, 0)), CAST(16494 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(1872840 AS Decimal(18, 0)), CAST(16494 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (21, 2, 3, CAST(1872840 AS Decimal(18, 0)), CAST(77813 AS Decimal(18, 0)), CAST(15841 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(1795028 AS Decimal(18, 0)), CAST(32335 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (22, 3, 3, CAST(1795028 AS Decimal(18, 0)), CAST(78471 AS Decimal(18, 0)), CAST(15183 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(1716557 AS Decimal(18, 0)), CAST(47518 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (23, 4, 3, CAST(1716557 AS Decimal(18, 0)), CAST(79134 AS Decimal(18, 0)), CAST(14519 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(1637422 AS Decimal(18, 0)), CAST(62037 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (24, 5, 3, CAST(1637422 AS Decimal(18, 0)), CAST(79804 AS Decimal(18, 0)), CAST(13850 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(1557619 AS Decimal(18, 0)), CAST(75887 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (25, 6, 3, CAST(1557619 AS Decimal(18, 0)), CAST(80479 AS Decimal(18, 0)), CAST(13175 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(1477140 AS Decimal(18, 0)), CAST(89062 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (26, 7, 3, CAST(1477140 AS Decimal(18, 0)), CAST(81160 AS Decimal(18, 0)), CAST(12494 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(1395980 AS Decimal(18, 0)), CAST(101556 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (27, 8, 3, CAST(1395980 AS Decimal(18, 0)), CAST(81846 AS Decimal(18, 0)), CAST(11808 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(1314134 AS Decimal(18, 0)), CAST(113364 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (28, 9, 3, CAST(1314134 AS Decimal(18, 0)), CAST(82538 AS Decimal(18, 0)), CAST(11115 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(1231596 AS Decimal(18, 0)), CAST(124479 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (29, 10, 3, CAST(1231596 AS Decimal(18, 0)), CAST(83236 AS Decimal(18, 0)), CAST(10417 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(1148360 AS Decimal(18, 0)), CAST(134896 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (30, 11, 3, CAST(1148360 AS Decimal(18, 0)), CAST(83940 AS Decimal(18, 0)), CAST(9713 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(1064419 AS Decimal(18, 0)), CAST(144609 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (31, 12, 3, CAST(1064419 AS Decimal(18, 0)), CAST(84650 AS Decimal(18, 0)), CAST(9003 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(979769 AS Decimal(18, 0)), CAST(153613 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (32, 13, 3, CAST(979769 AS Decimal(18, 0)), CAST(85366 AS Decimal(18, 0)), CAST(8287 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(894402 AS Decimal(18, 0)), CAST(161900 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (33, 14, 3, CAST(894402 AS Decimal(18, 0)), CAST(86088 AS Decimal(18, 0)), CAST(7565 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(808314 AS Decimal(18, 0)), CAST(169465 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (34, 15, 3, CAST(808314 AS Decimal(18, 0)), CAST(86817 AS Decimal(18, 0)), CAST(6837 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(721497 AS Decimal(18, 0)), CAST(176302 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (35, 16, 3, CAST(721497 AS Decimal(18, 0)), CAST(87551 AS Decimal(18, 0)), CAST(6103 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(633946 AS Decimal(18, 0)), CAST(182405 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (36, 17, 3, CAST(633946 AS Decimal(18, 0)), CAST(88292 AS Decimal(18, 0)), CAST(5362 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(545655 AS Decimal(18, 0)), CAST(187767 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (37, 18, 3, CAST(545655 AS Decimal(18, 0)), CAST(89038 AS Decimal(18, 0)), CAST(4615 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(456617 AS Decimal(18, 0)), CAST(192382 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (38, 19, 3, CAST(456617 AS Decimal(18, 0)), CAST(89791 AS Decimal(18, 0)), CAST(3862 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(366825 AS Decimal(18, 0)), CAST(196244 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (39, 20, 3, CAST(366825 AS Decimal(18, 0)), CAST(90551 AS Decimal(18, 0)), CAST(3103 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(276274 AS Decimal(18, 0)), CAST(199347 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (40, 21, 3, CAST(276274 AS Decimal(18, 0)), CAST(91317 AS Decimal(18, 0)), CAST(2337 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(184957 AS Decimal(18, 0)), CAST(201684 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (41, 22, 3, CAST(184957 AS Decimal(18, 0)), CAST(92089 AS Decimal(18, 0)), CAST(1564 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(92868 AS Decimal(18, 0)), CAST(203248 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
INSERT [dbo].[tbl_amortationdetails] ([id], [installmentid], [loanid], [openings], [principal], [interest], [emi], [closing], [cuminterest], [inserteddate]) VALUES (42, 23, 3, CAST(92868 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(786 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(204034 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.710' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_amortationdetails] OFF
SET IDENTITY_INSERT [dbo].[tbl_loandetails] ON 

INSERT [dbo].[tbl_loandetails] ([loanid], [loanowner], [loanamount], [interest], [noofinstallment], [monthlyrate], [emi], [inserteddate]) VALUES (1, N'PATEL DEV', CAST(1950000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 18, CAST(1 AS Decimal(18, 0)), CAST(117246 AS Decimal(18, 0)), CAST(N'2020-09-02T17:43:02.353' AS DateTime))
INSERT [dbo].[tbl_loandetails] ([loanid], [loanowner], [loanamount], [interest], [noofinstallment], [monthlyrate], [emi], [inserteddate]) VALUES (2, N'PATEL DEV', CAST(1950000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 20, CAST(1 AS Decimal(18, 0)), CAST(106390 AS Decimal(18, 0)), CAST(N'2020-09-02T18:22:56.863' AS DateTime))
INSERT [dbo].[tbl_loandetails] ([loanid], [loanowner], [loanamount], [interest], [noofinstallment], [monthlyrate], [emi], [inserteddate]) VALUES (3, N'PATEL DEV', CAST(1950000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 23, CAST(1 AS Decimal(18, 0)), CAST(93654 AS Decimal(18, 0)), CAST(N'2020-09-02T18:26:39.707' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_loandetails] OFF
/****** Object:  StoredProcedure [dbo].[spSaveEmiData]    Script Date: 03-09-2020 11:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Priya Chavadiya
-- Create date: 02 Sept 2020
-- Description:	Loan System
-- =============================================
CREATE PROCEDURE [dbo].[spSaveEmiData]
@dtGridData dbo.GridDetailstype1 Readonly,
@loanname  varchar(100)=null,	 
@loanAmount	decimal=null,
@intRate decimal=null	,
@numPay decimal=null	,
@monPmt decimal=null	,
@rate decimal=null	
AS
BEGIN
BEGIN TRY
Declare @Output varchar(20)='2'

	
		IF EXISTS
		(
			SELECT TOP 1 loanid
			FROM tbl_loandetails
			WHERE Lower(loanowner)=LOWER(@loanname)
				AND loanamount=@loanAmount
				AND interest=@intRate
				AND noofinstallment=@numPay
			
		)
		BEGIN
			SET @Output = '2'
			SELECT @Output as outputresult
		END
		ELSE
		BEGIN
			INSERT INTO [dbo].[tbl_loandetails](
				loanowner, 
				loanamount,
				interest,
				noofinstallment, 
				monthlyrate,
				emi,
				inserteddate)
			VALUES
			(
			@loanname
			,@loanAmount
			,@intRate
			,@numPay
			,@rate
			,@monPmt	
			,GETDATE()
			
			)
			
			INSERT INTO tbl_amortationdetails(
			installmentid,
			loanid,
			openings,
			principal,
			interest,
			emi,
			closing,
			cuminterest,
			inserteddate
			)
			SELECT
			id,
			(select Ident_current('tbl_loandetails')) as loanid,
			openings,
			principal,
			interest,
			emi,
			closing,
			cuminterest,
			GETDATE()
			from @dtGridData
			
			SET @Output = '1'
			SELECT @Output as outputresult
		END
	


	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorNumber INT;
		DECLARE @ErrorState NVARCHAR(4000);
		DECLARE @ErrorLine NVARCHAR(4000);

SELECT
	@ErrorMessage = ERROR_MESSAGE()
	,@ErrorNumber = ERROR_NUMBER()
	,@ErrorState = ERROR_STATE()
	,@ErrorLine = ERROR_LINE();

INSERT INTO ErrorTable (ErrorLine, ErrorMessage, ErrorTime, ErrorNumber)
		SELECT
			@ErrorLine
			,@ErrorMessage + ':GridData'
			,GETDATE()
			,@ErrorNumber

		SET @Output = '0'
			SELECT @Output as outputresult
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
