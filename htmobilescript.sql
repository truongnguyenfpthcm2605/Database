USE [master]
GO
/****** Object:  Database [HTMOBILE]    Script Date: 2/16/2024 3:53:58 PM ******/
CREATE DATABASE [HTMOBILE]

ALTER DATABASE [HTMOBILE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HTMOBILE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HTMOBILE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HTMOBILE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HTMOBILE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HTMOBILE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HTMOBILE] SET ARITHABORT OFF 
GO
ALTER DATABASE [HTMOBILE] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HTMOBILE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HTMOBILE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HTMOBILE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HTMOBILE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HTMOBILE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HTMOBILE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HTMOBILE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HTMOBILE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HTMOBILE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HTMOBILE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HTMOBILE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HTMOBILE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HTMOBILE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HTMOBILE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HTMOBILE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HTMOBILE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HTMOBILE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HTMOBILE] SET  MULTI_USER 
GO
ALTER DATABASE [HTMOBILE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HTMOBILE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HTMOBILE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HTMOBILE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HTMOBILE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HTMOBILE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HTMOBILE] SET QUERY_STORE = OFF
GO
USE [HTMOBILE]
GO
/****** Object:  User [truongadmin]    Script Date: 2/16/2024 3:53:58 PM ******/
CREATE USER [truongadmin] FOR LOGIN [truongadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[category]    Script Date: 2/16/2024 3:53:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imgcategory] [nvarchar](100) NULL,
	[title] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorite]    Script Date: 2/16/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorite](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[createday] [datetime] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 2/16/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[description] [nvarchar](300) NOT NULL,
	[createday] [datetime] NULL,
	[reply] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2/16/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](300) NOT NULL,
	[phone] [varchar](12) NOT NULL,
	[status] [nvarchar](100) NOT NULL,
	[createday] [datetime] NULL,
	[notes] [nvarchar](300) NULL,
	[voucher] [nvarchar](60) NULL,
	[usersid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordersDetail]    Script Date: 2/16/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordersDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ordersid] [int] NULL,
	[productid] [int] NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 2/16/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createday] [datetime] NULL,
	[img] [nvarchar](250) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 2/16/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[pricecost] [float] NOT NULL,
	[price] [float] NOT NULL,
	[ram] [int] NOT NULL,
	[rom] [int] NOT NULL,
	[pin] [int] NOT NULL,
	[chip] [nvarchar](30) NOT NULL,
	[camera] [int] NOT NULL,
	[screen] [float] NOT NULL,
	[createday] [datetime] NULL,
	[updateday] [datetime] NULL,
	[quanityfinal] [int] NOT NULL,
	[quantitysold] [int] NOT NULL,
	[imgproduct] [nvarchar](50) NOT NULL,
	[thumnail] [nvarchar](256) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[active] [bit] NULL,
	[views] [bigint] NULL,
	[categoryid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[share]    Script Date: 2/16/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[number] [int] NOT NULL,
	[createday] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2/16/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](256) NOT NULL,
	[fullname] [nvarchar](30) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[gender] [bit] NULL,
	[birthday] [date] NOT NULL,
	[active] [bit] NULL,
	[createday] [datetime] NULL,
	[updateday] [datetime] NULL,
	[img] [nvarchar](100) NULL,
	[role] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher]    Script Date: 2/16/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[id] [nvarchar](6) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[discount] [int] NOT NULL,
	[createday] [datetime] NULL,
	[endday] [datetime] NOT NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [imgcategory], [title]) VALUES (1, NULL, N'APPLE')
INSERT [dbo].[category] ([id], [imgcategory], [title]) VALUES (2, NULL, N'SAMSUNG')
INSERT [dbo].[category] ([id], [imgcategory], [title]) VALUES (3, NULL, N'OPPO')
INSERT [dbo].[category] ([id], [imgcategory], [title]) VALUES (4, NULL, N'XIAOMI')
INSERT [dbo].[category] ([id], [imgcategory], [title]) VALUES (5, NULL, N'SONY')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[feedback] ON 

