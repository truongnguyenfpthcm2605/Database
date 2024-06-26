USE [master]
GO
/****** Object:  Database [travelbee]    Script Date: 6/11/2024 7:42:00 PM ******/
CREATE DATABASE [travelbee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'travelbee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\travelbee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'travelbee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\travelbee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [travelbee] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [travelbee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [travelbee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [travelbee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [travelbee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [travelbee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [travelbee] SET ARITHABORT OFF 
GO
ALTER DATABASE [travelbee] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [travelbee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [travelbee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [travelbee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [travelbee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [travelbee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [travelbee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [travelbee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [travelbee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [travelbee] SET  ENABLE_BROKER 
GO
ALTER DATABASE [travelbee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [travelbee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [travelbee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [travelbee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [travelbee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [travelbee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [travelbee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [travelbee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [travelbee] SET  MULTI_USER 
GO
ALTER DATABASE [travelbee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [travelbee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [travelbee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [travelbee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [travelbee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [travelbee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [travelbee] SET QUERY_STORE = ON
GO
ALTER DATABASE [travelbee] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [travelbee]
GO
/****** Object:  Table [dbo].[access]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[access](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[accessdate] [date] NULL,
	[accesscount] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[password] [nvarchar](256) NOT NULL,
	[image] [varchar](max) NULL,
	[createdate] [datetime] NULL,
	[updatedate] [datetime2](6) NULL,
	[qrcode] [nvarchar](max) NULL,
	[providerID] [varchar](30) NOT NULL,
	[birthday] [date] NULL,
	[isactive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[accountid] [bigint] NULL,
	[roleid] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[img] [nvarchar](max) NULL,
	[isactive] [bit] NULL,
	[accountId] [bigint] NULL,
	[tourid] [bigint] NULL,
	[image] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[createdate] [datetime] NULL,
	[images] [varchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[accountid] [bigint] NULL,
	[isactive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[likes]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[likes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NULL,
	[accountid] [bigint] NULL,
	[tourid] [bigint] NULL,
	[isactive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[qrcode] [nvarchar](max) NOT NULL,
	[voucher] [varchar](10) NULL,
	[status] [nvarchar](100) NOT NULL,
	[cccd] [varchar](255) NULL,
	[numberphone] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[price] [float] NOT NULL,
	[member] [int] NOT NULL,
	[createdate] [datetime] NULL,
	[accountId] [bigint] NULL,
	[plantourid] [bigint] NULL,
	[isactive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](60) NULL,
	[createdate] [datetime] NULL,
	[typepayment] [nvarchar](30) NULL,
	[money] [float] NULL,
	[stk] [varchar](30) NULL,
	[ordersid] [bigint] NULL,
	[content] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plantour]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantour](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[stardate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[createdate] [datetime] NULL,
	[updatedate] [datetime] NULL,
	[tourid] [bigint] NULL,
	[accountid] [bigint] NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reportour]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reportour](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[star] [int] NOT NULL,
	[accountid] [bigint] NULL,
	[tourid] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](256) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[price] [float] NULL,
	[views] [bigint] NULL,
	[images] [varchar](max) NULL,
	[isactive] [bit] NULL,
	[createdate] [datetime] NULL,
	[updatedate] [datetime] NULL,
	[accountId] [bigint] NULL,
	[location] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher]    Script Date: 6/11/2024 7:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[id] [varchar](10) NOT NULL,
	[title] [nvarchar](256) NOT NULL,
	[discount] [float] NULL,
	[condition] [float] NULL,
	[quanity] [int] NULL,
	[image] [varchar](max) NULL,
	[createdate] [datetime] NULL,
	[updatedate] [datetime] NULL,
	[accountid] [bigint] NULL,
	[isactive] [bit] NULL,
	[enddate] [datetime2](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[access] ON 

INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (1, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (2, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (3, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (4, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (5, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (6, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (7, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (8, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (9, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (11, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (12, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (13, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10013, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10014, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10015, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10016, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10017, CAST(N'2024-05-17' AS Date), 15)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10018, CAST(N'2024-05-17' AS Date), 11)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10019, CAST(N'2024-05-17' AS Date), 92)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10020, CAST(N'2024-05-18' AS Date), 73)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10021, CAST(N'2024-05-16' AS Date), 45)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10022, CAST(N'2024-05-15' AS Date), 78)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10023, CAST(N'2024-05-14' AS Date), 100)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10024, CAST(N'2024-05-13' AS Date), 34)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10025, CAST(N'2024-05-12' AS Date), 47)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10026, CAST(N'2024-05-11' AS Date), 57)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10027, CAST(N'2024-05-10' AS Date), 69)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10028, CAST(N'2024-05-19' AS Date), 103)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10029, CAST(N'2024-05-20' AS Date), 29)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10030, CAST(N'2024-05-21' AS Date), 21)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10031, CAST(N'2024-06-04' AS Date), 9)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (10032, CAST(N'2024-06-05' AS Date), 4)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (20031, CAST(N'2024-06-07' AS Date), 7)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (20032, CAST(N'2024-06-08' AS Date), 4)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (20033, CAST(N'2024-06-09' AS Date), 19)
INSERT [dbo].[access] ([id], [accessdate], [accesscount]) VALUES (20034, CAST(N'2024-06-11' AS Date), 3)
SET IDENTITY_INSERT [dbo].[access] OFF
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [username], [email], [fullname], [password], [image], [createdate], [updatedate], [qrcode], [providerID], [birthday], [isactive]) VALUES (1, N'tuongvy', N'vothituongvy@gmail.com', N'Võ Thị Tường Vy', N'$2a$10$/L7vg/oeT2CYm.Cf5Cu8n.sW6lR7J/DLGR.a9gw0P17F6wW0n60Wm', NULL, CAST(N'2024-05-17T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.0000000' AS DateTime2), NULL, N'local', CAST(N'2011-05-21' AS Date), 1)
INSERT [dbo].[account] ([id], [username], [email], [fullname], [password], [image], [createdate], [updatedate], [qrcode], [providerID], [birthday], [isactive]) VALUES (19, N'vothituongvy2906@gmail.com', N'vothituongvy2906@gmail.com', N'Võ Thị Tường Vy', N'$2a$10$/L7vg/oeT2CYm.Cf5Cu8n.sW6lR7J/DLGR.a9gw0P17F6wW0n60Wm', NULL, CAST(N'2024-05-20T10:08:53.267' AS DateTime), CAST(N'2024-05-20T10:08:53.2630000' AS DateTime2), NULL, N'local', CAST(N'2002-07-10' AS Date), 1)
INSERT [dbo].[account] ([id], [username], [email], [fullname], [password], [image], [createdate], [updatedate], [qrcode], [providerID], [birthday], [isactive]) VALUES (20, N'truongnguyen', N'truongnguenlqm@gmail.com', N'Nguyễn Văn Trường', N'$2a$10$4eTZfWk1q4v9VSnOzJ.vAOp3kCqs0h5b30kVH4Tryc40CkAsHh9wS', NULL, CAST(N'2024-06-09T10:44:48.773' AS DateTime), CAST(N'2024-06-09T10:44:48.7210000' AS DateTime2), NULL, N'local', CAST(N'2024-06-28' AS Date), 1)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
INSERT [dbo].[authorities] ([accountid], [roleid]) VALUES (19, 1)
INSERT [dbo].[authorities] ([accountid], [roleid]) VALUES (1, 1)
INSERT [dbo].[authorities] ([accountid], [roleid]) VALUES (19, 2)
INSERT [dbo].[authorities] ([accountid], [roleid]) VALUES (20, 2)
INSERT [dbo].[authorities] ([accountid], [roleid]) VALUES (20, 1)
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([id], [content], [createdate], [img], [isactive], [accountId], [tourid], [image]) VALUES (1, N'hjhgjhj', CAST(N'2024-05-17T00:00:00.000' AS DateTime), NULL, 1, 19, 1, N'N/a')
INSERT [dbo].[comment] ([id], [content], [createdate], [img], [isactive], [accountId], [tourid], [image]) VALUES (2, N'ăeetqwtawftg', CAST(N'2024-05-17T00:00:00.000' AS DateTime), NULL, 1, 19, 1, N'N/a')
INSERT [dbo].[comment] ([id], [content], [createdate], [img], [isactive], [accountId], [tourid], [image]) VALUES (3, N'Rất Ok', CAST(N'2024-05-17T00:00:00.000' AS DateTime), NULL, 1, 19, 8, N'N/a')
INSERT [dbo].[comment] ([id], [content], [createdate], [img], [isactive], [accountId], [tourid], [image]) VALUES (4, N'quá đẹp', CAST(N'2024-05-17T00:00:00.000' AS DateTime), NULL, 1, 19, 8, N'N/a')
INSERT [dbo].[comment] ([id], [content], [createdate], [img], [isactive], [accountId], [tourid], [image]) VALUES (5, N'ok lắm', CAST(N'2024-05-17T00:00:00.000' AS DateTime), NULL, 1, 19, 3, N'N/a')
INSERT [dbo].[comment] ([id], [content], [createdate], [img], [isactive], [accountId], [tourid], [image]) VALUES (6, N'ổn lắm', CAST(N'2024-05-17T00:00:00.000' AS DateTime), NULL, 1, 19, 3, N'N/a')
INSERT [dbo].[comment] ([id], [content], [createdate], [img], [isactive], [accountId], [tourid], [image]) VALUES (9, N'oo', CAST(N'2024-05-18T00:19:38.087' AS DateTime), NULL, 1, 19, 2, N'N/a')
INSERT [dbo].[comment] ([id], [content], [createdate], [img], [isactive], [accountId], [tourid], [image]) VALUES (10, N'dfgf', CAST(N'2024-05-18T20:06:40.060' AS DateTime), NULL, 1, 19, 1, N'N/a')
INSERT [dbo].[comment] ([id], [content], [createdate], [img], [isactive], [accountId], [tourid], [image]) VALUES (11, N'ổn', CAST(N'2024-05-20T10:41:13.673' AS DateTime), NULL, 1, 19, 1, N'N/a')
INSERT [dbo].[comment] ([id], [content], [createdate], [img], [isactive], [accountId], [tourid], [image]) VALUES (12, N'ổn', CAST(N'2024-05-20T10:41:15.407' AS DateTime), NULL, 1, 19, 1, N'N/a')
INSERT [dbo].[comment] ([id], [content], [createdate], [img], [isactive], [accountId], [tourid], [image]) VALUES (13, N'sdfsf', CAST(N'2024-06-09T10:52:22.347' AS DateTime), NULL, 1, 20, 6, N'N/a')
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
SET IDENTITY_INSERT [dbo].[feedback] ON 

INSERT [dbo].[feedback] ([id], [title], [createdate], [images], [content], [accountid], [isactive]) VALUES (31, N'Hello', CAST(N'2024-05-17T00:00:00.000' AS DateTime), NULL, N'hello', 19, 1)
INSERT [dbo].[feedback] ([id], [title], [createdate], [images], [content], [accountid], [isactive]) VALUES (32, N'New Bie', CAST(N'2024-05-18T08:11:59.383' AS DateTime), NULL, N'ahihi', 19, 1)
INSERT [dbo].[feedback] ([id], [title], [createdate], [images], [content], [accountid], [isactive]) VALUES (33, N'New Bie', CAST(N'2024-05-18T20:15:15.617' AS DateTime), NULL, N'sgdgdfgdgfd', 1, 1)
SET IDENTITY_INSERT [dbo].[feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[likes] ON 

INSERT [dbo].[likes] ([id], [createdate], [accountid], [tourid], [isactive]) VALUES (3, CAST(N'2024-05-17T00:00:00.000' AS DateTime), 1, 1, 0)
INSERT [dbo].[likes] ([id], [createdate], [accountid], [tourid], [isactive]) VALUES (4, CAST(N'2024-05-17T00:00:00.000' AS DateTime), 1, 2, 1)
INSERT [dbo].[likes] ([id], [createdate], [accountid], [tourid], [isactive]) VALUES (5, CAST(N'2024-05-17T00:00:00.000' AS DateTime), 1, 3, 1)
INSERT [dbo].[likes] ([id], [createdate], [accountid], [tourid], [isactive]) VALUES (6, CAST(N'2024-05-17T00:00:00.000' AS DateTime), 19, 3, 1)
INSERT [dbo].[likes] ([id], [createdate], [accountid], [tourid], [isactive]) VALUES (7, CAST(N'2024-05-17T00:00:00.000' AS DateTime), 19, 2, 1)
INSERT [dbo].[likes] ([id], [createdate], [accountid], [tourid], [isactive]) VALUES (8, CAST(N'2024-05-17T00:00:00.000' AS DateTime), 19, 1, 1)
INSERT [dbo].[likes] ([id], [createdate], [accountid], [tourid], [isactive]) VALUES (13, CAST(N'2024-05-18T00:19:50.970' AS DateTime), 19, 2, 1)
INSERT [dbo].[likes] ([id], [createdate], [accountid], [tourid], [isactive]) VALUES (14, CAST(N'2024-05-21T08:44:49.793' AS DateTime), 19, 6, 1)
SET IDENTITY_INSERT [dbo].[likes] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [qrcode], [voucher], [status], [cccd], [numberphone], [email], [price], [member], [createdate], [accountId], [plantourid], [isactive]) VALUES (10635, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABO0lEQVR4Xu3YwW6DMBAE0M2Jz/Cn4k/lE3r0KS4zXpxmE6mtFJbLzAEZ++U0WkCx/pd8Wdx5G7EQsRCxELEQsRCxkP+xZp7S77ZuduvVN25ieWzc9QpmtnD140AsiVUUU8te2ygLKytilzCODMsSu5BRYCV2AWPIxq/mChFLYeYpFLj4hlgee6T56+M5YmH3FNbY09GYLfv3VOlzgsSSGAbFt3y17XzFgVgW4yHLWuYKc3MMj1gKw4ywGIiCHYptGcdiGQyHtnhPPii4hLLETmWPNHxFoaLN3j64PGLP6iOMZSEoy/gS94glsnGHkUFZe/hvx4xYEqsopqIsiorGVrFrGF/nHQzTcjQmlsvw4CoNAgwHYomMIVvHCtfXshixc5h52NPszhsTy2G/RSxELEQsRCxELEQs5MPsG8HIZBLmBPk2AAAAAElFTkSuQmCC', N'Không có', N'Đã Thanh Toán', N'127295565857', N'0394822372', N'vothituongvy2909@gmail.com', 580000, 2, CAST(N'2024-05-20T10:10:28.600' AS DateTime), 19, 4, 1)
INSERT [dbo].[orders] ([id], [qrcode], [voucher], [status], [cccd], [numberphone], [email], [price], [member], [createdate], [accountId], [plantourid], [isactive]) VALUES (10636, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABO0lEQVR4Xu3YwW6DMBAE0M2Jz/Cn4k/lE3r0KS4zXpxmE6mtFJbLzAEZ++U0WkCx/pd8Wdx5G7EQsRCxELEQsRCxkP+xZp7S77ZuduvVN25ieWzc9QpmtnD140AsiVUUU8te2ygLKytilzCODMsSu5BRYCV2AWPIxq/mChFLYeYpFLj4hlgee6T56+M5YmH3FNbY09GYLfv3VOlzgsSSGAbFt3y17XzFgVgW4yHLWuYKc3MMj1gKw4ywGIiCHYptGcdiGQyHtnhPPii4hLLETmWPNHxFoaLN3j64PGLP6iOMZSEoy/gS94glsnGHkUFZe/hvx4xYEqsopqIsiorGVrFrGF/nHQzTcjQmlsvw4CoNAgwHYomMIVvHCtfXshixc5h52NPszhsTy2G/RSxELEQsRCxELEQs5MPsG8HIZBLmBPk2AAAAAElFTkSuQmCC', N'Không có', N'Đã Thanh Toán', N'848926572611', N'0394822372', N'vothituongvy2909@gmail.com', 870000, 3, CAST(N'2024-05-21T08:27:50.130' AS DateTime), 1, 4, 1)
INSERT [dbo].[orders] ([id], [qrcode], [voucher], [status], [cccd], [numberphone], [email], [price], [member], [createdate], [accountId], [plantourid], [isactive]) VALUES (10637, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABO0lEQVR4Xu3YwW6DMBAE0M2Jz/Cn4k/lE3r0KS4zXpxmE6mtFJbLzAEZ++U0WkCx/pd8Wdx5G7EQsRCxELEQsRCxkP+xZp7S77ZuduvVN25ieWzc9QpmtnD140AsiVUUU8te2ygLKytilzCODMsSu5BRYCV2AWPIxq/mChFLYeYpFLj4hlgee6T56+M5YmH3FNbY09GYLfv3VOlzgsSSGAbFt3y17XzFgVgW4yHLWuYKc3MMj1gKw4ywGIiCHYptGcdiGQyHtnhPPii4hLLETmWPNHxFoaLN3j64PGLP6iOMZSEoy/gS94glsnGHkUFZe/hvx4xYEqsopqIsiorGVrFrGF/nHQzTcjQmlsvw4CoNAgwHYomMIVvHCtfXshixc5h52NPszhsTy2G/RSxELEQsRCxELEQs5MPsG8HIZBLmBPk2AAAAAElFTkSuQmCC', N'Không có', N'Đã Thanh Toán', N'567890345678', N'0394822372', N'vothituongvy2909@gmail.com', 1160000, 4, CAST(N'2024-05-21T08:35:55.193' AS DateTime), 1, 4, 1)
INSERT [dbo].[orders] ([id], [qrcode], [voucher], [status], [cccd], [numberphone], [email], [price], [member], [createdate], [accountId], [plantourid], [isactive]) VALUES (10638, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABO0lEQVR4Xu3YwW6DMBAE0M2Jz/Cn4k/lE3r0KS4zXpxmE6mtFJbLzAEZ++U0WkCx/pd8Wdx5G7EQsRCxELEQsRCxkP+xZp7S77ZuduvVN25ieWzc9QpmtnD140AsiVUUU8te2ygLKytilzCODMsSu5BRYCV2AWPIxq/mChFLYeYpFLj4hlgee6T56+M5YmH3FNbY09GYLfv3VOlzgsSSGAbFt3y17XzFgVgW4yHLWuYKc3MMj1gKw4ywGIiCHYptGcdiGQyHtnhPPii4hLLETmWPNHxFoaLN3j64PGLP6iOMZSEoy/gS94glsnGHkUFZe/hvx4xYEqsopqIsiorGVrFrGF/nHQzTcjQmlsvw4CoNAgwHYomMIVvHCtfXshixc5h52NPszhsTy2G/RSxELEQsRCxELEQs5MPsG8HIZBLmBPk2AAAAAElFTkSuQmCC', N'Không có', N'Chờ thanh toán', N'647529104568', N'0394822372', N'vothituongvy2906@gmail.com', 507000000, 3, CAST(N'2024-05-21T08:39:04.817' AS DateTime), 1, 16, 1)
INSERT [dbo].[orders] ([id], [qrcode], [voucher], [status], [cccd], [numberphone], [email], [price], [member], [createdate], [accountId], [plantourid], [isactive]) VALUES (10639, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABO0lEQVR4Xu3YwW6DMBAE0M2Jz/Cn4k/lE3r0KS4zXpxmE6mtFJbLzAEZ++U0WkCx/pd8Wdx5G7EQsRCxELEQsRCxkP+xZp7S77ZuduvVN25ieWzc9QpmtnD140AsiVUUU8te2ygLKytilzCODMsSu5BRYCV2AWPIxq/mChFLYeYpFLj4hlgee6T56+M5YmH3FNbY09GYLfv3VOlzgsSSGAbFt3y17XzFgVgW4yHLWuYKc3MMj1gKw4ywGIiCHYptGcdiGQyHtnhPPii4hLLETmWPNHxFoaLN3j64PGLP6iOMZSEoy/gS94glsnGHkUFZe/hvx4xYEqsopqIsiorGVrFrGF/nHQzTcjQmlsvw4CoNAgwHYomMIVvHCtfXshixc5h52NPszhsTy2G/RSxELEQsRCxELEQs5MPsG8HIZBLmBPk2AAAAAElFTkSuQmCC', N'Không có', N'Chờ thanh toán', N'356178489314', N'0394822372', N'vothituongvy2906@gmail.com', 580000, 2, CAST(N'2024-05-21T08:43:28.507' AS DateTime), 19, 4, 1)
INSERT [dbo].[orders] ([id], [qrcode], [voucher], [status], [cccd], [numberphone], [email], [price], [member], [createdate], [accountId], [plantourid], [isactive]) VALUES (10640, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABO0lEQVR4Xu3YwW6DMBAE0M2Jz/Cn4k/lE3r0KS4zXpxmE6mtFJbLzAEZ++U0WkCx/pd8Wdx5G7EQsRCxELEQsRCxkP+xZp7S77ZuduvVN25ieWzc9QpmtnD140AsiVUUU8te2ygLKytilzCODMsSu5BRYCV2AWPIxq/mChFLYeYpFLj4hlgee6T56+M5YmH3FNbY09GYLfv3VOlzgsSSGAbFt3y17XzFgVgW4yHLWuYKc3MMj1gKw4ywGIiCHYptGcdiGQyHtnhPPii4hLLETmWPNHxFoaLN3j64PGLP6iOMZSEoy/gS94glsnGHkUFZe/hvx4xYEqsopqIsiorGVrFrGF/nHQzTcjQmlsvw4CoNAgwHYomMIVvHCtfXshixc5h52NPszhsTy2G/RSxELEQsRCxELEQs5MPsG8HIZBLmBPk2AAAAAElFTkSuQmCC', N'Không có', N'Đã Thanh Toán', N'142567182734', N'0394822372', N'vothituongvy2906@gmail.com', 3790000, 1, CAST(N'2024-05-21T10:20:18.957' AS DateTime), 19, 13, 1)
INSERT [dbo].[orders] ([id], [qrcode], [voucher], [status], [cccd], [numberphone], [email], [price], [member], [createdate], [accountId], [plantourid], [isactive]) VALUES (10641, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABO0lEQVR4Xu3YwW6DMBAE0M2Jz/Cn4k/lE3r0KS4zXpxmE6mtFJbLzAEZ++U0WkCx/pd8Wdx5G7EQsRCxELEQsRCxkP+xZp7S77ZuduvVN25ieWzc9QpmtnD140AsiVUUU8te2ygLKytilzCODMsSu5BRYCV2AWPIxq/mChFLYeYpFLj4hlgee6T56+M5YmH3FNbY09GYLfv3VOlzgsSSGAbFt3y17XzFgVgW4yHLWuYKc3MMj1gKw4ywGIiCHYptGcdiGQyHtnhPPii4hLLETmWPNHxFoaLN3j64PGLP6iOMZSEoy/gS94glsnGHkUFZe/hvx4xYEqsopqIsiorGVrFrGF/nHQzTcjQmlsvw4CoNAgwHYomMIVvHCtfXshixc5h52NPszhsTy2G/RSxELEQsRCxELEQs5MPsG8HIZBLmBPk2AAAAAElFTkSuQmCC', N'Không có', N'Chờ thanh toán', N'456467358372', N'0394822372', N'vothituongvy2906@gmail.com', 1740000, 6, CAST(N'2024-06-07T15:53:55.867' AS DateTime), 19, 4, 1)
INSERT [dbo].[orders] ([id], [qrcode], [voucher], [status], [cccd], [numberphone], [email], [price], [member], [createdate], [accountId], [plantourid], [isactive]) VALUES (10642, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABO0lEQVR4Xu3YwW6DMBAE0M2Jz/Cn4k/lE3r0KS4zXpxmE6mtFJbLzAEZ++U0WkCx/pd8Wdx5G7EQsRCxELEQsRCxkP+xZp7S77ZuduvVN25ieWzc9QpmtnD140AsiVUUU8te2ygLKytilzCODMsSu5BRYCV2AWPIxq/mChFLYeYpFLj4hlgee6T56+M5YmH3FNbY09GYLfv3VOlzgsSSGAbFt3y17XzFgVgW4yHLWuYKc3MMj1gKw4ywGIiCHYptGcdiGQyHtnhPPii4hLLETmWPNHxFoaLN3j64PGLP6iOMZSEoy/gS94glsnGHkUFZe/hvx4xYEqsopqIsiorGVrFrGF/nHQzTcjQmlsvw4CoNAgwHYomMIVvHCtfXshixc5h52NPszhsTy2G/RSxELEQsRCxELEQs5MPsG8HIZBLmBPk2AAAAAElFTkSuQmCC', N'ADMIN123', N'Chờ thanh toán', N'123456789093', N'0377379249', N'truongnguenlqm@gmail.com', 701100, 19, CAST(N'2024-06-09T10:59:07.630' AS DateTime), 20, 23, 0)
INSERT [dbo].[orders] ([id], [qrcode], [voucher], [status], [cccd], [numberphone], [email], [price], [member], [createdate], [accountId], [plantourid], [isactive]) VALUES (10643, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABO0lEQVR4Xu3YwW6DMBAE0M2Jz/Cn4k/lE3r0KS4zXpxmE6mtFJbLzAEZ++U0WkCx/pd8Wdx5G7EQsRCxELEQsRCxkP+xZp7S77ZuduvVN25ieWzc9QpmtnD140AsiVUUU8te2ygLKytilzCODMsSu5BRYCV2AWPIxq/mChFLYeYpFLj4hlgee6T56+M5YmH3FNbY09GYLfv3VOlzgsSSGAbFt3y17XzFgVgW4yHLWuYKc3MMj1gKw4ywGIiCHYptGcdiGQyHtnhPPii4hLLETmWPNHxFoaLN3j64PGLP6iOMZSEoy/gS94glsnGHkUFZe/hvx4xYEqsopqIsiorGVrFrGF/nHQzTcjQmlsvw4CoNAgwHYomMIVvHCtfXshixc5h52NPszhsTy2G/RSxELEQsRCxELEQs5MPsG8HIZBLmBPk2AAAAAElFTkSuQmCC', N'Không có', N'Chờ thanh toán', N'123456789093', N'0377379249', N'truongnguenlqm@gmail.com', 28900000, 10, CAST(N'2024-06-11T19:29:25.737' AS DateTime), 20, 5, 1)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[payment] ON 

INSERT [dbo].[payment] ([id], [name], [createdate], [typepayment], [money], [stk], [ordersid], [content]) VALUES (10531, N'Võ Thị Tường Vy', CAST(N'2024-05-20T10:10:32.547' AS DateTime), N'ACB', 580000, N'N/A', 10635, N'Thanh Toan ACB')
INSERT [dbo].[payment] ([id], [name], [createdate], [typepayment], [money], [stk], [ordersid], [content]) VALUES (10532, N'Võ Thị Tường Vy', CAST(N'2024-05-21T08:27:54.480' AS DateTime), N'ACB', 870000, N'N/A', 10636, N'Thanh Toan ACB')
INSERT [dbo].[payment] ([id], [name], [createdate], [typepayment], [money], [stk], [ordersid], [content]) VALUES (10533, N'Võ Thị Tường Vy', CAST(N'2024-05-21T08:35:58.303' AS DateTime), N'ACB', 1160000, N'N/A', 10637, N'Thanh Toan ACB')
INSERT [dbo].[payment] ([id], [name], [createdate], [typepayment], [money], [stk], [ordersid], [content]) VALUES (10534, N'Võ Thị Tường Vy', CAST(N'2024-05-21T08:39:07.547' AS DateTime), N'ACB', 507000000, N'N/A', 10638, N'Thanh Toan ACB')
INSERT [dbo].[payment] ([id], [name], [createdate], [typepayment], [money], [stk], [ordersid], [content]) VALUES (10535, N'Võ Thị Tường Vy', CAST(N'2024-05-21T08:43:31.517' AS DateTime), N'ACB', 580000, N'N/A', 10639, N'Thanh Toan ACB')
INSERT [dbo].[payment] ([id], [name], [createdate], [typepayment], [money], [stk], [ordersid], [content]) VALUES (10536, N'Võ Thị Tường Vy', CAST(N'2024-05-21T10:20:23.487' AS DateTime), N'ACB', 3790000, N'N/A', 10640, N'Thanh Toan ACB')
INSERT [dbo].[payment] ([id], [name], [createdate], [typepayment], [money], [stk], [ordersid], [content]) VALUES (10537, N'Võ Thị Tường Vy', CAST(N'2024-06-07T15:53:59.627' AS DateTime), N'Banking Online', 1740000, N'N/A', 10641, N'Thanh Toan Banking Online')
INSERT [dbo].[payment] ([id], [name], [createdate], [typepayment], [money], [stk], [ordersid], [content]) VALUES (10538, N'Nguyễn Văn Trường', CAST(N'2024-06-09T10:59:11.420' AS DateTime), N'Banking Online', 701100, N'N/A', 10642, N'Thanh Toan Banking Online')
INSERT [dbo].[payment] ([id], [name], [createdate], [typepayment], [money], [stk], [ordersid], [content]) VALUES (10539, N'Nguyễn Văn Trường', CAST(N'2024-06-11T19:29:30.470' AS DateTime), N'Banking Online', 28900000, N'N/A', 10643, N'Thanh Toan Banking Online')
SET IDENTITY_INSERT [dbo].[payment] OFF
GO
SET IDENTITY_INSERT [dbo].[plantour] ON 

INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (4, CAST(N'2024-07-20T00:00:00.000' AS DateTime), CAST(N'2024-07-24T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), 1, 1, N'Du lịch khắp chốn, điều gì là quan trọng nhất với những đôi chân cuồng đi? Đó hẳn phải là săn được một combo vé máy bay và khách sạn giá tốt rồi.

Chẳng cần băn khoăn đặt riêng từng dịch vụ, combo du lịch Thành phố Hồ Chí Minh của Traveloka chắc chắn sẽ giúp mọi chuyến đi đơn giản hơn bao giờ hết rồi. Du khách có thể thoải mái lựa chọn giờ bay, hãng bay, khách sạn ưng ý tùy theo sở thích và lịch trình mong muốn mà chẳng cần ngại gò bó như nhiều tour du lịch Sài Gòn khác.

Quan trọng nhất, combo du lịch giá rẻ của Traveloka còn mang đến mức ưu đãi lên đến 15% so với khi đặt riêng. Vi vu Sài Gòn giờ đây vừa tiết kiệm, tiện lợi, lại thỏa sức vui chơi!

')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (5, CAST(N'2024-07-15T00:00:00.000' AS DateTime), CAST(N'2024-07-25T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), 2, 1, N' 
Du lịch Hà Nội - Kinh đô Thăng Long một thời, là vùng đất được nhiều Triều đại phong kiến chọn làm kinh đô, lập ấp đắp đê trị vì đất nước. Hà Nội ngày nay nổi tiếng với 36 phố phường cùng nhiều danh lam thắng cảnh và nhiều di tích lịch sử lâu đời trở thành điểm đến của nhiều tour du lịch trong nước được du khách lựa chọn. Đến với tour du lịch Hà Nội, du khách được tìm hiểu quá trình hình thành ngàn năm Văn Hiến, được du ngoạn quanh 36 phố phường Hà Nội cổ kính. Hứa hẹn đây sẽ là một chuyến du lịch thú vị cho quý khách trong kỳ nghỉ của mình. Để tìm được cho mình một tour Hà Nội phù hợp nhất, du khách vui lòng đăng ký tour trực tuyến tại Website của Du Lịch Việt để chọn được tour với giá tốt nhất nhé!')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (6, CAST(N'2024-06-28T00:00:00.000' AS DateTime), CAST(N'2024-07-05T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), 2, 1, N' 
Du lịch Hà Nội - Kinh đô Thăng Long một thời, là vùng đất được nhiều Triều đại phong kiến chọn làm kinh đô, lập ấp đắp đê trị vì đất nước. Hà Nội ngày nay nổi tiếng với 36 phố phường cùng nhiều danh lam thắng cảnh và nhiều di tích lịch sử lâu đời trở thành điểm đến của nhiều tour du lịch trong nước được du khách lựa chọn. Đến với tour du lịch Hà Nội, du khách được tìm hiểu quá trình hình thành ngàn năm Văn Hiến, được du ngoạn quanh 36 phố phường Hà Nội cổ kính. Hứa hẹn đây sẽ là một chuyến du lịch thú vị cho quý khách trong kỳ nghỉ của mình. Để tìm được cho mình một tour Hà Nội phù hợp nhất, du khách vui lòng đăng ký tour trực tuyến tại Website của Du Lịch Việt để chọn được tour với giá tốt nhất nhé!')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (12, CAST(N'2024-06-25T00:00:00.000' AS DateTime), CAST(N'2024-07-05T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), 2, 1, N'Du lịch khắp chốn, điều gì là quan trọng nhất với những đôi chân cuồng đi? Đó hẳn phải là săn được một combo vé máy bay và khách sạn giá tốt rồi.    Chẳng cần băn khoăn đặt riêng từng dịch vụ, combo du lịch Thành phố Hồ Chí Minh của Traveloka chắc chắn sẽ giúp mọi chuyến đi đơn giản hơn bao giờ hết rồi. Du khách có thể thoải mái lựa chọn giờ bay, hãng bay, khách sạn ưng ý tùy theo sở thích và lịch trình mong muốn mà chẳng cần ngại gò bó như nhiều tour du lịch Sài Gòn khác.    Quan trọng nhất, combo du lịch giá rẻ của Traveloka còn mang đến mức ưu đãi lên đến 15% so với khi đặt riêng. Vi vu Sài Gòn giờ đây vừa tiết kiệm, tiện lợi, lại thỏa sức vui chơi!    ')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (13, CAST(N'2024-07-26T00:00:00.000' AS DateTime), CAST(N'2024-08-02T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), 3, 1, N'Với nhiều cảnh đẹp tự nhiên và văn hóa, con người, đặc sản độc đáo, Đà Lạt không chỉ là 1 điểm đến du lịch hấp dẫn mà còn là một nơi để bạn thả mình, thư giãn và tìm lại sự cân bằng trong cuộc sống. Hãy gạt bỏ những áp lực hàng ngày và đặt chân đến Đà Lạt và tận hưởng những trải nghiệm tuyệt')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (14, CAST(N'2024-08-02T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), 3, 1, N'Với nhiều cảnh đẹp tự nhiên và văn hóa, con người, đặc sản độc đáo, Đà Lạt không chỉ là 1 điểm đến du lịch hấp dẫn mà còn là một nơi để bạn thả mình, thư giãn và tìm lại sự cân bằng trong cuộc sống. Hãy gạt bỏ những áp lực hàng ngày và đặt chân đến Đà Lạt và tận hưởng những trải nghiệm tuyệt')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (15, CAST(N'2024-08-05T00:00:00.000' AS DateTime), CAST(N'2024-08-15T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), 3, 1, N'Với nhiều cảnh đẹp tự nhiên và văn hóa, con người, đặc sản độc đáo, Đà Lạt không chỉ là 1 điểm đến du lịch hấp dẫn mà còn là một nơi để bạn thả mình, thư giãn và tìm lại sự cân bằng trong cuộc sống. Hãy gạt bỏ những áp lực hàng ngày và đặt chân đến Đà Lạt và tận hưởng những trải nghiệm tuyệt')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (16, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-20T00:00:00.000' AS DateTime), CAST(N'2024-05-19T23:23:49.150' AS DateTime), CAST(N'2024-05-19T23:23:49.150' AS DateTime), 4, 1, N'Với nhiều cảnh đẹp tự nhiên và văn hóa, con người, đặc sản độc đáo, Đà Lạt không chỉ là 1 điểm đến du lịch hấp dẫn mà còn là một nơi để bạn thả mình, thư giãn và tìm lại sự cân bằng trong cuộc sống. Hãy gạt bỏ những áp lực hàng ngày và đặt chân đến Đà Lạt và tận hưởng những trải nghiệm tuyệt')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (17, CAST(N'2024-08-12T00:00:00.000' AS DateTime), CAST(N'2024-08-20T00:00:00.000' AS DateTime), CAST(N'2024-05-19T23:25:22.257' AS DateTime), CAST(N'2024-05-19T23:23:49.150' AS DateTime), 4, 1, N'Với nhiều cảnh đẹp tự nhiên và văn hóa, con người, đặc sản độc đáo, Đà Lạt không chỉ là 1 điểm đến du lịch hấp dẫn mà còn là một nơi để bạn thả mình, thư giãn và tìm lại sự cân bằng trong cuộc sống. Hãy gạt bỏ những áp lực hàng ngày và đặt chân đến Đà Lạt và tận hưởng những trải nghiệm tuyệt')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (18, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-18T00:00:00.000' AS DateTime), CAST(N'2024-05-19T23:28:48.643' AS DateTime), CAST(N'2024-05-19T23:23:49.150' AS DateTime), 4, 1, N' 
Du lịch Hà Nội - Kinh đô Thăng Long một thời, là vùng đất được nhiều Triều đại phong kiến chọn làm kinh đô, lập ấp đắp đê trị vì đất nước. Hà Nội ngày nay nổi tiếng với 36 phố phường cùng nhiều danh lam thắng cảnh và nhiều di tích lịch sử lâu đời trở thành điểm đến của nhiều tour du lịch trong nước được du khách lựa chọn. Đến với tour du lịch Hà Nội, du khách được tìm hiểu quá trình hình thành ngàn năm Văn Hiến, được du ngoạn quanh 36 phố phường Hà Nội cổ kính. Hứa hẹn đây sẽ là một chuyến du lịch thú vị cho quý khách trong kỳ nghỉ của mình. Để tìm được cho mình một tour Hà Nội phù hợp nhất, du khách vui lòng đăng ký tour trực tuyến tại Website của Du Lịch Việt để chọn được tour với giá tốt nhất nhé!')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (19, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-20T00:00:00.000' AS DateTime), CAST(N'2024-05-19T23:30:39.443' AS DateTime), CAST(N'2024-05-19T23:30:39.443' AS DateTime), 5, 1, N' 
Du lịch Hà Nội - Kinh đô Thăng Long một thời, là vùng đất được nhiều Triều đại phong kiến chọn làm kinh đô, lập ấp đắp đê trị vì đất nước. Hà Nội ngày nay nổi tiếng với 36 phố phường cùng nhiều danh lam thắng cảnh và nhiều di tích lịch sử lâu đời trở thành điểm đến của nhiều tour du lịch trong nước được du khách lựa chọn. Đến với tour du lịch Hà Nội, du khách được tìm hiểu quá trình hình thành ngàn năm Văn Hiến, được du ngoạn quanh 36 phố phường Hà Nội cổ kính. Hứa hẹn đây sẽ là một chuyến du lịch thú vị cho quý khách trong kỳ nghỉ của mình. Để tìm được cho mình một tour Hà Nội phù hợp nhất, du khách vui lòng đăng ký tour trực tuyến tại Website của Du Lịch Việt để chọn được tour với giá tốt nhất nhé!')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (20, CAST(N'2024-10-20T00:00:00.000' AS DateTime), CAST(N'2024-11-15T00:00:00.000' AS DateTime), CAST(N'2024-05-19T23:31:06.067' AS DateTime), CAST(N'2024-05-19T23:31:06.067' AS DateTime), 5, 1, N' 
Du lịch Hà Nội - Kinh đô Thăng Long một thời, là vùng đất được nhiều Triều đại phong kiến chọn làm kinh đô, lập ấp đắp đê trị vì đất nước. Hà Nội ngày nay nổi tiếng với 36 phố phường cùng nhiều danh lam thắng cảnh và nhiều di tích lịch sử lâu đời trở thành điểm đến của nhiều tour du lịch trong nước được du khách lựa chọn. Đến với tour du lịch Hà Nội, du khách được tìm hiểu quá trình hình thành ngàn năm Văn Hiến, được du ngoạn quanh 36 phố phường Hà Nội cổ kính. Hứa hẹn đây sẽ là một chuyến du lịch thú vị cho quý khách trong kỳ nghỉ của mình. Để tìm được cho mình một tour Hà Nội phù hợp nhất, du khách vui lòng đăng ký tour trực tuyến tại Website của Du Lịch Việt để chọn được tour với giá tốt nhất nhé!')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (21, CAST(N'2024-09-10T00:00:00.000' AS DateTime), CAST(N'2024-11-05T00:00:00.000' AS DateTime), CAST(N'2024-05-19T23:31:30.297' AS DateTime), CAST(N'2024-05-19T23:31:30.297' AS DateTime), 5, 1, N' 
Du lịch Hà Nội - Kinh đô Thăng Long một thời, là vùng đất được nhiều Triều đại phong kiến chọn làm kinh đô, lập ấp đắp đê trị vì đất nước. Hà Nội ngày nay nổi tiếng với 36 phố phường cùng nhiều danh lam thắng cảnh và nhiều di tích lịch sử lâu đời trở thành điểm đến của nhiều tour du lịch trong nước được du khách lựa chọn. Đến với tour du lịch Hà Nội, du khách được tìm hiểu quá trình hình thành ngàn năm Văn Hiến, được du ngoạn quanh 36 phố phường Hà Nội cổ kính. Hứa hẹn đây sẽ là một chuyến du lịch thú vị cho quý khách trong kỳ nghỉ của mình. Để tìm được cho mình một tour Hà Nội phù hợp nhất, du khách vui lòng đăng ký tour trực tuyến tại Website của Du Lịch Việt để chọn được tour với giá tốt nhất nhé!')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (22, CAST(N'2024-12-15T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), CAST(N'2024-05-19T23:32:05.750' AS DateTime), CAST(N'2024-05-19T23:32:05.750' AS DateTime), 6, 1, N'Với nhiều cảnh đẹp tự nhiên và văn hóa, con người, đặc sản độc đáo, Đà Lạt không chỉ là 1 điểm đến du lịch hấp dẫn mà còn là một nơi để bạn thả mình, thư giãn và tìm lại sự cân bằng trong cuộc sống. Hãy gạt bỏ những áp lực hàng ngày và đặt chân đến Đà Lạt và tận hưởng những trải nghiệm tuyệt')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (23, CAST(N'2024-10-20T00:00:00.000' AS DateTime), CAST(N'2024-11-15T00:00:00.000' AS DateTime), CAST(N'2024-05-19T23:32:42.613' AS DateTime), CAST(N'2024-05-19T23:32:42.613' AS DateTime), 6, 1, N'Với nhiều cảnh đẹp tự nhiên và văn hóa, con người, đặc sản độc đáo, Đà Lạt không chỉ là 1 điểm đến du lịch hấp dẫn mà còn là một nơi để bạn thả mình, thư giãn và tìm lại sự cân bằng trong cuộc sống. Hãy gạt bỏ những áp lực hàng ngày và đặt chân đến Đà Lạt và tận hưởng những trải nghiệm tuyệt')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (24, CAST(N'2024-09-10T00:00:00.000' AS DateTime), CAST(N'2024-11-15T00:00:00.000' AS DateTime), CAST(N'2024-05-19T23:33:11.767' AS DateTime), CAST(N'2024-05-19T23:33:11.767' AS DateTime), 6, 1, N'Với nhiều cảnh đẹp tự nhiên và văn hóa, con người, đặc sản độc đáo, Đà Lạt không chỉ là 1 điểm đến du lịch hấp dẫn mà còn là một nơi để bạn thả mình, thư giãn và tìm lại sự cân bằng trong cuộc sống. Hãy gạt bỏ những áp lực hàng ngày và đặt chân đến Đà Lạt và tận hưởng những trải nghiệm tuyệt')
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (25, CAST(N'2024-02-07T00:00:00.000' AS DateTime), CAST(N'2024-07-07T00:00:00.000' AS DateTime), CAST(N'2024-06-05T11:44:16.533' AS DateTime), CAST(N'2024-06-05T11:44:16.533' AS DateTime), 23, 19, NULL)
INSERT [dbo].[plantour] ([id], [stardate], [enddate], [createdate], [updatedate], [tourid], [accountid], [description]) VALUES (10025, CAST(N'2024-05-08T00:00:00.000' AS DateTime), CAST(N'2024-10-08T00:00:00.000' AS DateTime), CAST(N'2024-06-07T20:52:06.473' AS DateTime), CAST(N'2024-06-07T20:52:06.473' AS DateTime), 24, 19, NULL)
SET IDENTITY_INSERT [dbo].[plantour] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [name]) VALUES (1, N'ADMIN')
INSERT [dbo].[role] ([id], [name]) VALUES (3, N'STAFF')
INSERT [dbo].[role] ([id], [name]) VALUES (2, N'USER')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[tour] ON 

INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (1, N'Tour Mùa Xuân', N'Cách trung tâm thành phố Hồ Chí Minh chỉ khoảng 3 tiếng lái xe, với đường bờ biển trải dài 20km, Vũng Tàu là một trong những điểm đến yêu thích của du khách phía Nam. Nằm nhô hẳn ra khỏi đất liền như một dải đất, từ nơi đây, người ta có thể nhìn biển Đông cả khi trời mọc lẫn lúc hoàng hôn. Bên cạnh những giá trị cảnh quan thiên nhiên, Vũng Tàu còn là miền đất có truyền thống văn hóa lịch sử lâu đời.', 290000, 16855, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img1.jpg?alt=media&token=5b5e1b0c-6c13-4683-ae7f-ad93742c969e, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img2.jpg?alt=media&token=c7c6be01-720d-4c13-a683-da03877766d2, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img3.jpg?alt=media&token=b2da8e86-15e2-4ed7-bdd9-29f8b13ddd8b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm1.jpg?alt=media&token=4f3c6808-4935-4d08-888e-376c52bd889b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm2.jpg?alt=media&token=d2b23120-31f7-4ed0-acd6-19ca1c542e60, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-06-05T11:49:12.297' AS DateTime), 1, N'TP HCM')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (2, N'Tour Hướng Nội', N'Du lịch Hà Nội có đa dạng hình thức, điểm đến và hoạt động như: du lịch tâm linh - lịch sử; du lịch nghỉ dưỡng; du lịch hội thảo, MICE; du lịch văn hóa, lễ hội, từ đó mang đến nhiều trải nghiệm thú vị cho du khách. Đến Thủ đô, bạn sẽ được khám phá nhiều địa danh nổi tiếng như: Lăng Chủ tịch Hồ Chí Minh, Văn Miếu - Quốc Tử Giám cùng với đó là trải nghiệm nhiều lễ hội văn hóa đặc sắc như: hội chùa Hương, hội Chèm... Với lịch sử “nghìn năm văn hiến”, Thủ đô luôn thu hút khách du lịch trong và ngoài nước với màu sắc đặc trưng, với nét văn hóa đậm đà bản sắc cùng một lối sống riêng không thể lẫn với bất kỳ nơi nào khác.', 2890000, 12734, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm1.jpg?alt=media&token=4f3c6808-4935-4d08-888e-376c52bd889b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm2.jpg?alt=media&token=d2b23120-31f7-4ed0-acd6-19ca1c542e60, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN1.jpg?alt=media&token=23724a88-bafd-4b93-bee4-1b9cd2c16b07, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN2.jpg?alt=media&token=2d02687c-bab6-4cc6-bf0a-3934c077c7b9, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN3.jpg?alt=media&token=d1a19d1b-7c2f-4dc2-9eea-406e3cb9012a', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Hà Nội')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (3, N'Tour Vip', N'Du lịch Đà Lạt từ lâu đã trở thành điểm đến không thể bỏ qua của du khách trong và ngoài nước. Giới thiệu về Đà Lạt sẽ giúp bạn hiểu về lịch sử quá trình hình thành nên một Đà Lạt đẹp như hiện nay. Bên cạnh đó, du khách sẽ biết các địa điểm vui chơi, giải trí và ăn uống khi đến thành phố ngàn hoa. Thành phố Đà Lạt nằm trên cao nguyên Lâm Viên được coi là địa điểm du lịch hấp dẫn tại Việt Nam. Diện tích Đà Lạt rộng khoảng 400 km2 và nơi đây là thành phố loại 1 trực thuộc tỉnh ủy Lâm Đồng.', 3790000, 11402, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm1.jpg?alt=media&token=4f3c6808-4935-4d08-888e-376c52bd889b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm2.jpg?alt=media&token=d2b23120-31f7-4ed0-acd6-19ca1c542e60, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDL1.jpg?alt=media&token=51f2d970-f1e5-4862-b538-100aa62475a2, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDL2.jpg?alt=media&token=39105243-a41f-40e4-9070-99006a7415fc, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDL3.jpg?alt=media&token=969af4dc-c2ba-44b5-9522-551b6ba6a243', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Đà Lạt')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (4, N'Tour Nghỉ Dưỡng', N'Hà Giang mang đến nhiều trải nghiệm thú vị. Hà Giang không chỉ đẹp bởi phong cảnh hùng vĩ, những con đường uốn lượn quanh co dài bất tận, mà nó còn đẹp bởi Sắc Hoa và Tình Người. Hoa nở quanh năm với các mầu sắc diệu kỳ như: Vàng vàng của Hoa Cải, Tim Tím của Tam Giác Mạch, Trắng muốt của Hoa Mận, và một loài hoa đặc biệt nữa đó là “Hoa Đá” xám đen của những khối đá trên Cao Nguyên Đồng Văn. Du lịch Hà Giang từ lâu đã trở thành một điểm đến vô cùng thú vị đối với cả du khách trong và ngoài nước. Với khung cảnh đẹp như tranh vẽ cùng với cảnh quan núi đá hùng vĩ, mỗi năm Hà Giang đón tiếp không biết bao nhiêu khách tới thăm.', 169000000, 10511, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm1.jpg?alt=media&token=4f3c6808-4935-4d08-888e-376c52bd889b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm2.jpg?alt=media&token=d2b23120-31f7-4ed0-acd6-19ca1c542e60, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHG3.jpg?alt=media&token=eaa7d830-26e2-46f9-91e0-b3f925f1b311, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHG4.jpg?alt=media&token=bfeb753e-81cb-41f6-b888-388348e40b12, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHG5.jpg?alt=media&token=f83d15d4-dbc4-464f-b5ae-8f9664525ba3', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Hà Giang')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (5, N'Tour Relax', N'Đất võ Bình Định những năm gần đây đã trở thành một điểm dừng chân nổi tiếng dành cho những du khách muốn chiêm ngưỡng và khám phá vẻ đẹp hoang sơ của miền Trung. Với nhiều địa danh du lịch mới nổi, Bình Định đã cuốn hút đông đảo du khách tìm đến tham quan, du lịch. Một khi du khách đã lựa chọn hành trình du lịch Bình Định chắc chắn sẽ không khỏi ngạc nhiên với những thắng cảnh và địa danh hấp dẫn nơi đây.', 7990000, 10000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm1.jpg?alt=media&token=4f3c6808-4935-4d08-888e-376c52bd889b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm2.jpg?alt=media&token=d2b23120-31f7-4ed0-acd6-19ca1c542e60, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm1.jpg?alt=media&token=4f3c6808-4935-4d08-888e-376c52bd889b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm2.jpg?alt=media&token=d2b23120-31f7-4ed0-acd6-19ca1c542e60, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Bình Định')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (6, N'Tour Năng Động', N'Đắk Lắk là tỉnh nằm giữa cao nguyên Nam Trung Bộ, phía đông giáp tỉnh Phú Yên và Khánh Hoà, phía tây giáp nước bạn Cam Pu Chia, phía nam giáp tỉnh Lâm Đồng, Đăk Nông, phía bắc giáp tỉnh Gia Lai. Nằm trong vùng đất đai rộng lớn với địa hình và khí hậu đa dạng đã tạo ra những vùng sinh thái nông nghiệp thích hợpvới nhiều loại cây trồng, đặc biệt có quỹ đất bazan phù hợp với cà phê, cao su, rừng có trữ lượng gỗ lớn nhất cả nước. Là một tỉnh trung tâm Tây Nguyên, Đắk Lắk có hệ thống giao thông đường bộ, đường hàng không tương đối hoàn chỉnh, tạo cho tỉnh một vị trí thuận lợi trong giao lưu phát triển kinh tế, văn hóa, xã hội và thực sự có tiềm năng phát triển du lịch.', 3690000, 10022, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm1.jpg?alt=media&token=4f3c6808-4935-4d08-888e-376c52bd889b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm2.jpg?alt=media&token=d2b23120-31f7-4ed0-acd6-19ca1c542e60, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDakLak.jpg?alt=media&token=e5f7bc6b-dbf9-410d-94b8-83f2b6be4f8d, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDakLak1.jpg?alt=media&token=ec1a89d9-adbb-4687-b7ae-22a536c7f20d, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDakLak2.jpg?alt=media&token=ad2b3bcd-83a3-47bb-bec1-6cf50b612860, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDakLak3.jpg?alt=media&token=2f08e892-384c-4bbe-890f-9981bd38c620', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Đak Lak')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (7, N'Tour Đặc Biệt', N'Đồng Tháp là một trong những tỉnh đẹp tuyệt vời của miền Tây Nam Bộ, thuộc vùng đồng bằng sông Cửu Long. Du lịch Đồng Tháp, du khách có cơ hội đắm chìm vào những cảnh đẹp thiên nhiên bình dị, mộng mơ của miền quê sông nước. Đây là địa điểm lý tưởng cho những ai muốn thay đổi không khí, muốn trốn khỏi sự tấp nập, xô bồ của nơi thành thị tấp nập. Nếu bạn muốn thực hiện một chuyến du lịch đến Đồng Tháp thì hãy tham khảo những kinh nghiệm dưới đây nhé, chắc chắn nó sẽ có ích cho chuyến đi của bạn đấy! Đồng Tháp là một trong những tỉnh thành phát triển, có vị trí quan trọng cả về kinh tế lẫn văn hóa, du lịch của vùng đồng bằng sông Cửu Long.', 2590000, 1000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm1.jpg?alt=media&token=4f3c6808-4935-4d08-888e-376c52bd889b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm2.jpg?alt=media&token=d2b23120-31f7-4ed0-acd6-19ca1c542e60, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDT.jpg?alt=media&token=1ad5de9d-2cf6-4a48-b34e-ab43dc1a1efc, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDT1.jpg?alt=media&token=ac609c09-0365-4040-9cce-5d4c91d9af86, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDT2.jpg?alt=media&token=580ada5a-352f-4fff-923f-df11dc26eb15', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Đồng Tháp')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (8, N'Tour Hồi Xuân', N'Nằm ở vùng Nam Trung Bộ, Đà Nẵng có cả núi, đồng bằng và biển. Các điểm tham quan du lịch nổi tiếng khi du lịch Đà Nẵng bao gồm khu du lịch Bà Nà, bãi biển Mỹ Khê, và khu vui chơi giải trí trong nhà Fantasy Park lớn nhất châu Á. Đà Nẵng còn có nhiều thắng cảnh đẹp mê hồn như đèo Hải Vân, rừng nguyên sinh ở bán đảo Sơn Trà và Ngũ Hành Sơn. Đặc biệt, Đà Nẵng được bao quanh bởi 3 di sản văn hóa thế giới là Huế, Hội An và Mỹ Sơn, và xa hơn chút nữa là Vườn Quốc Gia Phong Nha – Kẻ Bàng. Hàng năm, Đà Nẵng tổ chức Lễ hội pháo hoa thu hút rất nhiều du khách muôn phương đến tham dự.', 9790000, 1057, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm1.jpg?alt=media&token=4f3c6808-4935-4d08-888e-376c52bd889b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm2.jpg?alt=media&token=d2b23120-31f7-4ed0-acd6-19ca1c542e60, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDN1.jpg?alt=media&token=5e8d733d-9e6d-455a-a371-0f537d4670be, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDN2.jpg?alt=media&token=3a4ed30e-8b44-40e9-b7eb-a525b3331833, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDN3.jpg?alt=media&token=d21026fc-9e41-4691-b51d-f6b85eb49e57', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Đà Nẵng')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (9, N'Tour Nghệ Nhân', N'Cách trung tâm thành phố Hồ Chí Minh chỉ khoảng 3 tiếng lái xe, với đường bờ biển trải dài 20km, Vũng Tàu là một trong những điểm đến yêu thích của du khách phía Nam. Nằm nhô hẳn ra khỏi đất liền như một dải đất, từ nơi đây, người ta có thể nhìn biển Đông cả khi trời mọc lẫn lúc hoàng hôn. Bên cạnh những giá trị cảnh quan thiên nhiên, Vũng Tàu còn là miền đất có truyền thống văn hóa lịch sử lâu đời.', 1990000, 1000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm1.jpg?alt=media&token=4f3c6808-4935-4d08-888e-376c52bd889b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm2.jpg?alt=media&token=d2b23120-31f7-4ed0-acd6-19ca1c542e60, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img1.jpg?alt=media&token=5b5e1b0c-6c13-4683-ae7f-ad93742c969e, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img2.jpg?alt=media&token=c7c6be01-720d-4c13-a683-da03877766d2, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img3.jpg?alt=media&token=b2da8e86-15e2-4ed7-bdd9-29f8b13ddd8b', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Nghệ An')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (10, N'Tour Mỹ Quan', N'Cách trung tâm thành phố Hồ Chí Minh chỉ khoảng 3 tiếng lái xe, với đường bờ biển trải dài 20km, Vũng Tàu là một trong những điểm đến yêu thích của du khách phía Nam. Nằm nhô hẳn ra khỏi đất liền như một dải đất, từ nơi đây, người ta có thể nhìn biển Đông cả khi trời mọc lẫn lúc hoàng hôn. Bên cạnh những giá trị cảnh quan thiên nhiên, Vũng Tàu còn là miền đất có truyền thống văn hóa lịch sử lâu đời.', 3990000, 1000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN1.jpg?alt=media&token=23724a88-bafd-4b93-bee4-1b9cd2c16b07, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN2.jpg?alt=media&token=2d02687c-bab6-4cc6-bf0a-3934c077c7b9, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN3.jpg?alt=media&token=d1a19d1b-7c2f-4dc2-9eea-406e3cb9012a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img1.jpg?alt=media&token=5b5e1b0c-6c13-4683-ae7f-ad93742c969e, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img2.jpg?alt=media&token=c7c6be01-720d-4c13-a683-da03877766d2, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img3.jpg?alt=media&token=b2da8e86-15e2-4ed7-bdd9-29f8b13ddd8b', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Vũng Tàu')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (11, N'Tour Mùa Thu', N'Sở hữu không gian đô thị đặc trưng, năng động và hiện đại, thành phố Hồ Chí Minh mang trong mình những giá trị văn hóa vật thể và phi vật thể đa dạng, dung hòa giữa đương đại và truyền thống, tạo nên sức hấp dẫn riêng biệt. Với vị trí đắc địa, thành phố Hồ Chí Minh là đầu mối giao thông quan trọng, là nút giao giữa các tuyến đường hàng hải, hàng không, đường bộ từ Bắc vào Nam, từ Đông sang Tây, giúp thành phố phát triển kinh tế thuận lợi, trở thành một trong những trung tâm kinh tế lớn của cả nước. Đồng thời, nhiều công trình hiện đại nổi bật đã và đang được thành phố xây dựng, rất nhiều du khách quốc tế đến tham quan. Ngoài ra, thành phố Hồ Chí Minh còn là nơi hội tụ cư dân từ mọi miền đất nước và khắp thế giới, góp phần tạo nên một thành phố đa dạng văn hóa và đặc sắc về ẩm thực.', 13990000, 1001, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN1.jpg?alt=media&token=23724a88-bafd-4b93-bee4-1b9cd2c16b07, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN2.jpg?alt=media&token=2d02687c-bab6-4cc6-bf0a-3934c077c7b9, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN3.jpg?alt=media&token=d1a19d1b-7c2f-4dc2-9eea-406e3cb9012a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm4.jpg?alt=media&token=d9d28ec9-a47f-4ce9-b02f-95c11b45f47a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm5.jpg?alt=media&token=bc38845e-42ae-4ae1-a84c-029ee3b1a402', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'TP HCM')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (12, N'Tour Mùa Hạ', N'Du lịch Đà Lạt từ lâu đã trở thành điểm đến không thể bỏ qua của du khách trong và ngoài nước. Giới thiệu về Đà Lạt sẽ giúp bạn hiểu về lịch sử quá trình hình thành nên một Đà Lạt đẹp như hiện nay. Bên cạnh đó, du khách sẽ biết các địa điểm vui chơi, giải trí và ăn uống khi đến thành phố ngàn hoa. Thành phố Đà Lạt nằm trên cao nguyên Lâm Viên được coi là địa điểm du lịch hấp dẫn tại Việt Nam. Diện tích Đà Lạt rộng khoảng 400 km2 và nơi đây là thành phố loại 1 trực thuộc tỉnh ủy Lâm Đồng.', 8990000, 1000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN1.jpg?alt=media&token=23724a88-bafd-4b93-bee4-1b9cd2c16b07, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN2.jpg?alt=media&token=2d02687c-bab6-4cc6-bf0a-3934c077c7b9, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN3.jpg?alt=media&token=d1a19d1b-7c2f-4dc2-9eea-406e3cb9012a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDL3.jpg?alt=media&token=969af4dc-c2ba-44b5-9522-551b6ba6a243, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDL4.jpg?alt=media&token=0c55d1ea-19a8-4fe0-a003-984555a4782a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDL5.jpg?alt=media&token=fb33f8dd-6fe0-40eb-81a3-f56b19ac10dd', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Đà Lạt')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (13, N'Tour Mùa Đông', N'Hà Giang mang đến nhiều trải nghiệm thú vị. Hà Giang không chỉ đẹp bởi phong cảnh hùng vĩ, những con đường uốn lượn quanh co dài bất tận, mà nó còn đẹp bởi Sắc Hoa và Tình Người. Hoa nở quanh năm với các mầu sắc diệu kỳ như: Vàng vàng của Hoa Cải, Tim Tím của Tam Giác Mạch, Trắng muốt của Hoa Mận, và một loài hoa đặc biệt nữa đó là “Hoa Đá” xám đen của những khối đá trên Cao Nguyên Đồng Văn. Du lịch Hà Giang từ lâu đã trở thành một điểm đến vô cùng thú vị đối với cả du khách trong và ngoài nước. Với khung cảnh đẹp như tranh vẽ cùng với cảnh quan núi đá hùng vĩ, mỗi năm Hà Giang đón tiếp không biết bao nhiêu khách tới thăm.', 15990000, 1000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN1.jpg?alt=media&token=23724a88-bafd-4b93-bee4-1b9cd2c16b07, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN2.jpg?alt=media&token=2d02687c-bab6-4cc6-bf0a-3934c077c7b9, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN3.jpg?alt=media&token=d1a19d1b-7c2f-4dc2-9eea-406e3cb9012a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHG2.jpg?alt=media&token=410aadcd-af4a-405c-8595-67b8470bc862, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHG3.jpg?alt=media&token=eaa7d830-26e2-46f9-91e0-b3f925f1b311, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHG4.jpg?alt=media&token=bfeb753e-81cb-41f6-b888-388348e40b12', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Hà Giang')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (14, N'Tour Mùa Trái Cây', N'Đất võ Bình Định những năm gần đây đã trở thành một điểm dừng chân nổi tiếng dành cho những du khách muốn chiêm ngưỡng và khám phá vẻ đẹp hoang sơ của miền Trung. Với nhiều địa danh du lịch mới nổi, Bình Định đã cuốn hút đông đảo du khách tìm đến tham quan, du lịch. Một khi du khách đã lựa chọn hành trình du lịch Bình Định chắc chắn sẽ không khỏi ngạc nhiên với những thắng cảnh và địa danh hấp dẫn nơi đây.', 5990000, 1000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN1.jpg?alt=media&token=23724a88-bafd-4b93-bee4-1b9cd2c16b07, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN2.jpg?alt=media&token=2d02687c-bab6-4cc6-bf0a-3934c077c7b9, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN3.jpg?alt=media&token=d1a19d1b-7c2f-4dc2-9eea-406e3cb9012a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewBD1.jpg?alt=media&token=9214a38b-da57-47e9-a815-85611bd3f0cd, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewBD2.jpg?alt=media&token=785d1479-b3a3-489e-ac47-257194d130fd, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewBD3.jpg?alt=media&token=1d622e47-0f3b-4a60-a560-6c983c8acde1', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Bình Định')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (15, N'Tour Mùa Dâu', N'Đắk Lắk là tỉnh nằm giữa cao nguyên Nam Trung Bộ, phía đông giáp tỉnh Phú Yên và Khánh Hoà, phía tây giáp nước bạn Cam Pu Chia, phía nam giáp tỉnh Lâm Đồng, Đăk Nông, phía bắc giáp tỉnh Gia Lai. Nằm trong vùng đất đai rộng lớn với địa hình và khí hậu đa dạng đã tạo ra những vùng sinh thái nông nghiệp thích hợpvới nhiều loại cây trồng, đặc biệt có quỹ đất bazan phù hợp với cà phê, cao su, rừng có trữ lượng gỗ lớn nhất cả nước. Là một tỉnh trung tâm Tây Nguyên, Đắk Lắk có hệ thống giao thông đường bộ, đường hàng không tương đối hoàn chỉnh, tạo cho tỉnh một vị trí thuận lợi trong giao lưu phát triển kinh tế, văn hóa, xã hội và thực sự có tiềm năng phát triển du lịch.', 3990000, 1057, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN1.jpg?alt=media&token=23724a88-bafd-4b93-bee4-1b9cd2c16b07, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN2.jpg?alt=media&token=2d02687c-bab6-4cc6-bf0a-3934c077c7b9, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN3.jpg?alt=media&token=d1a19d1b-7c2f-4dc2-9eea-406e3cb9012a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDakLak2.jpg?alt=media&token=ad2b3bcd-83a3-47bb-bec1-6cf50b612860, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDakLak3.jpg?alt=media&token=2f08e892-384c-4bbe-890f-9981bd38c620, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDakLak4.jpg?alt=media&token=7dc884ee-cc1a-413b-a35e-9b57148364ab', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Đak Lak')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (16, N'Tour Mùa Sầu Riêng', N'Đồng Tháp là một trong những tỉnh đẹp tuyệt vời của miền Tây Nam Bộ, thuộc vùng đồng bằng sông Cửu Long. Du lịch Đồng Tháp, du khách có cơ hội đắm chìm vào những cảnh đẹp thiên nhiên bình dị, mộng mơ của miền quê sông nước. Đây là địa điểm lý tưởng cho những ai muốn thay đổi không khí, muốn trốn khỏi sự tấp nập, xô bồ của nơi thành thị tấp nập. Nếu bạn muốn thực hiện một chuyến du lịch đến Đồng Tháp thì hãy tham khảo những kinh nghiệm dưới đây nhé, chắc chắn nó sẽ có ích cho chuyến đi của bạn đấy! Đồng Tháp là một trong những tỉnh thành phát triển, có vị trí quan trọng cả về kinh tế lẫn văn hóa, du lịch của vùng đồng bằng sông Cửu Long.', 7990000, 1000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN1.jpg?alt=media&token=23724a88-bafd-4b93-bee4-1b9cd2c16b07, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN2.jpg?alt=media&token=2d02687c-bab6-4cc6-bf0a-3934c077c7b9, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN3.jpg?alt=media&token=d1a19d1b-7c2f-4dc2-9eea-406e3cb9012a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDakLak.jpg?alt=media&token=e5f7bc6b-dbf9-410d-94b8-83f2b6be4f8d, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDakLak1.jpg?alt=media&token=ec1a89d9-adbb-4687-b7ae-22a536c7f20d, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDakLak2.jpg?alt=media&token=ad2b3bcd-83a3-47bb-bec1-6cf50b612860', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Đồng Tháp')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (17, N'Tour Nhiệt Đới', N'Nằm ở vùng Nam Trung Bộ, Đà Nẵng có cả núi, đồng bằng và biển. Các điểm tham quan du lịch nổi tiếng khi du lịch Đà Nẵng bao gồm khu du lịch Bà Nà, bãi biển Mỹ Khê, và khu vui chơi giải trí trong nhà Fantasy Park lớn nhất châu Á. Đà Nẵng còn có nhiều thắng cảnh đẹp mê hồn như đèo Hải Vân, rừng nguyên sinh ở bán đảo Sơn Trà và Ngũ Hành Sơn. Đặc biệt, Đà Nẵng được bao quanh bởi 3 di sản văn hóa thế giới là Huế, Hội An và Mỹ Sơn, và xa hơn chút nữa là Vườn Quốc Gia Phong Nha – Kẻ Bàng. Hàng năm, Đà Nẵng tổ chức Lễ hội pháo hoa thu hút rất nhiều du khách muôn phương đến tham dự.', 10790000, 1001, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN1.jpg?alt=media&token=23724a88-bafd-4b93-bee4-1b9cd2c16b07, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN2.jpg?alt=media&token=2d02687c-bab6-4cc6-bf0a-3934c077c7b9, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN3.jpg?alt=media&token=d1a19d1b-7c2f-4dc2-9eea-406e3cb9012a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDN3.jpg?alt=media&token=d21026fc-9e41-4691-b51d-f6b85eb49e57, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDN4.jpg?alt=media&token=19cbb42f-72c3-467b-bab1-3d5af9e76f41, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDN5.jpg?alt=media&token=252b732d-f8e8-44b5-b915-751e7f9c811a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDN6.jpg?alt=media&token=b02defda-4cd6-4b8f-a3a0-daff67349f23', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Đà Nẵng')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (18, N'Tour Đồng Bằng', N'Cách trung tâm thành phố Hồ Chí Minh chỉ khoảng 3 tiếng lái xe, với đường bờ biển trải dài 20km, Vũng Tàu là một trong những điểm đến yêu thích của du khách phía Nam. Nằm nhô hẳn ra khỏi đất liền như một dải đất, từ nơi đây, người ta có thể nhìn biển Đông cả khi trời mọc lẫn lúc hoàng hôn. Bên cạnh những giá trị cảnh quan thiên nhiên, Vũng Tàu còn là miền đất có truyền thống văn hóa lịch sử lâu đời.', 12790000, 1000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN1.jpg?alt=media&token=23724a88-bafd-4b93-bee4-1b9cd2c16b07, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN2.jpg?alt=media&token=2d02687c-bab6-4cc6-bf0a-3934c077c7b9, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN3.jpg?alt=media&token=d1a19d1b-7c2f-4dc2-9eea-406e3cb9012a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img1.jpg?alt=media&token=5b5e1b0c-6c13-4683-ae7f-ad93742c969e, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img2.jpg?alt=media&token=c7c6be01-720d-4c13-a683-da03877766d2, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img3.jpg?alt=media&token=b2da8e86-15e2-4ed7-bdd9-29f8b13ddd8b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img4.jpg?alt=media&token=772a13b1-ce3f-4a47-8b4f-2ee4b2a35ada', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'TP HCM')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (19, N'Tour Miền Núi', N'Du lịch Hà Nội có đa dạng hình thức, điểm đến và hoạt động như: du lịch tâm linh - lịch sử; du lịch nghỉ dưỡng; du lịch hội thảo, MICE; du lịch văn hóa, lễ hội, từ đó mang đến nhiều trải nghiệm thú vị cho du khách. Đến Thủ đô, bạn sẽ được khám phá nhiều địa danh nổi tiếng như: Lăng Chủ tịch Hồ Chí Minh, Văn Miếu - Quốc Tử Giám cùng với đó là trải nghiệm nhiều lễ hội văn hóa đặc sắc như: hội chùa Hương, hội Chèm... Với lịch sử “nghìn năm văn hiến”, Thủ đô luôn thu hút khách du lịch trong và ngoài nước với màu sắc đặc trưng, với nét văn hóa đậm đà bản sắc cùng một lối sống riêng không thể lẫn với bất kỳ nơi nào khác.', 7790000, 1000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img1.jpg?alt=media&token=5b5e1b0c-6c13-4683-ae7f-ad93742c969e, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img2.jpg?alt=media&token=c7c6be01-720d-4c13-a683-da03877766d2, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img3.jpg?alt=media&token=b2da8e86-15e2-4ed7-bdd9-29f8b13ddd8b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN2.jpg?alt=media&token=2d02687c-bab6-4cc6-bf0a-3934c077c7b9, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN3.jpg?alt=media&token=d1a19d1b-7c2f-4dc2-9eea-406e3cb9012a, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHN4.jpg?alt=media&token=9aece172-c734-423f-bf1e-2aa1cec0dae9', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Hà Nội')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (20, N'Tour Biển Rộng', N'Hà Giang mang đến nhiều trải nghiệm thú vị. Hà Giang không chỉ đẹp bởi phong cảnh hùng vĩ, những con đường uốn lượn quanh co dài bất tận, mà nó còn đẹp bởi Sắc Hoa và Tình Người. Hoa nở quanh năm với các mầu sắc diệu kỳ như: Vàng vàng của Hoa Cải, Tim Tím của Tam Giác Mạch, Trắng muốt của Hoa Mận, và một loài hoa đặc biệt nữa đó là “Hoa Đá” xám đen của những khối đá trên Cao Nguyên Đồng Văn. Du lịch Hà Giang từ lâu đã trở thành một điểm đến vô cùng thú vị đối với cả du khách trong và ngoài nước. Với khung cảnh đẹp như tranh vẽ cùng với cảnh quan núi đá hùng vĩ, mỗi năm Hà Giang đón tiếp không biết bao nhiêu khách tới thăm.', 15990000, 1000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img1.jpg?alt=media&token=5b5e1b0c-6c13-4683-ae7f-ad93742c969e, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img2.jpg?alt=media&token=c7c6be01-720d-4c13-a683-da03877766d2, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img3.jpg?alt=media&token=b2da8e86-15e2-4ed7-bdd9-29f8b13ddd8b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHG1.jpg?alt=media&token=2191fa48-9c3a-4606-8862-fd1494f16fa2, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHG2.jpg?alt=media&token=410aadcd-af4a-405c-8595-67b8470bc862, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewHG3.jpg?alt=media&token=eaa7d830-26e2-46f9-91e0-b3f925f1b311', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Hà Giang')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (21, N'Tour Chất Chất', N'Nằm ở vùng Nam Trung Bộ, Đà Nẵng có cả núi, đồng bằng và biển. Các điểm tham quan du lịch nổi tiếng khi du lịch Đà Nẵng bao gồm khu du lịch Bà Nà, bãi biển Mỹ Khê, và khu vui chơi giải trí trong nhà Fantasy Park lớn nhất châu Á. Đà Nẵng còn có nhiều thắng cảnh đẹp mê hồn như đèo Hải Vân, rừng nguyên sinh ở bán đảo Sơn Trà và Ngũ Hành Sơn. Đặc biệt, Đà Nẵng được bao quanh bởi 3 di sản văn hóa thế giới là Huế, Hội An và Mỹ Sơn, và xa hơn chút nữa là Vườn Quốc Gia Phong Nha – Kẻ Bàng. Hàng năm, Đà Nẵng tổ chức Lễ hội pháo hoa thu hút rất nhiều du khách muôn phương đến tham dự.', 9990000, 1000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img1.jpg?alt=media&token=5b5e1b0c-6c13-4683-ae7f-ad93742c969e, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img2.jpg?alt=media&token=c7c6be01-720d-4c13-a683-da03877766d2, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img3.jpg?alt=media&token=b2da8e86-15e2-4ed7-bdd9-29f8b13ddd8b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDN1.jpg?alt=media&token=5e8d733d-9e6d-455a-a371-0f537d4670be, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDN2.jpg?alt=media&token=3a4ed30e-8b44-40e9-b7eb-a525b3331833, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewDN3.jpg?alt=media&token=d21026fc-9e41-4691-b51d-f6b85eb49e57', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'Đà Nẵng')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (22, N'Tour Ngân Vang', N'Sở hữu không gian đô thị đặc trưng, năng động và hiện đại, thành phố Hồ Chí Minh mang trong mình những giá trị văn hóa vật thể và phi vật thể đa dạng, dung hòa giữa đương đại và truyền thống, tạo nên sức hấp dẫn riêng biệt. Với vị trí đắc địa, thành phố Hồ Chí Minh là đầu mối giao thông quan trọng, là nút giao giữa các tuyến đường hàng hải, hàng không, đường bộ từ Bắc vào Nam, từ Đông sang Tây, giúp thành phố phát triển kinh tế thuận lợi, trở thành một trong những trung tâm kinh tế lớn của cả nước. Đồng thời, nhiều công trình hiện đại nổi bật đã và đang được thành phố xây dựng, rất nhiều du khách quốc tế đến tham quan. Ngoài ra, thành phố Hồ Chí Minh còn là nơi hội tụ cư dân từ mọi miền đất nước và khắp thế giới, góp phần tạo nên một thành phố đa dạng văn hóa và đặc sắc về ẩm thực.', 3790000, 1001, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img1.jpg?alt=media&token=5b5e1b0c-6c13-4683-ae7f-ad93742c969e, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img2.jpg?alt=media&token=c7c6be01-720d-4c13-a683-da03877766d2, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/img3.jpg?alt=media&token=b2da8e86-15e2-4ed7-bdd9-29f8b13ddd8b, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm2.jpg?alt=media&token=d2b23120-31f7-4ed0-acd6-19ca1c542e60, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm3.jpg?alt=media&token=9b829f44-040c-4429-9823-a90a11eb7b31, https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/viewhcm4.jpg?alt=media&token=d9d28ec9-a47f-4ce9-b02f-95c11b45f47a', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), 1, N'TP HCM')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (23, N'Tour Miền Nam', N'hdisc', 2000000, 8, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/1%20-%20Copy%20-%20Copy%20-%20Copy.jpg?alt=media&token=931f4122-c174-4226-b965-73b0d3dbf60f', 0, CAST(N'2024-06-04T16:31:39.537' AS DateTime), CAST(N'2024-06-04T16:33:16.467' AS DateTime), 19, N'Thành Phố Hồ Chí Minh')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (24, N'Tour Miền Nam', N'Chuyến du lịch', 2000000, 1, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/2%20-%20Copy%20-%20Copy.jpg?alt=media&token=f1dc775f-6266-40e9-aa94-ca2c4549f79f,https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/2%20-%20Copy%20(2).jpg?alt=media&token=6bbb137a-642f-4af8-a582-9fc6e5d2f3e1,https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/2%20-%20Copy.jpg?alt=media&token=c1547776-e2c1-434c-84cd-00dbb26ae6e5', 1, CAST(N'2024-06-05T11:43:24.917' AS DateTime), CAST(N'2024-06-05T11:43:24.917' AS DateTime), 19, N'TP HCM')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (10023, N'Tour Phú Quốc', N'Chuyến đi du lịch Phú Quốc', 2000000, 1, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/1%20-%20Copy.jpg?alt=media&token=4ed5c202-3d27-4ba4-8b3e-6daff3002670', 1, CAST(N'2024-06-07T20:47:52.740' AS DateTime), CAST(N'2024-06-07T20:47:52.740' AS DateTime), 19, N'Phú Quốc')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (10024, N'Tour Điện Biên', N'Chuyến đi du lịch', 2000000, 1, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/1%20-%20Copy.jpg?alt=media&token=4ed5c202-3d27-4ba4-8b3e-6daff3002670', 1, CAST(N'2024-06-07T20:49:00.707' AS DateTime), CAST(N'2024-06-07T20:49:00.707' AS DateTime), 19, N'Phú Quốc')
INSERT [dbo].[tour] ([id], [title], [description], [price], [views], [images], [isactive], [createdate], [updatedate], [accountId], [location]) VALUES (10025, N'Test', N'<p>Hello</p><p><strong>Helllo Các bạn</strong></p>', 12333, 1, N'', 0, CAST(N'2024-06-10T23:28:50.827' AS DateTime), CAST(N'2024-06-11T19:19:33.143' AS DateTime), 20, N'tp hcm')
SET IDENTITY_INSERT [dbo].[tour] OFF
GO
INSERT [dbo].[voucher] ([id], [title], [discount], [condition], [quanity], [image], [createdate], [updatedate], [accountid], [isactive], [enddate]) VALUES (N'ABC12345', N'Admin 456', 60, 0, 10000, N'https://firebasestorage.googleapis.com/v0/b/travel-bee-e0b59.appspot.com/o/hinh-nen-bong-hoa-sen-cho-may-tinh_023801336.jpg?alt=media&token=94bf40b7-1eb8-47bb-a8f5-af32d56a074d', CAST(N'2024-05-18T00:00:00.000' AS DateTime), CAST(N'2024-05-18T20:21:00.340' AS DateTime), 20, 1, CAST(N'2024-05-30T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[voucher] ([id], [title], [discount], [condition], [quanity], [image], [createdate], [updatedate], [accountid], [isactive], [enddate]) VALUES (N'ADMIN123', N'ADMIN123', 99, 1, 100, NULL, CAST(N'2024-05-18T22:26:35.953' AS DateTime), CAST(N'2024-05-17T22:26:35.953' AS DateTime), 19, 1, CAST(N'2024-07-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[voucher] ([id], [title], [discount], [condition], [quanity], [image], [createdate], [updatedate], [accountid], [isactive], [enddate]) VALUES (N'ADMIN456', N'Admin 456', 99.9, 1, 10000, NULL, CAST(N'2024-05-30T00:00:00.000' AS DateTime), CAST(N'2024-05-18T08:23:15.940' AS DateTime), 1, 1, CAST(N'2024-07-17T00:00:00.0000000' AS DateTime2))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_epk9im9l9q67xmwi4hbed25do]    Script Date: 6/11/2024 7:42:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_epk9im9l9q67xmwi4hbed25do] ON [dbo].[role]
(
	[name] ASC
)
WHERE ([name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[plantour] ADD  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[tour] ADD  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD FOREIGN KEY([accountid])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD FOREIGN KEY([roleid])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([tourid])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([accountid])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[likes]  WITH CHECK ADD FOREIGN KEY([accountid])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[likes]  WITH CHECK ADD FOREIGN KEY([tourid])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([plantourid])
REFERENCES [dbo].[plantour] ([id])
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD FOREIGN KEY([ordersid])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[plantour]  WITH CHECK ADD FOREIGN KEY([accountid])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[plantour]  WITH CHECK ADD FOREIGN KEY([tourid])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[reportour]  WITH CHECK ADD FOREIGN KEY([accountid])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[reportour]  WITH CHECK ADD FOREIGN KEY([tourid])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[voucher]  WITH CHECK ADD FOREIGN KEY([accountid])
REFERENCES [dbo].[account] ([id])
GO
USE [master]
GO
ALTER DATABASE [travelbee] SET  READ_WRITE 
GO
