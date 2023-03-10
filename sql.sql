--CREATE DATABASE CuaHangGiay
USE [CuaHangGiay]
GO
/****** Object:  Table [dbo].[AnhSP]    Script Date: 11-05-2022 18:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhSP](
	[MaAnh] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[URL] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 11-05-2022 18:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[MaCTSP] [int] NULL,
	[NoiDungBL] [nvarchar](255) NULL,
	[NgayBL] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 11-05-2022 18:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaCTHDB] [int] IDENTITY(1,1) NOT NULL,
	[SoHD] [int] NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Gia] [float] NULL,
	[ThanhTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCTHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSP]    Script Date: 11-05-2022 18:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSP](
	[MaCTSP] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[MaKT] [int] NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCTSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 11-05-2022 18:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[SoHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayBan] [datetime] NULL,
	[MaKH] [int] NULL,
	[TongTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11-05-2022 18:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](255) NOT NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[Tuoi] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](10) NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Admin] [tinyint] NULL,
	[DiaChi] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KichThuoc]    Script Date: 11-05-2022 18:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KichThuoc](
	[MaKT] [int] IDENTITY(1,1) NOT NULL,
	[TenKT] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11-05-2022 18:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](255) NOT NULL,
	[MaTH] [int] NULL,
	[GTSP] [nvarchar](max) NULL,
	[Gia] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 11-05-2022 18:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaTH] [int] IDENTITY(1,1) NOT NULL,
	[TenTH] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 11-05-2022 18:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[TenTT] [nvarchar](50) NULL,
	[MoTa] [nvarchar](100) NULL,
	[Anh] [nvarchar](50) NULL,
	[ND] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnhSP] ON 

INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (1, 1, N'nike1_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (2, 1, N'nike1_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (3, 1, N'nike1_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (4, 1, N'nike1_4.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (5, 2, N'nike2_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (6, 2, N'nike2_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (7, 2, N'nike2_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (8, 2, N'nike2_4.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (9, 3, N'nike3_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (10, 3, N'nike3_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (11, 3, N'nike3_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (12, 3, N'nike3_4.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (13, 4, N'nike4_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (14, 4, N'nike4_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (15, 4, N'nike4_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (16, 4, N'nike4_4.png')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (17, 5, N'nike5_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (18, 5, N'nike5.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (19, 5, N'nike5_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (20, 5, N'nike5_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (21, 6, N'adidas1_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (22, 6, N'adidas1_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (23, 6, N'adidas1_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (24, 6, N'adidas1_4.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (25, 7, N'adidas2_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (26, 7, N'adidas2_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (27, 7, N'adidas2_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (28, 7, N'adidas2_4.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (29, 8, N'adidas3_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (30, 8, N'adidas3_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (31, 8, N'adidas3_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (32, 8, N'adidas3_4.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (33, 9, N'jordan1_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (34, 9, N'jordan1_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (35, 9, N'jordan1_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (36, 9, N'jordan1_4.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (37, 10, N'jordan2_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (38, 10, N'jordan2_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (39, 10, N'jordan2_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (40, 10, N'jordan2_4.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (41, 11, N'biti1_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (42, 11, N'biti1_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (43, 11, N'biti1_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (44, 11, N'biti1_4.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (45, 12, N'biti2_1.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (46, 12, N'biti2_2.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (47, 12, N'biti2_3.jpg')
INSERT [dbo].[AnhSP] ([MaAnh], [MaSP], [URL]) VALUES (48, 12, N'biti2_4.jpg')
SET IDENTITY_INSERT [dbo].[AnhSP] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (1, 1, 4, 1, 2180000, 2180000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (2, 2, 1, 1, 2650000, 2650000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (3, 3, 1, 9, 2650000, 23850000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (4, 3, 11, 1, 830000, 830000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (5, 4, 10, 1, 6900000, 6900000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (6, 4, 8, 1, 1050000, 1050000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (7, 6, 10, 1, 6900000, 6900000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (8, 6, 7, 1, 2500000, 2500000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (9, 7, 8, 1, 1050000, 1050000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (10, 7, 12, 1, 961000, 961000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (11, 8, 7, 1, 2500000, 2500000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (12, 8, 4, 1, 2180000, 2180000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (13, 9, 8, 1, 1050000, 1050000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (14, 9, 7, 1, 2500000, 2500000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (15, 12, 5, 1, 5150000, 5150000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (16, 13, 2, 1, 3700000, 3700000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (17, 14, 9, 1, 5500000, 5500000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (18, 15, 2, 1, 3700000, 3700000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHDB], [SoHD], [MaSP], [SoLuong], [Gia], [ThanhTien]) VALUES (19, 16, 5, 1, 5150000, 5150000)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietSP] ON 

INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (1, 1, 1, 46)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (2, 1, 2, 34)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (3, 1, 3, 27)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (4, 1, 4, 36)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (5, 1, 5, 37)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (6, 2, 1, 37)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (7, 2, 2, 83)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (8, 2, 3, 20)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (9, 2, 4, 79)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (10, 2, 5, 24)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (11, 3, 1, 47)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (12, 3, 2, 58)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (13, 3, 3, 28)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (14, 3, 4, 85)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (15, 3, 5, 36)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (16, 4, 1, 85)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (17, 4, 2, 75)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (18, 4, 3, 57)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (19, 4, 4, 75)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (20, 4, 5, 72)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (21, 5, 1, 3)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (22, 5, 2, 58)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (23, 5, 3, 53)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (24, 5, 4, 86)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (25, 5, 5, 66)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (26, 6, 1, 47)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (27, 6, 2, 45)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (28, 6, 3, 46)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (29, 6, 4, 28)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (30, 6, 5, 57)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (31, 7, 1, 86)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (32, 7, 2, 47)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (33, 7, 3, 67)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (34, 7, 4, 4)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (35, 7, 5, 55)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (36, 8, 1, 56)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (37, 8, 2, 34)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (38, 8, 3, 56)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (39, 8, 4, 57)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (40, 8, 5, 34)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (41, 9, 1, 54)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (42, 9, 2, 56)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (43, 9, 3, 34)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (44, 9, 4, 67)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (45, 9, 5, 67)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (46, 10, 1, 24)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (47, 10, 2, 6)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (48, 10, 3, 68)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (49, 10, 4, 68)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (50, 10, 5, 23)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (51, 11, 1, 46)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (52, 11, 2, 46)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (53, 11, 3, 35)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (54, 11, 4, 67)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (55, 11, 5, 83)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (56, 12, 1, 47)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (57, 12, 2, 45)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (58, 12, 3, 57)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (59, 12, 4, 67)
INSERT [dbo].[ChiTietSP] ([MaCTSP], [MaSP], [MaKT], [SoLuong]) VALUES (60, 12, 5, 32)
SET IDENTITY_INSERT [dbo].[ChiTietSP] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (1, CAST(N'2022-05-05T21:30:51.407' AS DateTime), 1, 2180000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (2, CAST(N'2022-05-05T21:32:13.907' AS DateTime), 1, 2650000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (3, CAST(N'2022-05-09T22:25:37.533' AS DateTime), 1, 24680000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (4, CAST(N'2022-05-09T22:28:49.657' AS DateTime), 1, 7950000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (5, CAST(N'2022-05-09T22:37:05.967' AS DateTime), 2, 2461000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (6, CAST(N'2022-05-09T22:40:24.853' AS DateTime), 2, 9400000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (7, CAST(N'2022-05-09T22:48:06.553' AS DateTime), 2, 2011000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (8, CAST(N'2022-05-09T22:59:23.707' AS DateTime), 2, 4680000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (9, CAST(N'2022-05-10T13:26:41.523' AS DateTime), 3, 3550000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (12, CAST(N'2022-05-10T14:06:17.540' AS DateTime), 3, 5150000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (13, CAST(N'2022-05-10T14:09:25.277' AS DateTime), 3, 3700000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (14, CAST(N'2022-05-10T14:49:35.647' AS DateTime), 3, 5500000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (15, CAST(N'2022-05-10T14:52:27.633' AS DateTime), 3, 3700000)
INSERT [dbo].[HoaDon] ([SoHD], [NgayBan], [MaKH], [TongTien]) VALUES (16, CAST(N'2022-05-10T16:47:43.850' AS DateTime), 3, 5150000)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [GioiTinh], [Tuoi], [Email], [SDT], [TaiKhoan], [MatKhau], [Admin], [DiaChi]) VALUES (1, N'Nguyễn Thị Hoài', N'Nữ', 21, N'hoai1912@gmail.com', N'0837482747', N'hoai', N'123456', 1, N'Nam Định')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [GioiTinh], [Tuoi], [Email], [SDT], [TaiKhoan], [MatKhau], [Admin], [DiaChi]) VALUES (2, N'Phạm Thị Hiền', N'Nữ', 24, N'hien1998@gmail.com', N'0837465263', N'hien', N'123456', 0, N'Thái Bình')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [GioiTinh], [Tuoi], [Email], [SDT], [TaiKhoan], [MatKhau], [Admin], [DiaChi]) VALUES (3, N'Cam', N'Nữ', 24, N'cam1411@gmail.com', N'0937482939', N'cam', N'123456', 0, N'Nam Định')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KichThuoc] ON 

INSERT [dbo].[KichThuoc] ([MaKT], [TenKT]) VALUES (1, N'36')
INSERT [dbo].[KichThuoc] ([MaKT], [TenKT]) VALUES (2, N'37')
INSERT [dbo].[KichThuoc] ([MaKT], [TenKT]) VALUES (3, N'38')
INSERT [dbo].[KichThuoc] ([MaKT], [TenKT]) VALUES (4, N'39')
INSERT [dbo].[KichThuoc] ([MaKT], [TenKT]) VALUES (5, N'40')
SET IDENTITY_INSERT [dbo].[KichThuoc] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (1, N'Nike Fw Air Max 2090', 1, N'Giày Thể Thao Nike Fw Air Max 2090 CV8727-100 Phối Màu là đôi giày đến từ thương hiệu Nike nổi tiếng của Mỹ. Nike Fw Air Max 2090 CV8727-100 Phối Màu là phiên bản dành riêng cho phái đẹp với phối màu mang thiết kế đẹp mắt, kiểu dáng hiện đại, với đôi giày thời trang này chắc chắn bạn sẽ trở nên nổi bật và cuốn hút hơn.', 2650000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (2, N'Nike W Air Max 90', 1, N'Giày Nike W Air Max 90 195237077700 Phối Màu có thiết kế trẻ trung, năng động đến từ thương hiệu Nike nổi tiếng của Mỹ. Mẫu Nike W Air Max 90 195237077700 được làm từ chất liệu cao cấp mang lại cảm giác thoải mái khi đi lên chân.', 3700000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (3, N'Nike Air Zoom Vapor Pro', 1, N'Giày Tennis Nike Air Zoom Vapor Pro HC CZ0220-033 Màu Xám Xanh là mẫu giày tennis nhưng được thiết kế với kiểu dáng thời trang cùng gam màu thanh lịch, sang trọng. Sở hữu mẫu giày này sẽ giúp bạn thoải mái di chuyển, vận động đa hướng khi chơi thể thao.', 4500000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (4, N'Nike Court Legacy White', 1, N'Giày Nike Court Legacy White Desert Ochre CU4150-102 Màu Trắng là đôi giày thời trang có thiết kế trẻ trung, năng động đến từ thương hiệu Nike nổi tiếng của Mỹ. Giày Nike Court Legacy White Desert Ochre CU4150-102 được làm từ chất liệu cao cấp mang lại cảm giác thoải mái khi đi lên chân.', 2180000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (5, N'Nike Dunk Low Disrupt 2', 1, N'Giày Nike Dunk Low Disrupt 2 Pale Ivory DH4402-101 Màu Trắng là đôi giày thời trang có thiết kế trẻ trung, năng động đến từ thương hiệu Nike nổi tiếng của Mỹ. Nike Dunk Low Disrupt 2 Pale Ivory DH4402-101 được làm từ chất liệu cao cấp mang lại cảm giác thoải mái khi đi lên chân.', 5150000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (6, N' ADIDAS SUPERSTAR PARLEY', 2, N'Chỉ một đôi giày tập mới không thể cứu cả hành tinh. Nhưng đôi giày adidas Superstar này là một khởi đầu tuyệt vời. Trong nỗ lực chấm dứt rác thải nhựa, chúng tôi hợp tác với tổ chức Parley for the Oceans để tạo ra dây móc gót giày và dây dệt lưỡi gà có sử dụng sợi vải từ rác thải nhựa trôi nổi thu gom từ bờ biển. Ngay cả với tinh thần thay đổi cuộc chơi, vẻ ngoài và phong cách của đôi giày này cũng giữ nguyên như đôi giày đầu tiên xuất hiện trên sân bóng rổ vào thập niên 70.', 3300000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (7, N'ULTRABOOST 20 LAB', 2, N'Làm từ một nhóm chất liệu tái chế, thân giày có chứa ít nhất 50% thành phần tái chế. Sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.', 2500000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (8, N'GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO ADIDAS', 2, N'Trên sân tập, tốc độ là một thế mạnh. Trên sân đấu, đó là yếu tố quyết định. Nhanh trí. Nhanh chân. Hãy kiếm tìm nhịp điệu của bạn và bỏ lại mọi thứ phía sau. Càn quét trên từng sải bước với đôi giày đá bóng adidas X này. Thân giày bằng vải dệt mềm mại có lớp phủ cho sải bước thoải mái cùng bạn bùng nổ sức mạnh chiến đấu. Bên dưới là đế ngoài bằng cao su có đinh cho bước chân thần tốc trên sân cỏ nhân tạo.', 1050000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (9, N'Air Jordan 1 Mid', 4, N'Giày Air Jordan 1 Mid "Banned" 2020 được chính thức ra mắt vào cuối năm 2020. Sở hữu phối màu Banned, là bản remake của đôi giày từng bị cấm sử dụng trong các giải đấu bóng rổ ngày xưa, mang trên mình cả một câu chuyện góp phần giúp Air Jordan 1 trở thành huyền thoại. ', 5500000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (10, N'Jordan LeBron 19', 4, N'Mua Giày Nike LeBron 19 "Space Jam" DC9338-100 chính hãng 100% có sẵn tại Authentic Shoes. Giao hàng miễn phí trong 1 ngày. Cam kết đền tiền X5 nếu phát hiện Fake. Đổi trả miễn phí size. MUA NGAY!', 6900000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (11, N'Retro Collection Biti''s', 3, N'Không bao giờ là quá sớm để dạy cho cầu thủ tí hon của bạn về các huyền thoại bóng rổ. Bạn có thể bắt đầu với đôi giày cổ thấp adidas Forum dành cho trẻ em này. Giày có kiểu dáng hầm hố và quai chữ X đặc trưng đã tỏa sáng trên sân bóng rổ vào thập niên 80. Có lẽ cần thêm băng đô và quần short ngắn.', 830000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (12, N'Biti''''s Hunter X Cut-Out', 3, N'Trên sân tập, tốc độ là một thế mạnh. Trên sân đấu, đó là yếu tố quyết định. Nhanh trí. Nhanh chân. Hãy kiếm tìm nhịp điệu của bạn và bỏ lại mọi thứ phía sau. Càn quét trên từng sải bước với đôi giày đá bóng adidas X này. Thân giày Speedskin trong mờ giúp bạn luôn thoải mái khi bùng nổ sức mạnh chiến đấu. Bên dưới là đế ngoài bằng cao su có đinh giúp bạn bứt tốc trên mặt sân cỏ nhân tạo. Thiết kế ôm chân vừa vặn giúp bạn vững vàng trong các pha đổi hướng và xoay người để luôn nhanh hơn một bước.', 961000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (15, N'nike ari', 1, N'Chưa có giới thiệu sản phẩm', 1500000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaTH], [GTSP], [Gia]) VALUES (16, N'nike ari max', 1, N'Chưa có giới thiệu sản phẩm', 2500000)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (1, N'Nike')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (2, N'Adidas')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (3, N'Biti''s')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (4, N'Jordan')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (7, N'Thiên')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
GO
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([MaTT], [TenTT], [MoTa], [Anh], [ND]) VALUES (2, N'Vận động viên Nike Think Tank', N'Trọng tâm của cam kết của NIKE, Inc. đối với thể thao nữ là lắng nghe...', N'woman.jpg', N'Trọng tâm của cam kết của NIKE, Inc. đối với thể thao nữ là lắng nghe và học hỏi từ các vận động viên. Lấy cảm hứng từ sự cống hiến và thành tích của họ, công ty áp dụng những hiểu biết sâu sắc của họ vào các sản phẩm, dịch vụ và quan hệ đối tác nhằm tạo ra một sân chơi bình đẳng hơn. Cùng nhau, Nike và các vận động viên của mình chia sẻ tầm nhìn tôn vinh và trao quyền cho các thế hệ hiện tại và tương lai.

Để đẩy nhanh sự thay đổi từ cấp cơ sở, Nike đầu tư vào hơn 135 đối tác cộng đồng hỗ trợ phụ nữ và trẻ em gái trên toàn thế giới. Trong lĩnh vực thể thao chuyên nghiệp, Nike gần đây đã đầu tư cổ phần vào WNBA để phát triển giải đấu và tạo ra nhiều khả năng hiển thị hơn cho các vận động viên của mình.

Nuôi dưỡng các mối quan hệ có ý nghĩa hơn với các vận động viên cũng là gốc rễ của một sáng kiến ​​mới, Nike Athlete Think Tank. Ngoài việc chia sẻ kinh nghiệm và cái nhìn sâu sắc của họ, 13 vận động viên thành viên sáng lập cũng đã vận động chính sách của họ, xác định các tổ chức cộng đồng trên toàn thế giới mà NIKE, Inc., hợp tác với CAF Mỹ (Quỹ hỗ trợ từ thiện Hoa Kỳ), sẽ tài trợ 1,3 triệu đô la cho 20 tài trợ thay mặt cho họ.

Những gì chúng tôi đã nghe
Nike có một lịch sử lâu đời trong việc hỗ trợ các vận động viên nữ của mình trong và ngoài cuộc thi. Trong suốt năm qua, ban lãnh đạo Nike đã mời các vận động viên đến bàn và yêu cầu phản hồi chưa được lọc của họ. Tanya Hvizdak, Phó Chủ tịch Tiếp thị Thể thao Toàn cầu của Phụ nữ cho biết: “Chúng tôi đã mở cuộc trò chuyện để nghe những hiểu biết sâu sắc của họ và giúp thông báo rằng chúng tôi có thể trở nên tốt hơn ở đâu. “Chúng tôi đã hỏi cụ thể về cách họ tin rằng thể thao có thể đưa thế giới tiến lên, cách chúng tôi có thể giúp phá bỏ các rào cản đối với thể thao và cách chúng tôi có thể tận dụng tốt hơn những ý kiến ​​đóng góp và ý tưởng của họ”.

Nhóm các vận động viên biểu tượng, xuất sắc này bao gồm Ada Hegerberg, Angela Davis, Bebe Vio, Dina Asher-Smith, Deyna Castellanos, Ibtihaj Muhammad, Nafissatou Thiam, Sabrina Ionescu, Scout Bassett, Serena Williams, Shalane Flanagan, Shelly-Ann Fraser-Pryce và Simone Manuel. Họ nhấn mạnh khía cạnh tài chính của việc tạo cơ hội tiếp cận thể thao và tầm quan trọng của việc đưa tất cả mọi người, đặc biệt là vận động viên khuyết tật, vào các sáng kiến ​​hòa nhập. Họ nói về việc đánh giá mục đích cũng như hiệu suất, cụ thể là thông qua những nỗ lực cộng đồng có ý nghĩa. Nhiều người trong số họ đã phản ánh về những thách thức và rào cản mà họ phải đối mặt trong suốt chặng đường, thường được giảm bớt bởi các chương trình và học bổng giúp họ thành công.

Hơn nữa, tất cả phụ nữ đều yêu cầu Nike tiếp tục lắng nghe họ và quảng bá thông điệp của họ. “Để các vận động viên nữ tham gia vào những cuộc trò chuyện này là rất quan trọng đối với không chỉ sự phát triển của Nike với tư cách là một công ty mà còn đối với sự phát triển thể thao nói chung,” fencer và người từng đoạt huy chương Olympic Ibtihaj Muhammad nói.

Những gì chúng ta đã làm
Họ hỏi, và Nike đã trả lời. Công ty cam kết tiếp tục thảo luận và tạo ra Nike Athlete Think Tank, một định dạng phát triển để thu thập và lắng nghe. Điều này bao gồm việc hợp tác với CAF Mỹ để tài trợ 1,3 triệu đô la cho tổng số 20 khoản tài trợ cho các tổ chức cộng đồng trên toàn thế giới đã được xác định và phù hợp với chủ trương của mỗi vận động viên để nâng cao cảm giác thân thuộc cho phụ nữ và trẻ em gái và san bằng sân chơi cho tất cả cộng đồng .

Whitney Malkiel, VP / GM toàn cầu của Nike Women cho biết: “Chúng tôi đã khởi xướng Nike Athlete Think Tank để biến những hiểu biết sâu sắc thành hành động. “Sức mạnh lớn nhất của chúng tôi luôn là quan hệ đối tác với những vận động viên cá nhân xuất sắc nhất thế giới. Lần đầu tiên, chúng tôi đã hợp nhất một tập thể các biểu tượng nữ trải dài trên khắp các nền thể thao và quốc gia để giúp chúng tôi định hình các chiến lược giúp cải thiện trải nghiệm của tất cả trẻ em gái và phụ nữ trong thể thao. ”

Hợp tác với các vận động viên và CAF Mỹ để tài trợ cho các tổ chức cộng đồng là một phần có ý nghĩa trong sứ mệnh của Nike Athlete Think Tank và giúp họ thấy được sự thay đổi đang diễn ra trong sân sau của họ. Hvizdak nói: “Các lựa chọn vận động viên được thực hiện để trả lại ở đâu đều rất cá nhân. “Serena Williams đã xác định các Câu lạc bộ Nam và Nữ của Quận Palm Beach, trong khi Shelly-Ann Fraser-Pryce đề xuất Quỹ Tên lửa Bỏ túi của cô ấy có trụ sở tại Kingston, Jamaica. Sabrina Ionescu làm nổi bật Tổ chức thể thao Mamba & Mambacita, và Shalane Flanagan làm nổi bật cả Marathon Kids và Amputee Blade Runners. ”

Công việc không dừng lại ở đây. Nike có kế hoạch tiếp tục Nike Athlete Think Tank bằng cách mời nhiều phụ nữ hơn từ danh sách của họ, mở rộng cơ hội tạo ra tác động lâu dài, có thể hành động và tạo ra một không gian dành riêng cho công ty để lắng nghe và học hỏi. Hvizdak nói: “Sức mạnh của cộng đồng, sức mạnh của khả năng thể hiện năng lượng tích cực và sức mạnh của việc lắng nghe vận động viên và cách điều đó có thể đưa thương hiệu của chúng tôi phát triển - điều đó không thể nói quá”.

Và sức mạnh đó không bị mất đối với các vận động viên. Người chạy và huấn luyện viên Angela Davis nói: “Ở trong môi trường đó thực sự giúp tôi phấn khích, kéo dài quá trình suy nghĩ và cho tôi năng lượng để tiếp tục thực hiện công việc. “Tôi cảm thấy như khi tôi đến đây với Nike, tôi được nhìn thấy và nghe thấy,” vận động viên chạy nước rút và giành huy chương Olympic Shelly-Ann Fraser-Pryce nói. “Chúng ta có thể nắm tay nhau và cùng nhau đi tiếp hành trình này bởi vì đó là tất cả những gì của nó. Nó không chỉ là giành huy chương và phá kỷ lục; đó là về những thứ được thực hiện vì những quan hệ đối tác này để mang lại lợi ích cho những người khác.'')
')
INSERT [dbo].[TinTuc] ([MaTT], [TenTT], [MoTa], [Anh], [ND]) VALUES (3, N'Nike hợp tác với Bryant', N'Phiên bản Kobe mới đầu tiên, Kobe 6 Protro “Mambacita Sweet 16” sẽ...', N'kobe.jpg', N'Phiên bản Kobe mới đầu tiên, Kobe 6 Protro “Mambacita Sweet 16” sẽ tôn vinh Gigi Bryant. Tất cả số tiền thu được từ chiếc giày sẽ mang lại lợi ích cho Tổ chức Thể thao Mamba và Mambacita. Thông tin phát hành sẽ được chia sẻ vào một ngày sau đó.

Vanessa Bryant nói: “Tôi rất vui khi thông báo rằng chúng tôi sẽ tiếp nối di sản của chồng tôi với Nike và mong muốn mở rộng tầm ảnh hưởng toàn cầu của anh ấy và Gigi bằng cách chia sẻ Mamba Mentality với các vận động viên trẻ trong nhiều thế hệ sau”.

Là một phần của quan hệ đối tác mới, Vanessa và Nike sẽ cùng nhau thành lập một trung tâm bóng rổ trẻ ở Nam California và Nike và gia đình Bryant sẽ tiếp tục trang bị cho các vận động viên NBA và WNBA mang di sản của Mamba Mentality.'')
')
INSERT [dbo].[TinTuc] ([MaTT], [TenTT], [MoTa], [Anh], [ND]) VALUES (4, N'Jordan Brand chào mừng Đại học Ateneo', N'Bắt đầu từ tháng 3 năm 2022, Jordan Brand sẽ trở thành nhà tài trợ...', N'daihoc.jpg', N'Bắt đầu từ tháng 3 năm 2022, Jordan Brand sẽ trở thành nhà tài trợ trang phục thể thao chính thức cho các đội bóng rổ nam, nữ và trung học của Đại học Ateneo de Manila của Philippines.
Ateneo de Manila là chương trình đại học được tài trợ đầu tiên của Jordan Brand ở Đông Nam Á và là chương trình duy nhất bên ngoài Hoa Kỳ. 
Jordan Brand cam kết thúc đẩy công bằng cho phụ nữ và củng cố cộng đồng thông qua đầu tư vào thanh niên.
Jordan Brand hoan nghênh Đại học Ateneo de Manila là trường đại học đầu tiên ở Đông Nam Á trong Gia đình các Chương trình Cao đẳng. 

Bắt đầu từ tháng 3 năm 2022, trong mùa giải thứ 84  của Hiệp hội Vận động viên Đại học Philippines (UAAP), đồng phục của Ateneo Blue Eagles sẽ có biểu tượng Jumpman và thông qua quan hệ đối tác, thương hiệu sẽ cung cấp cho đội bóng rổ nữ Blue Eagles tại Ateneo đồng phục phù hợp với phụ nữ. 

Đại học Ateneo de Manila, tọa lạc tại thành phố Quezon, Philippines, tìm cách thể hiện, làm phong phú và nâng cao người dân Philippines và văn hóa Philippines cũng như đóng góp vào sự phát triển của quốc gia. Trường đại học được biết đến với thành tích trong các môn thể thao của trường đại học. Đội bóng rổ nam của Ateneo Blue Eagles đã giành được 11 chức vô địch trong giải đấu trường đại học hàng đầu của quốc gia, UAAP, kể từ khi gia nhập vào năm 1978. Đội bóng rổ nữ của Blue Eagles đã có hai danh hiệu UAAP và năm trận chung kết. Ateneo cũng nổi tiếng với di sản của những thành viên hàng đầu của nó, chẳng hạn như cựu sinh viên Ateneo Kiefer Ravena, vận động viên Philippines đầu tiên của Jordan Brand và UAAP MVP hai lần. 

Chủ tịch Jordan Brand, Craig Williams, cho biết: “Thật thú vị khi công bố mối quan hệ đối tác đại học duy nhất của Jordan Brand bên ngoài Bắc Mỹ, bởi vì có rất ít nơi trên thế giới thể hiện văn hóa bóng rổ như ở Manila”. “Đầu tư vào những người trẻ tuổi là rất quan trọng và hợp tác với Đại học Ateneo de Manila, chúng tôi có thể truyền cảm hứng cho những người trẻ tuổi thông qua tình yêu chung của chúng tôi đối với trò chơi.” 

Kiefer Ravena, người bảo vệ điểm cho đội tuyển bóng rổ nam quốc gia Philippines, cho biết mối quan hệ hợp tác là một bước đi đúng hướng, cho biết: “Sự phát triển của gia đình Jordan từ một vận động viên thành một đội cho thấy cam kết của thương hiệu trong việc xây dựng một cộng đồng ở Philippines và cam kết đầu tư lâu dài cho giới trẻ,” Ravena nói.'')
')
INSERT [dbo].[TinTuc] ([MaTT], [TenTT], [MoTa], [Anh], [ND]) VALUES (5, N'Michael Jordan và Jordan Brand mời', N'Michael Jordan và Jordan Brand đang tìm kiếm đơn đăng ký từ các tổ chức...', N'moi.png', N'Michael Jordan và Jordan Brand đang tìm kiếm đơn đăng ký từ các tổ chức phi lợi nhuận đủ điều kiện cho Chương trình tài trợ cộng đồng của họ, hiện đã là năm thứ hai và là một phần của cam kết 10 năm, trị giá 100 triệu đô la cho cộng đồng Da đen.
Cổng ứng dụng sẽ mở vào ngày sinh nhật của Michael Jordan, thứ Năm, ngày 17 tháng 2 năm 2022 và đóng vào thứ năm, ngày 17 tháng 3 năm 2022.
Các khoản tài trợ sẽ hỗ trợ và trao quyền cho các tổ chức giải quyết công bằng kinh tế, giáo dục, thay đổi tường thuật và công bằng xã hội cho cộng đồng Da đen.
Là một phần của cam kết 10 năm, trị giá 100 triệu đô la cho Cộng đồng người da đen , Michael Jordan và Jordan Brand thông báo mở chu kỳ Tài trợ cộng đồng thứ hai của họ, cung cấp 1,25 triệu đô la cho các tổ chức cơ sở, địa phương đang tạo ra tương lai công bằng hơn cho người Mỹ da đen.

Cổng ứng dụng sẽ mở trong 30 ngày, bắt đầu vào ngày sinh nhật của Michael Jordan, thứ Năm, ngày 17 tháng 2 năm 2022 và đóng vào thứ năm, ngày 17 tháng 3 năm 2022.

Để đăng ký tài trợ, các tổ chức phải đáp ứng các tiêu chí sau: Là tổ chức phi lợi nhuận có trạng thái miễn thuế theo điều 501 (c) (3) đã được thành lập từ năm 2019 trở về trước; có ngân sách hoạt động hàng năm từ $ 100.000 đến $ 3 triệu; vì chương trình này nằm trong Cam kết cộng đồng da đen của Jordan Brand, các tổ chức phải có sứ mệnh phù hợp với ít nhất một trong bốn lĩnh vực trọng tâm chính. Chúng bao gồm:

Công bằng kinh tế: Xây dựng sự giàu có của thế hệ trong các cộng đồng Da đen thông qua hiểu biết về tài chính, khả năng tiếp cận vốn và củng cố sự thành công của doanh nhân Da đen.

Giáo dục: Giúp các trường học điều chỉnh chương trình giảng dạy và đa dạng hóa đội ngũ nhân viên để trang bị và hỗ trợ tốt hơn các nhu cầu của học sinh BIPOC. Thu hút các nỗ lực cải cách giáo dục nhằm ngăn chặn sự phân biệt đối xử.

Thay đổi tường thuật: Nâng cao nhận thức về vai trò của chủng tộc trong lịch sử của chúng ta để hiểu sâu hơn về hậu quả của phân biệt chủng tộc trong cuộc sống hàng ngày của chúng ta.

Công bằng xã hội: Xây dựng vốn chính trị và xã hội trong cộng đồng Da đen bằng cách đầu tư và vận động cho cải cách chính sách.

Truy cập cổng đăng ký của Chương trình Tài trợ Cộng đồng và đọc hướng dẫn về cách  hoàn thành bài nộp của bạn tại đây .

Chương trình tài trợ cộng đồng tiếp tục tầm nhìn dài hạn cho Cam kết cộng đồng người da đen do Michael Jordan và Jordan Brand đặt ra bắt đầu từ mùa hè năm 2020. Tháng 9 năm ngoái,  các khoản quyên góp với tổng trị giá 1 triệu đô la đã được trao cho 18 tổ chức cơ sở  có vị trí duy nhất để xây dựng công bằng chủng tộc ở các vùng lân cận trên khắp Hoa Kỳ

')
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
GO
ALTER TABLE [dbo].[AnhSP]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([MaCTSP])
REFERENCES [dbo].[ChiTietSP] ([MaCTSP])
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([SoHD])
REFERENCES [dbo].[HoaDon] ([SoHD])
GO
ALTER TABLE [dbo].[ChiTietSP]  WITH CHECK ADD FOREIGN KEY([MaKT])
REFERENCES [dbo].[KichThuoc] ([MaKT])
GO
ALTER TABLE [dbo].[ChiTietSP]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaTH])
REFERENCES [dbo].[ThuongHieu] ([MaTH])
GO