INSERT [dbo].[feedback] ([id], [userid], [description], [createday], [reply]) VALUES (1, 2, N'Web Như db , địt địt địt !', CAST(N'2023-06-13T17:14:16.687' AS DateTime), NULL)
INSERT [dbo].[feedback] ([id], [userid], [description], [createday], [reply]) VALUES (3, 2, N'Web Của Văn Trường Quá Chất Lượng', CAST(N'2023-06-13T20:24:25.610' AS DateTime), 1)
INSERT [dbo].[feedback] ([id], [userid], [description], [createday], [reply]) VALUES (4, 1, N'Web chất lượng lắm', CAST(N'2023-10-12T16:53:36.370' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (1, N' 30 DHT 23, Đông Hưng Thuận , Quận 12 ,TP HCM', N'0377379249', N'Đã Xuất Kho', CAST(N'2023-06-06T22:51:44.773' AS DateTime), N'Nhớ đóng gói kỹ nha', N'23DHW4', 2)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (2, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đóng Gói', CAST(N'2023-06-07T16:15:46.013' AS DateTime), N'', N'23DHW4', 2)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (3, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Hủy', CAST(N'2023-06-07T16:24:04.537' AS DateTime), N'anh tiếp 1 triệu ', N'23DHW4', 2)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (4, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-07T16:26:17.133' AS DateTime), N'Anh bo 500K', N'23DHW4', 2)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (5, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-07T16:45:10.923' AS DateTime), N'Anh tiếp cho 5 triệu cafe', N'23DHW4', 2)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (6, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-07T17:08:18.367' AS DateTime), N'Hàng Êm Lắm', N'23DHW4', 2)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (7, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-07T17:10:10.400' AS DateTime), N'Hàng Ok lắm', N'23DHW4', 2)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (8, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Xuất Kho', CAST(N'2023-06-07T17:16:57.317' AS DateTime), N'Hàng Quá Chất lượng', N'23DHW4', 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (9, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-07T19:40:14.540' AS DateTime), N'anh tiếp 5tr', N'23DHW4', 2)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (10, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-08T18:36:04.033' AS DateTime), N'Ok', N'23DHW4', 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (11, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-11T00:05:30.083' AS DateTime), N'325q35', NULL, 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (12, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-11T00:09:46.567' AS DateTime), N'2341234', NULL, 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (13, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-11T00:11:30.173' AS DateTime), N'45345346523453', NULL, 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (14, N'42323', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-11T00:13:56.987' AS DateTime), N'35645656', N'23DHW4', 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (15, N'3453253453', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-11T00:18:40.563' AS DateTime), N'3425234543', NULL, 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (16, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-11T00:20:05.617' AS DateTime), N'244234', NULL, 2)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (17, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-11T00:36:45.853' AS DateTime), N'q345234242423', NULL, 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (18, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Xác Nhận', CAST(N'2023-06-14T19:48:16.020' AS DateTime), N'ảqRQ', NULL, 2)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (19, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đóng Gói', CAST(N'2023-06-14T19:59:42.107' AS DateTime), N'gsrgdsdrsge', NULL, 2)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (20, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-06-20T18:48:42.567' AS DateTime), N'3twuryir4', NULL, 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (21, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đóng Gói', CAST(N'2023-09-25T19:30:03.600' AS DateTime), N'segzdhdzh', NULL, 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (22, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Xác Nhận', CAST(N'2023-10-12T16:54:51.873' AS DateTime), N'3q6q36q346', N'23DHW4', 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (23, N'Ấp 5, Xã Đốc Binh Kiều ,Tháp Mười, Đồng Tháp', N'0377379249', N'Đã Đặt Hàng', CAST(N'2023-10-12T17:06:19.213' AS DateTime), N'2t346362362362', N'23DHW4', 1)
INSERT [dbo].[orders] ([id], [address], [phone], [status], [createday], [notes], [voucher], [usersid]) VALUES (24, N'Chung cư 12 view , Quận 12 ,TP HCM', N'0373944710', N'Đã Xác Nhận', CAST(N'2023-10-13T10:23:32.170' AS DateTime), N'giao cho bảo vệ', N'23DHW4', 16)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ordersDetail] ON 

INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (1, 1, 1, 25990000, 2)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (2, 2, 8, 2990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (3, 3, 9, 23990000, 2)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (4, 4, 15, 6590000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (5, 5, 7, 30990000, 2)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (6, 6, 15, 6590000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (7, 7, 15, 6590000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (8, 8, 6, 7990000, 2)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (9, 9, 8, 2990000, 2)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (10, 10, 2, 20990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (11, 11, 5, 8990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (12, 12, 1, 25990000, 2)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (13, 13, 6, 7990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (14, 14, 26, 3490000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (15, 15, 2, 20990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (16, 16, 7, 30990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (17, 16, 8, 2990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (18, 17, 1, 25990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (19, 17, 2, 20990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (20, 18, 1, 25990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (21, 19, 21, 17990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (22, 20, 2, 20990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (23, 20, 7, 30990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (24, 21, 10, 16990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (25, 21, 11, 8990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (26, 21, 12, 5990000, 2)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (27, 22, 1, 25990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (28, 22, 8, 2990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (29, 22, 10, 16990000, 2)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (30, 23, 7, 30990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (31, 23, 8, 2990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (32, 23, 9, 23990000, 1)
INSERT [dbo].[ordersDetail] ([id], [ordersid], [productid], [price], [quantity]) VALUES (33, 24, 1, 25990000, 1)
SET IDENTITY_INSERT [dbo].[ordersDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (1, N'SamSung Galaxy S23 Ultra', 30000000, 25990000, 8, 512, 5000, N'Snapdragon 8Gen2', 12, 6.7, CAST(N'2023-06-06T14:25:05.473' AS DateTime), CAST(N'2023-10-13T10:23:32.190' AS DateTime), 940, 60, N'product-1.jpg', N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg', N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.', 1, 1003, 2)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (2, N'SamSung Galaxy S22 Plus', 25990000, 20990000, 12, 256, 6000, N'Snapdragon 8Gen1', 12, 6.5, CAST(N'2023-06-06T14:25:14.500' AS DateTime), CAST(N'2023-06-20T18:48:42.663' AS DateTime), 445, 55, N'product-3.jpg', N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg', N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.', 1, 2351, 2)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (3, N'SamSung Galaxy S21 Ultra', 15990000, 12990000, 6, 128, 4000, N'Snapdragon 888', 12, 6.5, CAST(N'2023-06-06T14:25:14.500' AS DateTime), CAST(N'2023-06-07T17:16:57.453' AS DateTime), 249, 51, N'product-4.jpg', N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg', N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.', 1, 1000, 2)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (4, N'SamSung Galaxy S21 Plus', 15990000, 12990000, 6, 64, 4500, N'Exynos 2100', 12, 6.2, CAST(N'2023-06-06T14:25:14.500' AS DateTime), CAST(N'2023-06-06T14:25:14.500' AS DateTime), 250, 50, N'product-6.jpg', N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg', N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.', 1, 1000, 2)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (5, N'SamSung Galaxy S20 Ultra', 10990000, 8990000, 6, 256, 5500, N'Snapdragon 865', 12, 6.2, CAST(N'2023-06-06T14:25:14.500' AS DateTime), CAST(N'2023-06-11T00:11:30.210' AS DateTime), 146, 54, N'product-7.jpg', N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg', N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.', 1, 2355, 2)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (6, N'SamSung Galaxy A73 5G', 9990000, 7990000, 6, 128, 6500, N'Snapdragon 778G', 12, 6.7, CAST(N'2023-06-06T14:25:14.500' AS DateTime), CAST(N'2023-06-11T00:11:30.243' AS DateTime), 141, 59, N'product-9.jpg', N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg', N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.', 1, 1001, 2)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (7, N'Iphone 14 Pro Max', 35990000, 30990000, 6, 256, 6000, N'Apple A16 Bionic', 12, 6.5, CAST(N'2023-06-06T14:25:22.947' AS DateTime), CAST(N'2023-10-12T17:06:19.270' AS DateTime), 894, 106, N'iphone14.jpg', N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg', N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.', 1, 1002, 1)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (8, N'Iphone 13 Pro ', 30990000, 2990000, 6, 128, 5000, N'Apple A15 Bionic', 12, 6.5, CAST(N'2023-06-06T14:25:22.947' AS DateTime), CAST(N'2023-10-12T17:06:19.293' AS DateTime), 694, 106, N'iphone13.jpg', N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg', N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.', 1, 1002, 1)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (9, N'Iphone 12 Pro Max ', 25990000, 23990000, 6, 512, 4500, N'Apple A14 Bionic', 12, 6.7, CAST(N'2023-06-06T14:25:22.947' AS DateTime), CAST(N'2023-10-12T17:06:19.310' AS DateTime), 396, 104, N'iphone12.jpg', N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg', N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.', 1, 1000, 1)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (10, N'Iphone 11 Pro Max ', 20990000, 16990000, 4, 128, 4000, N'Apple A13 Bionic', 12, 6.7, CAST(N'2023-06-06T14:25:22.947' AS DateTime), CAST(N'2023-10-12T16:54:51.927' AS DateTime), 197, 103, N'iphone11.jpg', N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg', N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.', 1, 4382, 1)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (11, N'Iphone Xs Max ', 10990000, 8990000, 4, 64, 4000, N'Apple A12 Bionic', 12, 6.5, CAST(N'2023-06-06T14:25:22.947' AS DateTime), CAST(N'2023-09-25T19:30:03.677' AS DateTime), 199, 101, N'iphonexsmax.jpg', N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg', N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.', 1, 1004, 1)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (12, N'Iphone 8 Plus ', 6990000, 5990000, 3, 64, 2900, N'Apple A11 Bionic', 12, 5.5, CAST(N'2023-06-06T14:25:22.947' AS DateTime), CAST(N'2023-09-25T19:30:03.687' AS DateTime), 98, 52, N'iphone8.jpg', N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg', N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.', 1, 3382, 1)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (13, N' Xiaomi Redmi Note 12 ', 5990000, 5790000, 8, 128, 6000, N'Snapdragon 685', 64, 6.5, CAST(N'2023-06-06T14:25:31.720' AS DateTime), CAST(N'2023-06-06T14:25:31.720' AS DateTime), 900, 100, N'xiaomi1.jpg', N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg', N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.', 1, 1000, 4)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (14, N' Xiaomi Mi 13 ', 25990000, 23790000, 12, 512, 6500, N'Snapdragon 8 Gen 2', 108, 6.5, CAST(N'2023-06-06T14:25:31.720' AS DateTime), CAST(N'2023-06-07T17:10:10.510' AS DateTime), 497, 103, N'xiaomi2.jpg', N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg', N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.', 1, 1000, 4)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (15, N' Xiaomi Redmi note 11 ', 6990000, 6590000, 6, 128, 5000, N'Snapdragon 765G', 48, 6.7, CAST(N'2023-06-06T14:25:31.720' AS DateTime), CAST(N'2023-06-07T17:10:10.517' AS DateTime), 197, 103, N'xiaomi3.jpg', N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg', N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.', 1, 1000, 4)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (16, N' Xiaomi Redmi K40 ', 8990000, 7590000, 8, 256, 5000, N'Snapdragon 870', 48, 6.6, CAST(N'2023-06-06T14:25:31.720' AS DateTime), CAST(N'2023-06-06T14:25:31.720' AS DateTime), 250, 100, N'xiaomi4.jpg', N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg', N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.', 1, 1000, 4)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (17, N' Xiaomi Mi 12 Ultra ', 19990000, 17590000, 8, 256, 5000, N'Snapdragon 8 Gen 1', 200, 6.5, CAST(N'2023-06-06T14:25:31.720' AS DateTime), CAST(N'2023-06-06T14:25:31.720' AS DateTime), 50, 20, N'xiaomi5.jpg', N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg', N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.', 1, 2383, 4)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (18, N' Xiaomi Redmi K60 ', 18990000, 17990000, 8, 256, 5000, N'Snapdragon 8 Gen 2', 64, 6.7, CAST(N'2023-06-06T14:25:31.720' AS DateTime), CAST(N'2023-06-06T14:25:31.720' AS DateTime), 100, 30, N'xiaomi6.jpg', N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg', N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.', 1, 1000, 4)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (19, N'OPPO Reno 8T', 10990000, 9990000, 8, 256, 5500, N'Snapdragon 695', 64, 6.5, CAST(N'2023-06-06T14:25:38.903' AS DateTime), CAST(N'2023-06-06T14:25:38.903' AS DateTime), 800, 100, N'oppo1.jpg', N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg', N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.', 1, 1000, 3)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (20, N'OPPO Find X5 Pro 5G', 19990000, 17990000, 12, 256, 5900, N'Snapdragon 8 Gen 2', 190, 6.8, CAST(N'2023-06-06T14:25:38.903' AS DateTime), CAST(N'2023-06-06T14:25:38.903' AS DateTime), 600, 100, N'oppo2.jpg', N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg', N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.', 1, 1000, 3)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (21, N'OPPO Find N2 Flip 5G', 19990000, 17990000, 12, 256, 6100, N'Snapdragon 8 Gen 2', 108, 6.5, CAST(N'2023-06-06T14:25:38.903' AS DateTime), CAST(N'2023-06-14T19:59:42.177' AS DateTime), 399, 101, N'oppo3.jpg', N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg', N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.', 1, 1751, 3)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (22, N'OPPO Reno6 Pro 5G', 13990000, 12990000, 12, 512, 6550, N'Snapdragon 870', 108, 6.6, CAST(N'2023-06-06T14:25:38.903' AS DateTime), CAST(N'2023-06-06T14:25:38.903' AS DateTime), 200, 50, N'oppo4.jpg', N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg', N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.', 1, 1000, 3)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (23, N'OPPO A96', 6990000, 5990000, 6, 128, 6250, N'Snapdragon 680', 64, 6.7, CAST(N'2023-06-06T14:25:38.903' AS DateTime), CAST(N'2023-06-06T14:25:38.903' AS DateTime), 200, 50, N'oppo5.jpg', N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg', N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.', 1, 1450, 3)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (24, N' OPPO Reno7 Z 5G', 7990000, 6990000, 6, 128, 5250, N'Snapdragon 695', 108, 6.55, CAST(N'2023-06-06T14:25:38.903' AS DateTime), CAST(N'2023-06-06T14:25:38.903' AS DateTime), 400, 50, N'oppo6.jpg', N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg', N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.', 1, 1000, 3)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (25, N'Sony Xperia 1 Mark ii', 6990000, 5990000, 8, 128, 4550, N'Snapdragon 865', 16, 6.5, CAST(N'2023-06-06T14:25:48.660' AS DateTime), CAST(N'2023-06-06T14:25:48.660' AS DateTime), 800, 100, N'sony1.jpg', N's1.jpg-s4.jpg-s3.jpg-s2.jpg-s5.jpg', N'Sony Xperia 1 Mark II đã ra mắt trong một tháng nay, và những người đam mê công nghệ đã háo hức chờ đợi để nghe cách thiết bị mới này chống lại các đối thủ cạnh tranh của nó.
Là một trong những phiên bản được mong đợi nhất trong năm, Sony Xperia 1 Mark II được trang bị các tính năng làm cho nó nổi bật so với các điện thoại thông minh khác trên thị trường. 
Từ hệ thống máy ảnh ấn tượng đến màn hình 4K OLED đẹp mắt, điện thoại này có rất nhiều thứ để cung cấp.', 1, 1000, 5)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (26, N'Sony Xperia 1', 3990000, 3490000, 6, 128, 3050, N'Snapdragon 855', 12, 6.5, CAST(N'2023-06-06T14:25:48.660' AS DateTime), CAST(N'2023-06-11T00:13:57.183' AS DateTime), 199, 81, N'sony2.jpg', N's1.jpg-s4.jpg-s3.jpg-s2.jpg-s5.jpg', N'Sony Xperia 1 Mark II đã ra mắt trong một tháng nay, và những người đam mê công nghệ đã háo hức chờ đợi để nghe cách thiết bị mới này chống lại các đối thủ cạnh tranh của nó.
Là một trong những phiên bản được mong đợi nhất trong năm, Sony Xperia 1 Mark II được trang bị các tính năng làm cho nó nổi bật so với các điện thoại thông minh khác trên thị trường. 
Từ hệ thống máy ảnh ấn tượng đến màn hình 4K OLED đẹp mắt, điện thoại này có rất nhiều thứ để cung cấp.', 1, 1000, 5)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (27, N'Sony Xperia 5', 4990000, 4490000, 6, 128, 3350, N'Snapdragon 855', 16, 6.7, CAST(N'2023-06-06T14:25:48.660' AS DateTime), CAST(N'2023-06-06T14:25:48.660' AS DateTime), 100, 80, N'sony3.jpg', N's1.jpg-s4.jpg-s3.jpg-s2.jpg-s5.jpg', N'Sony Xperia 1 Mark II đã ra mắt trong một tháng nay, và những người đam mê công nghệ đã háo hức chờ đợi để nghe cách thiết bị mới này chống lại các đối thủ cạnh tranh của nó.
Là một trong những phiên bản được mong đợi nhất trong năm, Sony Xperia 1 Mark II được trang bị các tính năng làm cho nó nổi bật so với các điện thoại thông minh khác trên thị trường. 
Từ hệ thống máy ảnh ấn tượng đến màn hình 4K OLED đẹp mắt, điện thoại này có rất nhiều thứ để cung cấp.', 1, 1000, 5)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (30, N'Iphone 7Plus', 3990000, 3990000, 2, 16, 2789, N'Apple A10 Fustion', 12, 5.5, CAST(N'2023-06-12T15:14:38.240' AS DateTime), CAST(N'2023-06-12T15:14:38.240' AS DateTime), 10, 0, N'iphone7plus.jpg', N'7plus.jpg-7plus2.jpg-7plus3.jpg-7plus4.jpg-7plus5.jpg-', N'Bộ đôi điện thoại iP 7 Plus và iP 7 được giới thiệu đến với người tiêu dùng vào năm 2016. Với hơn 5 năm ra mắt, điện thoại iPhone 7 Plus đã mất giá khá nhiều và thời điểm hiện tại rất khó để chọn mua điện thoại iPhone 7 Plus mới. Thay vào đó có rất nhiều phiên bản iPhone 7 Plus cũ cho người dùng lựa chọn từ cũ đẹp đến cữ trầy xước.', 1, 1001, 1)
INSERT [dbo].[product] ([id], [title], [pricecost], [price], [ram], [rom], [pin], [chip], [camera], [screen], [createday], [updateday], [quanityfinal], [quantitysold], [imgproduct], [thumnail], [description], [active], [views], [categoryid]) VALUES (31, N'Iphone 7', 4990000, 4590000, 2, 16, 3455, N'Apple A10 Fustion', 12, 5.5, CAST(N'2023-06-14T20:04:06.397' AS DateTime), CAST(N'2023-06-14T20:04:06.397' AS DateTime), 100, 0, N'7plus.jpg', N'7plus.jpg-7plus2.jpg-7plus3.jpg-7plus4.jpg-7plus5.jpg-', N'ư4te4tetgsdfgdfgdf', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (1, N'KxAawz8nPqnocuTKeqSZpw==', N'Nguyễn Văn Trường', N'truongnvps24083@fpt.edu.vn', 1, CAST(N'2001-05-26' AS Date), 1, CAST(N'2023-06-06T14:24:49.393' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 1)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (2, N'DqlCWoeAYAhuAvXUxFU1sw==', N'Võ Văn Hậu', N'hauvvps24106@fpt.edu.vn', 1, CAST(N'2001-05-26' AS Date), 1, CAST(N'2023-06-06T14:24:49.393' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (3, N'0ulFbWAy9OfLEXW4EiO11g==', N'Nguyễn Thị Mỹ', N'my@gmail.com', 1, CAST(N'2011-01-21' AS Date), 1, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (4, N'DqlCWoeAYAhuAvXUxFU1sw==', N'Võ Văn Nam', N'name@gmail.com.vn', 1, CAST(N'2006-08-22' AS Date), 1, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (5, N'0ulFbWAy9OfLEXW4EiO11g==', N'Nguyễn Phương Anh', N'phuonganh@gmail.com', 0, CAST(N'2001-01-21' AS Date), 0, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (6, N'DqlCWoeAYAhuAvXUxFU1sw==', N'Nguyễn Văn Báo', N'baothu@gmail.com.vn', 1, CAST(N'1999-08-22' AS Date), 0, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (7, N'0ulFbWAy9OfLEXW4EiO11g==', N'Hồ Ngọc Hà', N'hhha@gmail.com', 0, CAST(N'1989-03-19' AS Date), 1, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (8, N'DqlCWoeAYAhuAvXUxFU1sw==', N'Vũ Văn Mảnh', N'manh@gmail.com.vn', 1, CAST(N'1992-12-22' AS Date), 1, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (9, N'0ulFbWAy9OfLEXW4EiO11g==', N'Nguyễn Thị Ngọc Hân', N'hanhahnh@gmail.com', 0, CAST(N'2000-11-21' AS Date), 1, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (10, N'DqlCWoeAYAhuAvXUxFU1sw==', N'Lê Văn Minh Trung', N'trunganh@gmail.com.vn', 1, CAST(N'2007-03-22' AS Date), 0, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (11, N'0ulFbWAy9OfLEXW4EiO11g==', N'Lê Võ Phú Thiện', N'thienchodien@gmail.com', 1, CAST(N'1997-01-21' AS Date), 0, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (12, N'DqlCWoeAYAhuAvXUxFU1sw==', N'La Văn Mách', N'machnguyen@gmail.com.vn', 1, CAST(N'1987-08-12' AS Date), 1, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (13, N'0ulFbWAy9OfLEXW4EiO11g==', N'Nguyễn Huỳnh Anh', N'huynhanh@gmail.com', 0, CAST(N'1998-01-11' AS Date), 0, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (14, N'DqlCWoeAYAhuAvXUxFU1sw==', N'Ngô Tuấn Dương', N'duong@gmail.com.vn', 1, CAST(N'2009-08-27' AS Date), 1, CAST(N'2023-06-09T23:45:51.743' AS DateTime), CAST(N'2023-06-10T18:12:06.177' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [password], [fullname], [email], [gender], [birthday], [active], [createday], [updateday], [img], [role]) VALUES (16, N'j656blIcCqCmJqad75WDLg==', N'Phạm Thị Ngọc Hân', N'thanhhiep4436@gmail.com', 0, CAST(N'2003-05-27' AS Date), 1, CAST(N'2023-10-13T10:21:53.193' AS DateTime), CAST(N'2023-10-13T10:21:53.193' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
INSERT [dbo].[voucher] ([id], [name], [discount], [createday], [endday], [active]) VALUES (N'23DHW4', N'Sự Kiện khai trương', 20, CAST(N'2023-06-06T00:00:00.000' AS DateTime), CAST(N'2023-11-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[voucher] ([id], [name], [discount], [createday], [endday], [active]) VALUES (N'3453DS', N'Test Voucher', 10, CAST(N'2023-09-08T00:00:00.000' AS DateTime), CAST(N'2023-09-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[voucher] ([id], [name], [discount], [createday], [endday], [active]) VALUES (N'GF56UT', N'TẾT', 25, CAST(N'2023-06-12T00:00:00.000' AS DateTime), CAST(N'2023-06-29T00:00:00.000' AS DateTime), 1)
GO
ALTER TABLE [dbo].[favorite] ADD  DEFAULT (getdate()) FOR [createday]
GO
ALTER TABLE [dbo].[favorite] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[feedback] ADD  DEFAULT (getdate()) FOR [createday]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [createday]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT (getdate()) FOR [createday]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (getdate()) FOR [createday]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[share] ADD  DEFAULT (getdate()) FOR [createday]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [gender]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [createday]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [role]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT (getdate()) FOR [createday]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[favorite]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[favorite]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([usersid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[ordersDetail]  WITH CHECK ADD FOREIGN KEY([ordersid])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[ordersDetail]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[share]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[share]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
USE [master]
GO
ALTER DATABASE [HTMOBILE] SET  READ_WRITE 
GO
