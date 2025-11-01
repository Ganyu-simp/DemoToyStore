USE [master]
GO
/****** Object:  Database [ToyStore]    Script Date: 11/1/2025 3:50:42 PM ******/
CREATE DATABASE [ToyStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToyStore', FILENAME = N'D:\SSEI\MSSQL16.MSSQLSERVER\MSSQL\DATA\ToyStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToyStore_log', FILENAME = N'D:\SSEI\MSSQL16.MSSQLSERVER\MSSQL\DATA\ToyStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ToyStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToyStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToyStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToyStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToyStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToyStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToyStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToyStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToyStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToyStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToyStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToyStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToyStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToyStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToyStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToyStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToyStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ToyStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToyStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToyStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToyStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToyStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToyStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToyStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToyStore] SET RECOVERY FULL 
GO
ALTER DATABASE [ToyStore] SET  MULTI_USER 
GO
ALTER DATABASE [ToyStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToyStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToyStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToyStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToyStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ToyStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ToyStore', N'ON'
GO
ALTER DATABASE [ToyStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [ToyStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ToyStore]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/1/2025 3:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](50) NULL,
	[pass] [varchar](50) NULL,
	[isSell] [bit] NULL,
	[isAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/1/2025 3:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/1/2025 3:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/1/2025 3:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[oid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NOT NULL,
	[customer] [nvarchar](100) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phonenum] [varchar](20) NULL,
	[orderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/1/2025 3:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
	[price] [float] NOT NULL,
	[title] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[categoryID] [int] NULL,
	[sellID] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 11/1/2025 3:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seller](
	[sellID] [int] IDENTITY(1,1) NOT NULL,
	[shopName] [nvarchar](100) NULL,
	[inventoryCount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (1, N'Alice', N'123456', 1, 0)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (2, N'Bob', N'QWE123', 1, 0)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (3, N'Charlie', N'ABC456', 1, 0)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (4, N'Diana', N'XYZ789', 0, 0)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (5, N'Evan', N'LMN456', 0, 0)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (6, N'Fay', N'HELLO1', 0, 1)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (7, N'George', N'PASS77', 0, 0)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (8, N'Helen', N'PASS88', 0, 0)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (9, N'Ian', N'SELLER', 1, 0)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (10, N'Jane', N'ADMINX', 0, 1)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (11, N'admin', N'123', 0, 0)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (14, N'shirosama2005@gmail.com', N'1234', 0, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (1, N'Educational Toys')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (2, N'Electronic Toys')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (3, N'Dolls and Figures')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (4, N'Legos')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (5, N'Outdoor Toys')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (6, 3, 38, N'Math Learning Kit', 2, 199.99)
INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (7, 3, 41, N'LEGO Star Wars', 1, 799.5)
INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (8, 3, 42, N'Kids Slide', 3, 1200)
INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (9, 4, 38, N'Math Learning Kit', 1, 199.99)
INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (10, 5, 38, N'Math Learning Kit', 1, 199.99)
INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (11, 6, 38, N'Math Learning Kit', 2, 199.99)
INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (12, 7, 38, N'Math Learning Kit', 1, 200)
INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (13, 7, 58, N'Wooden puzzler', 1, 200)
INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (14, 8, 38, N'Math Learning Kit', 1, 200)
INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (15, 8, 39, N'RC Drone', 1, 1000)
INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (16, 8, 42, N'Kids Slide', 1, 1200)
INSERT [dbo].[OrderDetails] ([id], [oid], [pid], [name], [quantity], [price]) VALUES (17, 8, 57, N'Sandbox Play Kit', 1, 450)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([oid], [uid], [customer], [address], [phonenum], [orderDate]) VALUES (3, 1, N'ganyu simp', N'Ngõ 639 Bạch Đằng', N'0347819367', CAST(N'2025-07-18T08:35:09.673' AS DateTime))
INSERT [dbo].[Orders] ([oid], [uid], [customer], [address], [phonenum], [orderDate]) VALUES (4, 6, N'ganyu simp', N'Ngõ 639 Bạch Đằng', N'0347819367', CAST(N'2025-07-18T09:51:23.727' AS DateTime))
INSERT [dbo].[Orders] ([oid], [uid], [customer], [address], [phonenum], [orderDate]) VALUES (5, 6, N'Fay', N'Ngõ 639 Bạch Đằng', N'0347819367', CAST(N'2025-07-18T09:53:55.120' AS DateTime))
INSERT [dbo].[Orders] ([oid], [uid], [customer], [address], [phonenum], [orderDate]) VALUES (6, 6, N'Fay', N'Ngõ 639 Bạch Đằng', N'0347819367', CAST(N'2025-07-18T09:54:23.323' AS DateTime))
INSERT [dbo].[Orders] ([oid], [uid], [customer], [address], [phonenum], [orderDate]) VALUES (7, 7, N'Fay', N'Ngõ 639 Bạch Đằng', N'0347819367', CAST(N'2025-07-18T11:44:58.463' AS DateTime))
INSERT [dbo].[Orders] ([oid], [uid], [customer], [address], [phonenum], [orderDate]) VALUES (8, 6, N'ganyu simp', N'Ngõ 639 Bạch Đằng', N'0347819367', CAST(N'2025-08-04T17:22:20.937' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (38, N'Math Learning Kit', N'https://www.cubelelo.com/cdn/shop/products/40010422_1200x.png?v=1679482831', 200, N'Fun with numbers', N'This set helps kids learn basic math concepts.', 1, 1, 44)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (39, N'RC Drone', N'https://m.media-amazon.com/images/I/71t3NOL3NAL.jpg', 1000, N'High-tech flying fun', N'A compact drone with HD camera and remote control.', 2, 2, 19)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (40, N'Princess Doll Set', N'https://m.media-amazon.com/images/I/71VxwFUfqxL._UF894,1000_QL80_.jpg', 300, N'Royal adventures await', N'A beautiful set of dolls with dresses and accessories.', 3, 1, 40)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (41, N'LEGO Star Wars', N'https://i1.haypley.vn/2023/11/07/lego-star-wars-75360-phi-thuyen-chien-dau-jedi-cua-yoda-685cab.jpg', 800, N'Build your galaxy', N'Star Wars-themed LEGO set with over 1000 pieces.', 4, 3, 30)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (42, N'Kids Slide', N'https://m.media-amazon.com/images/I/71KlHJNNv0L._UF1000,1000_QL80_.jpg', 1200, N'Outdoor fun guaranteed', N'A safe and colorful slide for garden or yard play.', 5, 2, 14)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (43, N'Alphabet Puzzle', N'https://vietcanbooks.com/cdn/shop/files/vietnamese-alphabet-lower-case-puzzle-vietcanbooks.png?v=1689166766', 130, N'Learn the ABCs', N'Wooden alphabet puzzle to boost cognitive skills.', 1, 2, 60)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (44, N'Robot Dog', N'https://m.media-amazon.com/images/I/61aLnSfQfJL._UF894,1000_QL80_.jpg', 500, N'Your new best friend', N'An interactive electronic puppy with sound & motion.', 2, 1, 25)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (45, N'Action Hero Figure (A)', N'https://images-na.ssl-images-amazon.com/images/I/81T5Y44uX4L.jpg', 200, N'Heroic missions', N'Poseable figure with weapons and armor accessories.', 3, 3, 35)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (46, N'LEGO City Set A', N'https://m.media-amazon.com/images/I/71+Myrs7IDL._UF894,1000_QL80_.jpg', 650, N'Build your city', N'A city-themed LEGO set including vehicles and buildings.', 4, 1, 22)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (47, N'Trampoline', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRAZDXdJBzf2I3DXGQSVM_RilRnvEMMx6rVg&s', 2500, N'Jump and play', N'Large outdoor trampoline with safety net for kids.', 5, 3, 10)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (48, N'Magic Alphabet Blocks', N'https://m.media-amazon.com/images/I/71RWwhMBkDL._UF894,1000_QL80_.jpg', 150, N'Educational wooden blocks', N'Enhance your child''s literacy skills with colorful wooden blocks.', 1, 1, 20)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (49, N'Math Puzzle Set', N'https://i5.walmartimages.com/asr/7564975b-4388-4357-958c-47eda5a44cf1.f0a06c930b07bc4db1c2b43e6b24f207.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF', 120, N'Fun with numbers', N'Engage children in early math with interactive puzzles.', 1, 2, 15)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (50, N'RC Racing Car', N'https://m.media-amazon.com/images/I/71c-9SYk3pL.jpg', 350, N'Fast remote control car', N'High-speed car with rechargeable battery and LED lights.', 2, 1, 10)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (51, N'Gaming Robot', N'https://m.media-amazon.com/images/I/61g7XYIud6L._UF1000,1000_QL80_FMwebp_.jpg', 500, N'Smart robot toy', N'Voice-activated robot with dancing and music features.', 2, 3, 12)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (52, N'Princess Doll', N'https://tse3.mm.bing.net/th/id/OIP.hLnwAdeV-zq0-9MMI33n1gHaIV?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', 200, N'Beautiful princess figure', N'Collectible princess doll with detailed dress and accessories.', 3, 2, 25)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (53, N'Action Hero Figure(B)', N'https://images-na.ssl-images-amazon.com/images/I/91LgH-8UzdL.jpg', 180, N'Superhero toy', N'Poseable action figure with weapon accessories.', 3, 3, 30)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (54, N'Lego City Set B', N'https://lh3.googleusercontent.com/pw/AIL4fc-7mJfvrvGa-X3_DsqQA0PGeU9tfUMv9FUDiby5K8NutJQvVdcMiY_vIFxev1AMkxsBJyvMlQqi489unmK9IxjIjk7ooAwuyWhtQprV1ZlYnJ5Hp7GdNDfQIgF8WahtLivmUtrrWlb6uNocc6_iyfM=w627-h657-s-no-rw', 600, N'City construction set', N'Build roads, cranes, and vehicles with 500+ Lego pieces.', 4, 1, 18)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (55, N'Lego Starship', N'https://rocketbricks.space/cdn/shop/files/Thumbnail_Starship_30_Booster_12_2.png?v=1735825381&width=1946', 750, N'Space battle Lego set', N'Epic interstellar Lego set for imaginative play.', 4, 2, 10)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (56, N'Kids Slide Set', N'https://m.media-amazon.com/images/I/71yQ3JwCm2L._UF894,1000_QL80_.jpg', 800, N'Colorful plastic slide', N'Durable outdoor slide perfect for garden fun.', 5, 2, 8)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (57, N'Sandbox Play Kit', N'https://m.media-amazon.com/images/I/81YYoIOCSaL._UF894,1000_QL80_.jpg', 450, N'Outdoor sand toys', N'Includes bucket, shovel, molds, and mini truck.', 5, 3, 13)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (58, N'Wooden puzzler', N'https://images-cdn.ubuy.co.in/6625d4ea35e9fc399a0bd0e6-yilloog-12-pcs-wooden-puzzles-set-brain.jpg', 200, NULL, N'Yilloog 12 Pcs Wooden Puzzles Set Brain Teasers and Educational Games 3D Wood Puzzle to Challenging Puzzles for Adults and Brain Games for Kids Living Roo', 1, 1, -1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [categoryID], [sellID], [quantity]) VALUES (60, N'bapcai', N'https://th.bing.com/th/id/OIP.GjDNsYPxy0vy4FvDHtZlZQHaEI?w=281&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 12, N'Bap cai xanh la cay', N'nhua an toan cho be', 5, 1, 45)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Seller] ON 

INSERT [dbo].[Seller] ([sellID], [shopName], [inventoryCount]) VALUES (1, N'Toy World', 120)
INSERT [dbo].[Seller] ([sellID], [shopName], [inventoryCount]) VALUES (2, N'Happy Kids', 85)
INSERT [dbo].[Seller] ([sellID], [shopName], [inventoryCount]) VALUES (3, N'MiniPlay Store', 150)
SET IDENTITY_INSERT [dbo].[Seller] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([oid])
REFERENCES [dbo].[Orders] ([oid])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([uid])
REFERENCES [dbo].[Account] ([uid])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([sellID])
REFERENCES [dbo].[Seller] ([sellID])
GO
USE [master]
GO
ALTER DATABASE [ToyStore] SET  READ_WRITE 
GO
