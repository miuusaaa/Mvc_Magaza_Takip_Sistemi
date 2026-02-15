USE [master]
GO
/****** Object:  Database [MagazaUrunStokMVC]    Script Date: 15.02.2026 14:44:29 ******/
CREATE DATABASE [MagazaUrunStokMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MagazaUrunStokMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MagazaUrunStokMVC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MagazaUrunStokMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MagazaUrunStokMVC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MagazaUrunStokMVC] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MagazaUrunStokMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MagazaUrunStokMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET RECOVERY FULL 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET  MULTI_USER 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MagazaUrunStokMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MagazaUrunStokMVC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MagazaUrunStokMVC', N'ON'
GO
ALTER DATABASE [MagazaUrunStokMVC] SET QUERY_STORE = ON
GO
ALTER DATABASE [MagazaUrunStokMVC] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MagazaUrunStokMVC]
GO
/****** Object:  Table [dbo].[ADMIN_GIRIS]    Script Date: 15.02.2026 14:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN_GIRIS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kullanici] [varchar](20) NULL,
	[sifre] [varchar](20) NULL,
 CONSTRAINT [PK_ADMIN_GIRIS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KATEGORILER]    Script Date: 15.02.2026 14:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KATEGORILER](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [varchar](50) NOT NULL,
	[durum] [bit] NULL,
 CONSTRAINT [PK_KATEGORILER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MUSTERILER]    Script Date: 15.02.2026 14:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MUSTERILER](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [varchar](30) NULL,
	[soyad] [varchar](30) NULL,
	[sehir] [varchar](15) NULL,
	[bakiye] [decimal](18, 2) NULL,
	[durum] [bit] NULL,
 CONSTRAINT [PK_MUSTERILER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONELLER]    Script Date: 15.02.2026 14:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONELLER](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [varchar](50) NULL,
	[soyad] [varchar](50) NULL,
	[departman] [varchar](30) NULL,
	[durum] [bit] NULL,
 CONSTRAINT [PK_PERSONELLER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SATISLAR]    Script Date: 15.02.2026 14:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SATISLAR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[urun] [int] NULL,
	[personel] [int] NULL,
	[musteri] [int] NULL,
	[fiyat] [decimal](18, 2) NULL,
	[tarih] [datetime] NOT NULL,
 CONSTRAINT [PK_SATISLAR] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URUNLER]    Script Date: 15.02.2026 14:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URUNLER](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [varchar](50) NOT NULL,
	[marka] [varchar](50) NULL,
	[stok] [int] NULL,
	[alisfiyat] [decimal](18, 2) NULL,
	[satisfiyat] [decimal](18, 2) NULL,
	[kategori] [int] NULL,
	[durum] [bit] NULL,
 CONSTRAINT [PK_URUNLER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMIN_GIRIS] ON 

INSERT [dbo].[ADMIN_GIRIS] ([id], [kullanici], [sifre]) VALUES (1, N'omer', N'demir')
INSERT [dbo].[ADMIN_GIRIS] ([id], [kullanici], [sifre]) VALUES (2, N'enis', N'kaman')
SET IDENTITY_INSERT [dbo].[ADMIN_GIRIS] OFF
GO
SET IDENTITY_INSERT [dbo].[KATEGORILER] ON 

INSERT [dbo].[KATEGORILER] ([id], [ad], [durum]) VALUES (1, N'Beyaz Eşya', 1)
INSERT [dbo].[KATEGORILER] ([id], [ad], [durum]) VALUES (2, N'Bilgisayar', 1)
INSERT [dbo].[KATEGORILER] ([id], [ad], [durum]) VALUES (3, N'Telefon', 1)
INSERT [dbo].[KATEGORILER] ([id], [ad], [durum]) VALUES (4, N'Küçük Ev Aleti', 1)
INSERT [dbo].[KATEGORILER] ([id], [ad], [durum]) VALUES (12, N'Kozmetik', 1)
INSERT [dbo].[KATEGORILER] ([id], [ad], [durum]) VALUES (13, N'Temizlik', 1)
SET IDENTITY_INSERT [dbo].[KATEGORILER] OFF
GO
SET IDENTITY_INSERT [dbo].[MUSTERILER] ON 

INSERT [dbo].[MUSTERILER] ([id], [ad], [soyad], [sehir], [bakiye], [durum]) VALUES (1, N'ÖMER', N'DEMİR', N'ANKARA', CAST(20000.87 AS Decimal(18, 2)), 1)
INSERT [dbo].[MUSTERILER] ([id], [ad], [soyad], [sehir], [bakiye], [durum]) VALUES (2, N'SELIM', N'JOIN', N'İZMIR', CAST(51200.65 AS Decimal(18, 2)), 1)
INSERT [dbo].[MUSTERILER] ([id], [ad], [soyad], [sehir], [bakiye], [durum]) VALUES (3, N'SINAN', N'OZCELİK', N'SAKARYA', CAST(10.48 AS Decimal(18, 2)), 1)
INSERT [dbo].[MUSTERILER] ([id], [ad], [soyad], [sehir], [bakiye], [durum]) VALUES (4, N'MERYEM', N'AKHAN', N'İZMİT', CAST(434234.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[MUSTERILER] ([id], [ad], [soyad], [sehir], [bakiye], [durum]) VALUES (5, N'LEMAN', N'AKHAN', N'UŞAK', CAST(6777.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[MUSTERILER] ([id], [ad], [soyad], [sehir], [bakiye], [durum]) VALUES (31, N'BURCU', N'ÖZKAN', N'İZMİR', CAST(5453.76 AS Decimal(18, 2)), 1)
INSERT [dbo].[MUSTERILER] ([id], [ad], [soyad], [sehir], [bakiye], [durum]) VALUES (32, N'JALE', N'BERDEN', N'TEKİRDAĞ', CAST(4534.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[MUSTERILER] ([id], [ad], [soyad], [sehir], [bakiye], [durum]) VALUES (33, N'ELİF', N'ÇIĞACI', N'YOZGAT', CAST(3434565.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[MUSTERILER] ([id], [ad], [soyad], [sehir], [bakiye], [durum]) VALUES (34, N'BETÜL', N'ÇINAR', N'KOCAELİ', CAST(1003254.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[MUSTERILER] ([id], [ad], [soyad], [sehir], [bakiye], [durum]) VALUES (35, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[MUSTERILER] OFF
GO
SET IDENTITY_INSERT [dbo].[PERSONELLER] ON 

INSERT [dbo].[PERSONELLER] ([id], [ad], [soyad], [departman], [durum]) VALUES (1, N'Kerem', N'Sezgin', N'Youtube', 1)
INSERT [dbo].[PERSONELLER] ([id], [ad], [soyad], [departman], [durum]) VALUES (2, N'Ömer', N'Demir', N'Yazılım', 1)
INSERT [dbo].[PERSONELLER] ([id], [ad], [soyad], [departman], [durum]) VALUES (3, N'Nazlı', N'Aydın', N'Satış', 1)
SET IDENTITY_INSERT [dbo].[PERSONELLER] OFF
GO
SET IDENTITY_INSERT [dbo].[SATISLAR] ON 

INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (2, 1, 2, 4, CAST(7400.38 AS Decimal(18, 2)), CAST(N'2010-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (10, 23, 1, 2, CAST(43.00 AS Decimal(18, 2)), CAST(N'2026-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (11, 2, 1, 32, CAST(323.43 AS Decimal(18, 2)), CAST(N'2026-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (12, 3, 1, 2, CAST(32.30 AS Decimal(18, 2)), CAST(N'2026-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (13, 21, 2, 4, CAST(53423.98 AS Decimal(18, 2)), CAST(N'2026-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (14, 2, 1, 32, CAST(31232.00 AS Decimal(18, 2)), CAST(N'2026-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (15, 1, 1, 2, CAST(43.60 AS Decimal(18, 2)), CAST(N'2026-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (16, 22, 3, 5, CAST(323.00 AS Decimal(18, 2)), CAST(N'2026-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (17, 3, 1, 3, CAST(34243.00 AS Decimal(18, 2)), CAST(N'2026-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (18, 22, 1, 34, CAST(4334343.56 AS Decimal(18, 2)), CAST(N'2026-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (19, 22, 3, 3, CAST(4234.00 AS Decimal(18, 2)), CAST(N'2026-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (20, 2, 3, 34, CAST(4234234.00 AS Decimal(18, 2)), CAST(N'2026-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (21, 1, 2, 32, CAST(4234.00 AS Decimal(18, 2)), CAST(N'2026-02-13T18:15:23.430' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (22, 3, 1, 3, CAST(3213.00 AS Decimal(18, 2)), CAST(N'2026-02-13T18:20:04.573' AS DateTime))
INSERT [dbo].[SATISLAR] ([id], [urun], [personel], [musteri], [fiyat], [tarih]) VALUES (23, 1, 1, 4, CAST(321331323.00 AS Decimal(18, 2)), CAST(N'2026-02-13T18:22:47.120' AS DateTime))
SET IDENTITY_INSERT [dbo].[SATISLAR] OFF
GO
SET IDENTITY_INSERT [dbo].[URUNLER] ON 

INSERT [dbo].[URUNLER] ([id], [ad], [marka], [stok], [alisfiyat], [satisfiyat], [kategori], [durum]) VALUES (1, N'Buzdolabı', N'Arçelik', 100, CAST(3500.00 AS Decimal(18, 2)), CAST(3850.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[URUNLER] ([id], [ad], [marka], [stok], [alisfiyat], [satisfiyat], [kategori], [durum]) VALUES (2, N'Çamaşır Makinesi', N'Vestel', 85, CAST(1250.00 AS Decimal(18, 2)), CAST(1700.25 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[URUNLER] ([id], [ad], [marka], [stok], [alisfiyat], [satisfiyat], [kategori], [durum]) VALUES (3, N'Laptop', N'Toshiba', 1, CAST(3100.01 AS Decimal(18, 2)), CAST(3700.19 AS Decimal(18, 2)), 2, 1)
INSERT [dbo].[URUNLER] ([id], [ad], [marka], [stok], [alisfiyat], [satisfiyat], [kategori], [durum]) VALUES (21, N'MOUSE', N'Geehz', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 4, 1)
INSERT [dbo].[URUNLER] ([id], [ad], [marka], [stok], [alisfiyat], [satisfiyat], [kategori], [durum]) VALUES (22, N'No-Frost ', N'Bosch', 9, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 3, 1)
INSERT [dbo].[URUNLER] ([id], [ad], [marka], [stok], [alisfiyat], [satisfiyat], [kategori], [durum]) VALUES (23, N'TULPAR', N'Monster', 4, CAST(33334.00 AS Decimal(18, 2)), CAST(3323.54 AS Decimal(18, 2)), 3, 1)
SET IDENTITY_INSERT [dbo].[URUNLER] OFF
GO
ALTER TABLE [dbo].[URUNLER] ADD  CONSTRAINT [DF_URUNLER_durum]  DEFAULT ((1)) FOR [durum]
GO
ALTER TABLE [dbo].[SATISLAR]  WITH CHECK ADD  CONSTRAINT [FK_SATISLAR_MUSTERILER] FOREIGN KEY([musteri])
REFERENCES [dbo].[MUSTERILER] ([id])
GO
ALTER TABLE [dbo].[SATISLAR] CHECK CONSTRAINT [FK_SATISLAR_MUSTERILER]
GO
ALTER TABLE [dbo].[SATISLAR]  WITH CHECK ADD  CONSTRAINT [FK_SATISLAR_PERSONELLER] FOREIGN KEY([personel])
REFERENCES [dbo].[PERSONELLER] ([id])
GO
ALTER TABLE [dbo].[SATISLAR] CHECK CONSTRAINT [FK_SATISLAR_PERSONELLER]
GO
ALTER TABLE [dbo].[SATISLAR]  WITH CHECK ADD  CONSTRAINT [FK_SATISLAR_URUNLER] FOREIGN KEY([urun])
REFERENCES [dbo].[URUNLER] ([id])
GO
ALTER TABLE [dbo].[SATISLAR] CHECK CONSTRAINT [FK_SATISLAR_URUNLER]
GO
ALTER TABLE [dbo].[URUNLER]  WITH CHECK ADD  CONSTRAINT [FK_URUNLER_KATEGORILER] FOREIGN KEY([kategori])
REFERENCES [dbo].[KATEGORILER] ([id])
GO
ALTER TABLE [dbo].[URUNLER] CHECK CONSTRAINT [FK_URUNLER_KATEGORILER]
GO
USE [master]
GO
ALTER DATABASE [MagazaUrunStokMVC] SET  READ_WRITE 
GO

