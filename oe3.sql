
GO
/****** Object:  Database [OOPEZZ_DB]    Script Date: 28/04/2020 7:05:44 CH ******/
CREATE DATABASE [OOPEZZ_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OOPEZZ_DB', FILENAME = N'E:\SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OOPEZZ_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OOPEZZ_DB_log', FILENAME = N'E:\SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OOPEZZ_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OOPEZZ_DB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OOPEZZ_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OOPEZZ_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OOPEZZ_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OOPEZZ_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OOPEZZ_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OOPEZZ_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OOPEZZ_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OOPEZZ_DB] SET  MULTI_USER 
GO
ALTER DATABASE [OOPEZZ_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OOPEZZ_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OOPEZZ_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OOPEZZ_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OOPEZZ_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OOPEZZ_DB] SET QUERY_STORE = OFF
GO
USE [OOPEZZ_DB]
GO
/****** Object:  Table [dbo].[ANSWER]    Script Date: 28/04/2020 7:05:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ANSWER](
	[PK_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[ANSWER_TEXT] [nvarchar](max) NULL,
	[ANSWER_USER_FK] [int] NULL,
	[QUESTION_FK] [int] NULL,
	[STATUS] [int] NULL,
 CONSTRAINT [PK_ANSWER] PRIMARY KEY CLUSTERED 
(
	[PK_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTENT]    Script Date: 28/04/2020 7:05:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTENT](
	[PK_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[STT] [int] NULL,
	[CONTENT_TEXT] [nvarchar](max) NULL,
	[TYPE] [int] NULL,
	[GROUP_CONTENT_FK] [int] NOT NULL,
 CONSTRAINT [PK_CONTENT] PRIMARY KEY CLUSTERED 
(
	[PK_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GROUP_CONTENT]    Script Date: 28/04/2020 7:05:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUP_CONTENT](
	[PK_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[LESSION_FK] [int] NOT NULL,
	[NAME] [nvarchar](max) NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
 CONSTRAINT [PK_GROUP_CONTENT] PRIMARY KEY CLUSTERED 
(
	[PK_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KEYWORD]    Script Date: 28/04/2020 7:05:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KEYWORD](
	[PK_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[EN] [nvarchar](max) NULL,
	[VI] [nvarchar](max) NULL,
	[RELATE] [nvarchar](max) NULL,
	[ORDER] [int] NULL,
	[STATUS] [int] NULL,
 CONSTRAINT [PK_KEYWORD] PRIMARY KEY CLUSTERED 
(
	[PK_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LESSION]    Script Date: 28/04/2020 7:05:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LESSION](
	[PK_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](max) NULL,
	[IMAGE] [varchar](max) NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
	[MENU] [nvarchar](max) NULL,
 CONSTRAINT [PK_LESSION] PRIMARY KEY CLUSTERED 
(
	[PK_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LESSION_TAG]    Script Date: 28/04/2020 7:05:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LESSION_TAG](
	[PK_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[LESSON_FK] [int] NOT NULL,
	[TAG_FK] [int] NULL,
 CONSTRAINT [PK_LESSION_TAG] PRIMARY KEY CLUSTERED 
(
	[PK_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROCESS]    Script Date: 28/04/2020 7:05:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROCESS](
	[PK_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[USER_FK] [int] NOT NULL,
	[LESSION_FK] [int] NOT NULL,
	[STATUS] [int] NULL,
 CONSTRAINT [PK_PROCESS] PRIMARY KEY CLUSTERED 
(
	[PK_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUESTION]    Script Date: 28/04/2020 7:05:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUESTION](
	[PK_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[QUESTION_TEXT] [nvarchar](max) NULL,
	[QUESTION_USER_FK] [int] NOT NULL,
	[BEST_ANSWER_FK] [int] NOT NULL,
	[STATUS] [int] NULL,
 CONSTRAINT [PK_QUESTION] PRIMARY KEY CLUSTERED 
(
	[PK_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAG]    Script Date: 28/04/2020 7:05:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAG](
	[PK_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[TAG_NAME] [nvarchar](max) NULL,
 CONSTRAINT [PK_TAG] PRIMARY KEY CLUSTERED 
(
	[PK_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 28/04/2020 7:05:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[PK_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME] [nvarchar](max) NULL,
	[TOKEN] [varchar](max) NULL,
	[STATUS] [int] NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[PK_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ANSWER] ON 

INSERT [dbo].[ANSWER] ([PK_SEQ], [ANSWER_TEXT], [ANSWER_USER_FK], [QUESTION_FK], [STATUS]) VALUES (1, N'76#77#78#79#80', 1, 1, 1)
INSERT [dbo].[ANSWER] ([PK_SEQ], [ANSWER_TEXT], [ANSWER_USER_FK], [QUESTION_FK], [STATUS]) VALUES (2, N'81#82#83#84#85#86#87#88', 1, 2, 1)
INSERT [dbo].[ANSWER] ([PK_SEQ], [ANSWER_TEXT], [ANSWER_USER_FK], [QUESTION_FK], [STATUS]) VALUES (3, N'89#90#91#92#93#94#95', 1, 3, 1)
INSERT [dbo].[ANSWER] ([PK_SEQ], [ANSWER_TEXT], [ANSWER_USER_FK], [QUESTION_FK], [STATUS]) VALUES (5, N'96#97#98#99#100#101#102', 1, 5, 1)
INSERT [dbo].[ANSWER] ([PK_SEQ], [ANSWER_TEXT], [ANSWER_USER_FK], [QUESTION_FK], [STATUS]) VALUES (6, N'103#104#105#106#107#108', 1, 6, 1)
INSERT [dbo].[ANSWER] ([PK_SEQ], [ANSWER_TEXT], [ANSWER_USER_FK], [QUESTION_FK], [STATUS]) VALUES (7, N'109#110#111#112#113', 1, 7, 1)
INSERT [dbo].[ANSWER] ([PK_SEQ], [ANSWER_TEXT], [ANSWER_USER_FK], [QUESTION_FK], [STATUS]) VALUES (8, N'114#115#116', 1, 8, 1)
INSERT [dbo].[ANSWER] ([PK_SEQ], [ANSWER_TEXT], [ANSWER_USER_FK], [QUESTION_FK], [STATUS]) VALUES (9, N'117#118#119#120', 1, 9, 1)
INSERT [dbo].[ANSWER] ([PK_SEQ], [ANSWER_TEXT], [ANSWER_USER_FK], [QUESTION_FK], [STATUS]) VALUES (10, N'289#290#291#292#293#294#295', 1, 10, 1)
SET IDENTITY_INSERT [dbo].[ANSWER] OFF
SET IDENTITY_INSERT [dbo].[CONTENT] ON 

INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (1, 1, N'Đầu tiên chúng ta sẽ xem qua lịch sử của ngôn ngữ lập trình nhé', 1, 1)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (2, 2, N'Bạn xem hình dưới nè', 1, 1)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (3, 3, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93220988_125763535724465_7296874781335355392_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=hHBDvXbZzgwAX_6uTyT&_nc_ht=scontent.fvca1-2.fna&oh=963842b0a8da156eabd98c61d7c150c4&oe=5EB6DAE7', 2, 1)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (4, 4, N'Như bạn thấy đấy, C++ là một ngôn ngữ lập trình được phát triển từ C', 1, 1)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (5, 5, N'Được phát triển bởi Bjarne Stroustrup ( Bell Laboratories )', 1, 1)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (6, 6, N'Cung cấp khả năng lập trình hướng đối tượng', 1, 1)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (7, 7, N'Lưu ý: C++ không phải là ngôn ngữ lập trình thuần hướng đối tượng. Mà là ngôn ngữ lập trình cấu trúc hỗ trợ lập trình hướng đối tượng', 1, 1)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (8, 8, N'Bạn hiểu không?#Oki~#GROUPCONTENT_2#Còn tí thắc mắc#QUES_CONTI_GROUPCONTENT_2', 3, 1)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (9, 1, N'Bạn xem hình bên dưới để biết được quy trình biên dịch của 1 chương trình C++', 1, 2)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (10, 2, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/92866316_126338342333651_7234068108766347264_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=22oLBs1cSP0AX8k2-Y2&_nc_ht=scontent.fvca1-1.fna&oh=cfdb184e5635789e088bf4508877735f&oe=5EB9E62C', 2, 2)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (11, 3, N'Như bạn thấy, quá trình đó gồm 6 công đoạn', 1, 2)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (12, 3, N'Edit', 1, 2)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (13, 4, N'Preprocess', 1, 2)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (14, 5, N'Compile', 1, 2)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (15, 6, N'Link', 1, 2)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (16, 7, N'Load', 1, 2)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (17, 8, N'Execute', 1, 2)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (18, 9, N'Quá cơ bản nhể :3 #Uhm#GROUPCONTENT_3#Khoan, cho hỏi nhẹ cái#QUES_CONTI_GROUPCONTENT_3', 3, 2)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (19, 1, N'Tiếp theo chúng ta sẽ xem qua sự khác biệt của C và C++', 1, 3)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (20, 2, N'Thứ nhất là về Phạm vi và khai báo', 1, 3)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (21, 3, N'Không giống như C, chúng ta có thể khai báo một biến tại một vị trí bất kỳ trong chương trình.', 1, 3)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (22, 4, N'Một biến chỉ có tầm tác dụng trong khối lệnh nó được khai báo.', 1, 3)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (23, 5, N'Do đó, C++ cung cấp toán tử định phạm vi (::) để xác định rõ biến nào được sử dụng khi xảy ra tình trạng định nghĩa chồng một tên biến trong một khối lệnh con.', 1, 3)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (24, 6, N'Bạn có biết Toán tử phạm vi là gì không?#Tôi biết cái đó#GROUPCONTENT_5#Khoan, bạn nói qua xem#GROUPCONTENT_4', 3, 3)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (25, 1, N'Toán tử phạm vi (::)', 1, 4)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (26, 2, N'Thường được dùng để truy cập các biến toàn cục trong trường hợp có biến cục bộ trùng tên', 1, 4)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (27, 3, N'Ví dụ:    y = ::x + 3;', 1, 4)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (28, 4, N'Bạn xem qua đoạn code mẫu dưới nè', 1, 4)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (29, 5, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/s960x960/92877054_126605088973643_8971135264760004608_o.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=SJexHhvS6kkAX8_ke3z&_nc_ht=scontent.fvca1-1.fna&_nc_tp=7&oh=a6a0f303a9ab0f36dd71ba15d6c7352b&oe=5EBA7321', 2, 4)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (30, 6, N'Như bạn thấy đấy, với toán tử phạm vi ta có thể truy cập vào giá trị PI toàn cục', 1, 4)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (31, 7, N'Toán tử phạm vi là như vậy đó :3 #Ok#GROUPCONTENT_5#Khoan cho tôi hỏi#QUES_CONTI_GROUPCONTENT_5', 3, 4)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (32, 1, N'Trong C++ Chúng ta cũng có cách để xử lý nhập xuất', 1, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (33, 2, N'Phần này dễ nhưng khá dài. Bạn muốn xem qua không?#Để mình xem lại#CONTENT_34#Cái này ez, cho mình qua#GROUPCONTENT_6', 3, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (34, 3, N'Trong C++ chúng ta có các luồng nhập xuất chuẩn như', 1, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (35, 4, N'1. Cin : Luồng nhập chuẩn', 1, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (36, 5, N'2. Cout : Luồng xuất chuẩn', 1, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (37, 6, N'3. Cerr : Luồng thông báo lỗi chuẩn', 1, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (38, 7, N'Lưu ý là bạn phải include thư viện iostream và sử dụng namespace std', 1, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (39, 8, N'Bạn có muốn xem qua code mẫu không?#Xem#CONTENT_40#Được rồi#GROUPCONTENT_6', 3, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (40, 9, N'Bạn xem các đoạn code mẫu nhé, mình có chú thích trong hình á', 1, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (41, 10, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93407248_126616088972543_1045136736218251264_n.jpg?_nc_cat=101&_nc_sid=e007fa&_nc_ohc=V6L-UpYOGxcAX_ghtdx&_nc_ht=scontent.fvca1-2.fna&oh=05736a5abc4d67aa497b42366dd00402&oe=5EBD0120', 2, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (42, 11, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93255475_126616072305878_8036949293417889792_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=-3e-6qWfYk4AX9EGWb2&_nc_ht=scontent.fvca1-1.fna&oh=e628b1cc722061753f6f9c102bbadc5e&oe=5EBA81E4', 2, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (43, 12, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93867874_126616095639209_8184183959190503424_n.jpg?_nc_cat=104&_nc_sid=e007fa&_nc_ohc=mtHaKYlroVEAX_QptGC&_nc_ht=scontent.fvca1-2.fna&oh=d15f5b4d2e2dfe814c26f1aa9c26f082&oe=5EBB2483', 2, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (44, 13, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93371185_126616132305872_49747562512515072_n.jpg?_nc_cat=101&_nc_sid=e007fa&_nc_ohc=4-QTet4UPlsAX9tjIMm&_nc_ht=scontent.fvca1-2.fna&oh=be929a96d2a0807d8491381f658ef190&oe=5EBAC30A', 2, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (45, 14, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/92554597_126616148972537_4846013635891298304_n.jpg?_nc_cat=100&_nc_sid=e007fa&_nc_ohc=0mA_-pkPbOcAX9-eL2L&_nc_ht=scontent.fvca1-2.fna&oh=63b861ba2ffaf86fcce2152099701929&oe=5EBAECF6', 2, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (46, 15, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/92987824_126616168972535_1215996346343882752_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=AArqhw1aOgkAX-TTeGQ&_nc_ht=scontent.fvca1-1.fna&oh=4edd5d762bec2e222c54b789b09bc6cd&oe=5EBC852F', 2, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (47, 16, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93400566_126616195639199_1847518240079609856_n.jpg?_nc_cat=109&_nc_sid=e007fa&_nc_ohc=3mSW9uu5L0wAX_6lJSh&_nc_ht=scontent.fvca1-2.fna&oh=809567a148eedf9066d526063a148b6e&oe=5EB99772', 2, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (48, 17, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/92773385_126616208972531_208598504208072704_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=Nf89tvj25y8AX9hCazU&_nc_ht=scontent.fvca1-1.fna&oh=7896a70da7b91d833ef0482de7158af6&oe=5EBA836D', 2, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (49, 18, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93323024_126616242305861_944608735983042560_n.jpg?_nc_cat=101&_nc_sid=e007fa&_nc_ohc=jGTUTaiRZNcAX_BBc8m&_nc_ht=scontent.fvca1-2.fna&oh=84ecebed9ae6f0d922ca23422c0476a5&oe=5EBBE886', 2, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (50, 19, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93302047_126616268972525_5188260024723439616_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=-1retQtO2CIAX-74PXa&_nc_ht=scontent.fvca1-1.fna&oh=3d7e96bae368349ee2dd90e56f921600&oe=5EB9E5F1', 2, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (51, 20, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93398555_126616285639190_6976318286585659392_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=aRZg2IqaQ4MAX_Jc9Od&_nc_ht=scontent.fvca1-2.fna&oh=6b2596dde3e6378c4ffaefcb3cace2c7&oe=5EBCD3BC', 2, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (52, 21, N'Chúng ta đến phần tiếp theo nhé#Ok#GROUPCONTENT_6#Cho mình hỏi tí#QUES_CONTI_GROUPCONTENT_6', 3, 5)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (53, 1, N'Oki Tiếp theo chúng ta sẽ xem qua các kiểu dữ liệu trong C++', 1, 6)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (54, 2, N'Bạn xem hình dưới nè', 1, 6)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (55, 3, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93042812_126622308971921_9161213388951388160_n.jpg?_nc_cat=100&_nc_sid=e007fa&_nc_ohc=gQHjJdJ1NzcAX_IdHi0&_nc_ht=scontent.fvca1-2.fna&oh=8f05a83766dbb173f95ebe75c05eaf0b&oe=5EB96E08', 2, 6)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (56, 4, N'Như bạn thấy đấy. Chúng ta có 3 loại kiểu dữ liệu', 1, 6)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (57, 5, N'1. Kiểu dữ liệu đơn giản bao gồm các nhóm số thực và nhóm có dấu chấm động ngoài ra còn kiểu enum ( kiểu dữ liệu cố định do người dùng định nghĩa )', 1, 6)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (58, 6, N'2. Kiểu địa chỉ bao gồm : Con trỏ và tham chiếu', 1, 6)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (59, 7, N'Ngoài ra còn có kiểu cấu trúc như Lớp , mảng, Union', 1, 6)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (60, 8, N'Chúng ta tiếp tục nhé#Next#GROUPCONTENT_7#Để sau đã#QUES_CONTI_GROUPCONTENT_7', 3, 6)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (61, 1, N'Bây giờ chúng ta sẽ xem qua "Tham số mặc nhiên" là gì', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (62, 2, N'Bạn xem qua ví dụ bên dưới nhé. Chú ý khai báo của phương thức MessegeBox nhé', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (63, 3, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93373254_126626682304817_3907424013105758208_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=IgWn2IJlOT4AX-kaiGi&_nc_ht=scontent.fvca1-2.fna&oh=f3ca3ba69af7f1a479d01d5a3f6d7d2f&oe=5EBBFB92', 2, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (64, 4, N'Như bạn thấy đấy, ngay khi ta truyền thiếu tham số thì hàm vẫn chạy', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (65, 5, N'Với tham số không được truyền vào, chương trình sẽ lấy tham số mặc định được khai báo ở hàm đó', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (66, 6, N'Mục đích : Gán các giá trị mặc nhiên cho các tham số của hàm.', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (67, 7, N'Quy tắc khai báo tham số mặc nhiên:', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (68, 8, N'Tất cả các tham số mặc nhiên phải là một dãy tham số liên tục và phải để ở cuối hàm', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (69, 9, N'Chỉ cần đưa vào khai báo, không cần trong định nghĩa.', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (70, 10, N'Cách gọi hàm có tham số mặc nhiên:', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (71, 11, N'Nếu cung cấp đủ tham số dùng tham số truyền vào.', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (72, 12, N'Nếu không đủ tham số dùng tham số mặc nhiên', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (73, 13, N'Ưu điểm: Không cần hiểu rõ ý nghĩa tất cả các tham số    Có thể giảm được số lượng hàm cần định nghĩa', 1, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (74, 14, N'Ok Vậy là chúng ta đã đi hết Bài 1 : CÁC ĐẶC ĐIỂM MỚI CỦA C++ Bạn có muốn xem bài kế tiếp#Ok#LESSON_2#Khoan. Tôi cần xem lại#QUES_CONTI_LESSON_2', 3, 7)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (75, 1, N'Tiếp theo chúng ta sẽ xem qua như thế nào là Tái định nghĩa hàm', 1, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (76, 0, N'Syntax-error: Lỗi cú pháp được phát hiện ngay khi biên dịch chương trình. Trình biên dịch sẽ thông báo lỗi tại cửa sổ', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (77, 0, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93027464_127079722259513_701015813204738048_n.jpg?_nc_cat=102&_nc_sid=e007fa&_nc_ohc=EbXCYvs6oPYAX9JHDTu&_nc_ht=scontent.fvca1-1.fna&oh=1ed8f1ece130f54ccb887300f507e6ad&oe=5EBB20F4', 2, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (78, 0, N'Runtime-error: Chương trình đã được biên dịch thành công, gặp lỗi khi chạy chương trình do đầu vào hoặc đầu ra có giá trị không mong muốn.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (79, 0, N'https://scontent.fdad2-1.fna.fbcdn.net/v/t1.0-9/92828212_127079718926180_1724993783881269248_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=98dLSVYmye0AX_p_-xc&_nc_ht=scontent.fdad2-1.fna&oh=a46680d2cd10eaee4f65cb0a6d444c64&oe=5EBABD65', 2, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (80, 0, N'Logical-error: Chương trình đã được biên dịch và chạy không gặp lỗi Runtime-error. Nhưng kết quả đầu ra không đúng theo yêu cầu do logic xử lý bài toán bị sai.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (81, 0, N'Complier và Linker là 2 component trong process viết 1 chương trình C/C++.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (82, 0, N'Bước 1: Soạn thảo mã nguồn .c và .h (header)', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (83, 0, N'Bước 2: Tiền xử lí (pre-process) source code dựa vào macro và preprocessor directives. Tiền xử lí sẽ thay thế các giá trị được định nghĩa bởi #define, #include,…. trước khi biên dịch', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (84, 0, N'Bước 3: Complier biên dịch source code đã được tiền xử lí thành các object code (.obj)', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (85, 0, N'Bước 4: Linker link object code với (các object code khác, static lib, dynamic lib) để tạo ra file .EXE', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (86, 0, N'Bước 5: Load chương trình .EXE vào bộ nhớ', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (87, 0, N'Bước 6: Run .EXE với giá trị nhập vào và output đúng như mong muốn.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (88, 0, N'https://scontent.fdad2-1.fna.fbcdn.net/v/t1.0-9/92852619_127079728926179_8904130072680595456_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=VdDvjfjkUgsAX9fxDlk&_nc_ht=scontent.fdad2-1.fna&oh=1f7a7efdae8fd6d3dde4ae34d6c6c125&oe=5EBB846D', 2, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (89, 0, N'Vòng lặp vô hạn là chuỗi các câu lệnh được thực hiện lặp đi lặp lại không có điểm dừng. Nguyên nhân có thể là:', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (90, 0, N'Vòng lặp chưa có điều kết thúc vòng lặp', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (91, 0, N'Vòng lặp có điều điều kiện để kết thúc vòng lặp nhưng điều kiện này không bao giờ được đáp ứng.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (92, 0, N'Hoặc có thể một logic nào đó dẫn đến lặp vô hạn (ví dụ: lệnh goto có thể tạo ra vòng lặp)', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (93, 0, N'Chương trình bị dính vòng lặp vô hạn, chương trình có thể bị gây treo PC hoặc bị crash (nếu trong vòng lặp khai bao biến hoặc cấp phát vùng nhớ mà không giải phóng vùng nhớ).', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (94, 0, N'Do vậy, cần tránh để xảy ra vòng lặp vô hạn trong chương trình.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (95, 0, N'Trong một số trường hợp (requirement), lập trình  viên không xác định chính xác được số lần lặp để xử lí 1 logic nào đó. Lúc này, lập trình viên phải sử dụng khai báo vòng lặp vô hạn for(), while(), do while().', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (96, 0, N'Có 3 loại vòng lặp vô hạn', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (97, 0, N'Vòng lặp vô hạn for', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (98, 0, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93154221_127079772259508_5345654873721405440_n.jpg?_nc_cat=104&_nc_sid=e007fa&_nc_ohc=bij5cRlyIsAAX-pw9MR&_nc_ht=scontent.fvca1-2.fna&oh=bfd0f71c11c837f2a8841705d77fa415&oe=5EBDAD7B', 2, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (99, 0, N'Vòng lặp vô hạn while', 1, 0)
GO
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (100, 0, N'https://scontent.fdad2-1.fna.fbcdn.net/v/t1.0-9/93494206_127079778926174_1959992081963286528_n.jpg?_nc_cat=108&_nc_sid=e007fa&_nc_ohc=W6P6O42EXPsAX8e4pE-&_nc_ht=scontent.fdad2-1.fna&oh=672865d2bcc05bc3174b15b16b303973&oe=5EBC7009', 2, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (101, 0, N'Vòng lặp vô hạn do while', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (102, 0, N'https://scontent.fhan3-1.fna.fbcdn.net/v/t1.0-9/93052392_127079785592840_1369223724150030336_n.jpg?_nc_cat=109&_nc_sid=e007fa&_nc_ohc=7COL2DyAjjMAX_0Kzoc&_nc_ht=scontent.fhan3-1.fna&oh=e7ccdebee563261342ca7b9f6ebdc7f3&oe=5EBAC500', 2, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (103, 0, N'– Biến local là xuất hiện trong phạm vi cụ thể.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (104, 0, N'– Biến local chỉ tồn tại trong hàm mà biến được khai báo', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (105, 0, N'– Đôi khi, biến local được gọi là biến tự động (auto) bởi vì các biến được tự động sinh ra khi hàm được thực hiện và sẽ tự động biến mất khi kết thúc hàm.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (106, 0, N'– Từ khóa auto được sử dụng để ám chỉ biến cục bộ', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (107, 0, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/92757898_127326968901455_8703841033110159360_n.jpg?_nc_cat=106&_nc_sid=e007fa&_nc_ohc=5ox_T7ynWbgAX-ktSTG&_nc_ht=scontent.fvca1-1.fna&oh=c18b1ee1752f047ec1d24f1a28e9f848&oe=5EBF2A7C', 2, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (108, 0, N'Chương trình này khi build sẽ bị lỗi do, biến i khai báo trong hàm Display(), nên phạm vị hoạt động của biến i chỉ trong hàm Display(). Hàm main() không sử dụng được biến i => gây ra lỗi.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (109, 0, N' Biến global là biến được khai báo bên ngoài tất cả các hàm và có giá trị với tất cả các hàm trong chương trình. Tức là các hàm trong chương trình có thể sử dụng biến global để tính toán.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (110, 0, N'Biến global tồn tại đến khi nào chương trình kết thúc', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (111, 0, N'Có thể định nghĩa 1 biến global trong 1 file (.c/.cpp/.h) và truy cập biến này từ 1 file (.c/.cpp/.h) khác. Để làm điều này, biến phải được khai báo ở cả 2 file và từ khóa extern được thêm trong lần khai báo thứ 2.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (112, 0, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/92694845_127326975568121_9137347870595219456_n.jpg?_nc_cat=106&_nc_sid=e007fa&_nc_ohc=DrpRMnRLlaIAX-8bKpW&_nc_ht=scontent.fvca1-1.fna&oh=5c2c199df2859e57f8838cd990be3efc&oe=5EBC06CA', 2, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (113, 0, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94055415_127326988901453_248260414062723072_n.jpg?_nc_cat=104&_nc_sid=e007fa&_nc_ohc=HW-JXLO1z_0AX8CTtOx&_nc_ht=scontent.fvca1-2.fna&oh=d1dd0d5416eab40938c9516f54bdf0f7&oe=5EBD8867', 2, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (114, 0, N' Biến static có thể là global hoặc local. Cả hai đều được khai báo với từ khóa static đi kèm.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (115, 0, N'Biến local static là biến có thể duy trì giá trị từ lần gọi hàm thứ nhất đến các lần gọi hàm tiếp theo. Biến local static tồn tại đến khi chương trình kết thúc.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (116, 0, N'Khi tạo 1 biến local static trong hàm, chúng ta nên khởi tạo giá trị cho chúng. Nếu không giá trị biến được gán mặc định bằng 0.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (117, 0, N'Trong ngôn ngữ C, tiền xử lý #define được sử dụng để tạo biến với giá trị là hằng số.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (118, 0, N'Trong ngôn ngữ C++, xuất hiện một số vấn đề: khi sử dụng #define, tiền xử lí sẽ nhảy thẳng vào source code và thay thế biến bằng giá trị đã định nghĩa. Vì biến #define chỉ tồn tại bên trong file mà nó được định nghĩa, có thể xảy ra trường hợp định nghĩa tên biến giống nhưng khác về giá trị.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (119, 0, N'Định nghĩa biến hằng trong C++, chủng ta nên sử dụng từ khóa const đi kèm.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (120, 0, N'Khi sử dụng từ khóa const, phải khởi tạo giá trị ban đầu cho biến.', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (121, 2, N'Ở C++ cho phép định nghĩa các hàm trùng tên.', 1, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (122, 3, N'https://scontent-hkt1-1.xx.fbcdn.net/v/t1.0-9/93515139_128291908804961_1767807297788051456_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=pEM0xdoX87UAX8VHTcN&_nc_ht=scontent-hkt1-1.xx&oh=f5b052e62299f861b6f1d25a6b08123f&oe=5EC119A6', 2, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (123, 4, N'-Qui tắc tái định nghĩa:', 1, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (124, 5, N'+Các hàm trùng tên phải khác nhau về tham số:', 1, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (125, 6, N'như Số lượng, thứ tự, kiểu', 1, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (126, 7, N'-Qui tắc gọi hàm?', 1, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (127, 8, N'+Tìm hàm có kiểu tham số phù hợp', 1, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (128, 9, N'+Dùng phép ép kiểu tự động', 1, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (129, 10, N'+Tìm hàm gần đúng (phù hợp) nhất', 1, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (130, 11, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/92618851_128298298804322_4768645787238268928_n.jpg?_nc_cat=105&_nc_sid=e007fa&_nc_ohc=zXI5KtcLSdsAX_nZG8r&_nc_ht=scontent.fvca1-1.fna&oh=09cc5207c580fae1a8f234a8256bf294&oe=5EBFC680', 2, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (131, 12, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94101313_128298802137605_4664427735785930752_n.jpg?_nc_cat=101&_nc_sid=e007fa&_nc_ohc=AMrxiXC_2VUAX_YagZV&_nc_ht=scontent.fvca1-2.fna&oh=14c796e3210e3321b6921ebc4ab78fb2&oe=5EC20932', 2, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (132, 1, N'Về Toán tử quản lý bộ nhớ động', 1, 9)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (133, 2, N'Toán tử cấp phát bộ nhớ động:  new', 1, 9)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (134, 3, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93941909_128300485470770_2878871154934677504_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=DXth8cQymbgAX-U122n&_nc_ht=scontent.fvca1-2.fna&oh=28eedffb6c2e3d264191b35888e50745&oe=5EC095ED', 2, 9)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (135, 4, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94216282_128300482137437_2970391500648611840_n.jpg?_nc_cat=100&_nc_sid=e007fa&_nc_ohc=Rn2IuLvbXN4AX8Zn72n&_nc_ht=scontent.fvca1-2.fna&oh=21b1fb88df98a74e3cd2dd46a4dbaa3d&oe=5EC24D51', 2, 9)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (136, 1, N'Trong C++ chúng ta có 2 cách truyền tham số', 1, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (137, 13, N'Chúng ta tiếp tục nhé#Next#GROUPCONTENT_9#Để sau đã#QUES_CONTI_GROUPCONTENT_9', 3, 8)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (138, 5, N'Tiếp theo chúng ta xem qua các cách truyền tham số nhé#Oki#GROUPCONTENT_10#Cho mình hỏi tí#QUES_CONTI_GROUPCONTENT_10', 3, 9)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (139, 2, N'Truyền theo giá trị (tham trị) :  Giá trị tham số khi ra khỏi hàm sẽ không thay đổi.', 1, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (140, 3, N'Truyền theo địa chỉ (tham chiếu) :  Giá trị tham số khi ra khỏi hàm có thể thay đổi.', 1, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (141, 4, N'Chi tiết về tham chiếu', 1, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (142, 5, N'Tham chiếu là địa chỉ vùng nhớ được cấp phát cho một biến', 1, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (143, 6, N'Ký hiệu & đặt trước biến hoặc hàm để xác định tham chiếu của chúng', 1, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (144, 7, N'Ví dụ :', 1, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (145, 8, N'int x = 10, *px = &x, &y = x;', 1, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (146, 9, N'*px = 20;', 1, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (147, 10, N'y = 30; ', 1, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (148, 11, N'Bạn xem qua hình dưới đây nhé', 1, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (149, 12, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93627142_128310915469727_5061110301064167424_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=D9PHKriyDC0AX9c5o0K&_nc_ht=scontent.fvca1-2.fna&oh=540426f2a5fbd85493c903b2d924597d&oe=5EC1765A', 2, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (150, 13, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93852211_128310908803061_1906150818617229312_n.jpg?_nc_cat=102&_nc_sid=e007fa&_nc_ohc=cFpO4QPjrDMAX8RwMnd&_nc_ht=scontent.fvca1-1.fna&oh=f05533b58e6d1244a1ef7ccf48a157d0&oe=5EC143AF', 2, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (151, 14, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93097725_128310912136394_2373951037225566208_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=Vy-pzLa6Ka8AX9Oosd9&_nc_ht=scontent.fvca1-2.fna&oh=8ac0e43e9bab636b57ad237c442b78c5&oe=5EC2A497', 2, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (152, 15, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93929268_128310905469728_5472317926046433280_n.jpg?_nc_cat=105&_nc_sid=e007fa&_nc_ohc=wFlVBviMJBcAX83m885&_nc_ht=scontent.fvca1-1.fna&oh=afa19baf126e025b63b07b7ef7d55924&oe=5EC12D85', 2, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (153, 16, N'Tiếp theo chúng ta xem qua hàm Inline nhé#Oki#GROUPCONTENT_11#Cho mình hỏi tí#QUES_CONTI_GROUPCONTENT_11', 3, 10)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (154, 1, N'Tiếp theo chúng ta xem qua Hàm Inline', 1, 11)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (155, 2, N'Hàm inline hay còn gọi là hàm nội tuyến', 1, 11)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (156, 3, N'Sử dụng từ khóa inline', 1, 11)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (157, 4, N'Yêu cầu trình biên dịch copy code vào trong chương trình thay vì thực hiện lời gọi hàm: Giảm thời gian thực thi chương trình Tăng kích thước của mã lệnh thực thi', 1, 11)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (158, 5, N'Lưu ý: Chỉ nên định nghĩa inline khi hàm có kích thước nhỏ', 1, 11)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (159, 6, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94281429_128316215469197_1930010100680884224_n.jpg?_nc_cat=108&_nc_sid=e007fa&_nc_ohc=0ZooWfn0cbsAX_JwWUV&_nc_ht=scontent.fvca1-1.fna&oh=6ff07862d0e7dba1b8e951da34fbe606&oe=5EC1365A', 2, 11)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (160, 7, N'Việc tổ chức chương trình thành các hàm có ưu điểm là giảm kích thước của chương trình nhưng lại làm chậm tốc độ chương trình do phải thực hiện một số thao tác có tính thủ tục khi gọi hàm. Hàm trực tuyến trong C++ cho khả năng khắc phục nhược điểm đó.', 1, 11)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (161, 8, N'- Giảm thời gian thực thi chương trình', 1, 11)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (162, 9, N'- Tăng kích thước của mã lệnh thực thi', 1, 11)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (163, 10, N'- Chỉ nên định nghĩa inline khi hàm có kích thước nhỏ', 1, 11)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (164, 11, N'Ok Vậy là chúng ta đã đi hết phần còn lại của Bài 1 : CÁC ĐẶC ĐIỂM MỚI CỦA C++ Bạn có muốn xem bài kế tiếp#Ok#LESSON_3#Khoan. Tôi cần xem lại#QUES_CONTI_LESSON_3', 3, 11)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (165, 1, N'Đầu tiên chúng ta sẽ bàn về mục tiêu của việc thiết kế phần mềm', 1, 12)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (166, 2, N'Các bạn lưu ý là tất cả những gì chúng ta học ở phần này sẽ luôn xoay quanh các mục tiêu sau', 1, 12)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (167, 3, N'Đầu tiên là tính tái sử dụng (reusability): ', 1, 12)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (168, 4, N'thiết kế các thành phần có thể được sử dụng trong nhiều phần mềm khác nhau', 1, 12)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (169, 5, N'Thứ 2: Tính mở rộng (extensibility)', 1, 12)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (170, 6, N'Thứ 3: Tính mềm dẻo', 1, 12)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (171, 7, N'Có thể dễ dàng thay đổi khi thêm mới dữ liệu hay tính năng.', 1, 12)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (172, 8, N'Các thay đổi không làm ảnh hưởng nhiều đến toàn bộ hệ thống', 1, 12)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (173, 9, N'Ngoài ra bên cạnh đó còn có Tính mở rộng (extensibility): hỗ trợ các plug-ins.', 1, 12)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (174, 10, N'Chúng ta tiếp tục đến phần các Phương pháp lập trình nhé#Next#GROUPCONTENT_13#Để sau đã#QUES_CONTI_GROUPCONTENT_13', 3, 12)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (175, 1, N'Tiếp tục chúng ta sẽ xem qua các phương pháp lập trình', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (176, 2, N'Đầu tiên chúng ta hãy xem Sự tiến hóa của các phương pháp lập trình:', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (177, 3, N'Bao gồm 3 phương pháp', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (178, 4, N'Lập trình không có cấu trúc', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (179, 5, N'Lập trình có cấu trúc (lập trình thủ tục), hướng chức năng', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (180, 6, N'Lập trình hướng đối tượng', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (181, 7, N'Bạn có cần xem lại kiến thức về Lập trình ko có cấu trúc và Lập trình cấu trúc không#Xem#CONTENT_182#Ko cần#GROUPCONTENT_14', 3, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (182, 8, N'Vậy chúng ta sẽ xem như thế nào là lập trình không có cấu trúc', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (183, 9, N'Là phương pháp xuất hiện đầu tiên', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (184, 10, N'Các ngôn ngữ như Assembly, Basic', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (185, 11, N'Sử dụng các biến toàn cục', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (186, 12, N'Lạm dụng lệnh GOTO', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (187, 13, N'https://scontent-sin6-2.xx.fbcdn.net/v/t1.0-9/93570428_128501185450700_4908734881560788992_n.jpg?_nc_cat=105&_nc_sid=e007fa&_nc_ohc=cRcSfXr0iV4AX_FXvLm&_nc_ht=scontent-sin6-2.xx&oh=d88d032ee5be24d013bf5520c50d2f5f&oe=5EC30154', 2, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (188, 14, N'Tiếp theo chúng ta sẽ xem qua ntn là Lập trình có cấu trúc,Phương pháp lập trình chính của chúng ta cho đến hiện giờ', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (189, 15, N'Rõ ràng là các ngôn ngữ mới với các tính năng mới cần phải được phát triển để có thể tạo ra các ứng dụng tinh vi hơn. Vào cuối các năm trong 1960 và 1970, ngôn ngữ lập trình có cấu trúc ra đời. Các chương trình có cấu trúc được tổ chức theo các công việc mà chúng thực hiện.', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (190, 16, N'Đặc điểm :', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (191, 17, N'Tổ chức thành các chương trình con (hay các module)', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (192, 18, N'Mỗi chương trình con đảm nhận xử lý một công việc nhỏ hay một nhóm công việc trong toàn bộ hệ thống.', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (193, 19, N'Mỗi chương trình con này lại có thể chia nhỏ thành các chương trình con nhỏ hơn.', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (194, 20, N'Chương trình = Cấu trúc dữ liệu + Giải thuật', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (195, 21, N'Về bản chất, chương trình chia nhỏ thành các chương trình con riêng rẽ (còn gọi là hàm hay thủ tục) thực hiện các công việc rời rạc trong quá trình lớn hơn, phức tạp hơn. Các hàm này được giữ càng độc lập với nhau càng nhiều càng tốt, mỗi hàm có dữ liệu và logic riêng.Thông tin được chuyển giao giữa các hàm thông qua các tham số, các hàm có thể có các biến cục bộ mà không một ai nằm bên ngoài phạm vi của hàm lại có thể truy xuất được chúng. Như vậy, các hàm có thể được xem là các chương trình con được đặt chung với nhau để xây dựng nên một ứng dụng.', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (196, 22, N'Sử dụng các lệnh có cấu trúc: for, do, while, if then else...', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (197, 23, N'Các ngôn ngữ: Pascal, C,...', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (198, 24, N'Chương trình là tập các hàm/thủ tục', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (199, 25, N'Chương trình được module hóa, do đó dễ hiểu, dễ bảo trì hơn', 1, 13)
GO
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (200, 26, N'Dễ dàng tạo ra các thư viện phần mềm', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (201, 27, N'Nhược điểm?', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (202, 28, N'Dữ liệu và mã xử lý là tách rời', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (203, 29, N'Người lập trình phải biết cấu trúc dữ liệu', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (204, 30, N'Khi thay đổi cấu trúc dữ liệu thuật toán phải thay đổi theo', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (205, 31, N'Khó đảm bảo tính đúng đắn của dữ liệu', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (206, 32, N'Không tự động khởi tạo hay giải phóng dữ liệu động', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (207, 33, N'Không mô tả được đầy đủ, trung thực hệ thống trong thực tế', 1, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (208, 34, N'Tiếp theo chúng ta sẽ xem Tổng quan về lập trình Hướng đối tượng nhé#Next#GROUPCONTENT_14#Để sau đã#QUES_CONTI_GROUPCONTENT_14', 3, 13)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (209, 1, N'Bây h chúng ta sẽ tìm hiểu như thế nào là Lập trình hướng đối tượng nhé', 1, 14)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (210, 2, N'Trong thế giới thực, chung quanh chúng ta là những đối tượng, đó là các thực thể có mối quan hệ với nhau.', 1, 14)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (211, 3, N'Ví dụ: Các phòng trong một công ty', 1, 14)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (212, 4, N'Từ đó chúng ta có thể hiểu rằng ', 1, 14)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (213, 5, N'Lập trình hướng đối tượng (Object Oriented Programming – LTHĐT) (Object Oriented Programming – LTHĐT)Là phương pháp lập trình lấy đối tượng làm nền tảng để xây dựng thuật giải, xây dựng chương trình ', 1, 14)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (214, 6, N'Khái niệm hướng đối tượng được xây dựng trên nền tảng của khái niệm lập trình có cấu trúc và sự trừu tượng hóa dữ liệu.', 1, 14)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (215, 7, N'Sự thay đổi căn bản ở chỗ, một chương trình hướng đối tượng được thiết kế xoay quanh dữ liệu mà chúng ta có thể làm việc trên đó, hơn là theo bản thân chức năng của chương trình.', 1, 14)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (216, 8, N'Thực chất đây không phải là một phương pháp mới mà là một cách nhìn mới trong việc lập trình.', 1, 14)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (217, 9, N'Quan trọng :Lập trình hướng đối tượng là phương pháp  lập trình dựa trên kiến trúc lớp (class)  và đối tượng (object)', 1, 14)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (218, 10, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93642883_128511108783041_3438759153156227072_n.jpg?_nc_cat=104&_nc_sid=e007fa&_nc_ohc=HcvS0cSgxX8AX_tdgiH&_nc_ht=scontent.fvca1-2.fna&oh=7b9646d3658193603fdb3e68a304004d&oe=5EC13BE4', 2, 14)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (219, 11, N'Tiếp theo chúng ta sẽ xem Object ( Đối tượng) là gì#Ok#GROUPCONTENT_15#Để sau đã#QUES_CONTI_GROUPCONTENT_15', 3, 14)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (220, 1, N'Vật như thế nào là Obj', 1, 15)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (221, 2, N'Trong thế giới thực, đối tượng được hiểu như là một thực thể: người, vật hoặc một bảng dữ liệu…', 1, 15)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (222, 3, N'Mỗi đối tượng sẽ tồn tại trong một hệ thống và có ý nghĩa nhất định trong hệ thống.', 1, 15)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (223, 4, N'Đối tượng giúp biểu diễn tốt hơn thế giới thực trên máy tính', 1, 15)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (224, 5, N'Mỗi đối tượng bao gồm 2 thành phần: thuộc tính và thao tác (hành động).', 1, 15)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (226, 7, N'Ví dụ đối tượng: một người', 1, 15)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (227, 8, N'Một người có các thuộc tính: tên, tuổi, địa chỉ, màu mắt…', 1, 15)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (228, 9, N'Các hành động: đi, nói, thở…', 1, 15)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (229, 10, N'Một đối tượng là 1 thực thể bao gồm thuộc tính và hành động ', 1, 15)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (230, 11, N'Tiếp theo chúng ta sẽ xem Lớp (class) là gì#Ok#GROUPCONTENT_16#Để sau đã#QUES_CONTI_GROUPCONTENT_16	', 1, 15)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (231, 1, N'Class là gì', 1, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (232, 2, N'Các đối tượng có các đặc tính tương tự nhau được gom chung thành lớp đối tượng. Một lớp đối tượng đặc trưng bằng các thuộc tính, và các hành động (hành vi, thao tác).', 1, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (233, 3, N'Thuộc tính (Attribute): Một thành phần của đối tượng, có giá trị nhất định cho mỗi đối tượng tại mỗi thời điểm trong hệ thống.', 1, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (234, 4, N'Ví dụ Người là một lớp đối tượng.', 1, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (235, 5, N'Vd: Tên, Tuổi, cân nặng… là các thuộc tính của Người', 1, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (236, 6, N'Thao tác (Operation): Thể hiện hành vi của một đối tượng tác động qua lại với các đối tượng khác hoặc với chính nó.', 1, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (237, 7, N'Mỗi thao tác trên một lớp đối tượng cụ thể tương ứng với một cài đặt cụ thể khác nhau. Một cài đặt như vậy được gọi là một phương thức (method).', 1, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (238, 8, N'Cùng một phương thức có thể được áp dụng cho nhiều lớp đối tượng khác nhau, một thao tác như vậy được gọi là có tính đa hình (polymorphism). ', 1, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (239, 9, N'Một đối tượng cụ thể thuộc một lớp được gọi là một thể hiện (instance) của lớp đó.', 1, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (240, 10, N'Ví dụ Joe Smith, 25 tuổi, nặng 58kg, là một thể hiện của lớp người.', 1, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (241, 11, N'Tương tác giữa 2 đối tượng', 1, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (242, 12, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93576569_128511122116373_8914375343503048704_n.jpg?_nc_cat=105&_nc_sid=e007fa&_nc_ohc=CVS7vHhnlTsAX-ikgUE&_nc_ht=scontent.fvca1-1.fna&oh=79edd9e0ba770255a82138386336dd29&oe=5EBFC8E5', 2, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (243, 13, N'Tiếp theo chúng ta sẽ xem các đặc điểm OPP#Ok#GROUPCONTENT_17#Để sau đã, hỏi tí#QUES_CONTI_GROUPCONTENT_17', 3, 16)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (244, 1, N'Trong OPP , có các đặc điểm quan trọng', 1, 17)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (245, 2, N'Đóng gói - Encapsulation', 1, 17)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (246, 3, N'Thừa kế - Inheritance', 1, 17)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (247, 4, N'Đa hình - Polymorphism', 1, 17)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (248, 5, N'Trừu tượng', 1, 17)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (249, 6, N'Đầu tiên chúng ta sẽ xem Trừu tượng là gì#Ok#GROUPCONTENT_18#Để sau đã, hỏi tí#QUES_CONTI_GROUPCONTENT_18', 3, 17)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (250, 1, N'Các bạn xem qua hình dưới để hiểu ntn là Trừu tượng hoá nhé', 1, 18)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (251, 2, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94100070_128511182116367_4088032876870762496_n.jpg?_nc_cat=104&_nc_sid=e007fa&_nc_ohc=-AcKXOeH2PMAX8oL_D1&_nc_ht=scontent.fvca1-2.fna&oh=a78952a42b09805907ac1c53ce1f570c&oe=5EC1B9AF', 2, 18)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (252, 3, N'https://scontent.fhan3-1.fna.fbcdn.net/v/t1.0-9/93868993_128511185449700_3764482184325365760_n.jpg?_nc_cat=109&_nc_sid=e007fa&_nc_ohc=F5ga2HLoQAsAX-varOl&_nc_ht=scontent.fhan3-1.fna&oh=1f6632d038829ea774b0d53226faa4b0&oe=5EC2A4F5', 2, 18)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (253, 4, N'Cách nhìn khái quát hóa về một tập các đối tượng có chung các đặc điểm được quan tâm (và bỏ qua những chi tiết không cần thiết).', 1, 18)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (254, 5, N'Tiếp theo chúng ta sẽ xem Đóng gói là gì#Ok#GROUPCONTENT_19#Để sau đã, hỏi tí#QUES_CONTI_GROUPCONTENT_19', 1, 18)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (255, 1, N'TIếp thep chúng ta xem đóng gói là gì ', 1, 19)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (256, 2, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94218828_128511202116365_4868764713313370112_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=yuOwe1kS58kAX-wL9KB&_nc_ht=scontent.fvca1-2.fna&oh=9c25a7106135f22dc6cb82c0a1986da7&oe=5EC34425', 2, 19)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (257, 3, N'Các hàm/ thủ tục đóng gói    các câu lệnh', 1, 19)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (258, 4, N'Các đối tượng đóng gói    dữ liệu của chúng và    các thủ tục có liên quan', 1, 19)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (259, 5, N'Mục đích là để che dấu thông tin: đóng gói để che một số thông tin và chi tiết cài đặt nội bộ để bên ngoài không nhìn thấy', 1, 19)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (260, 6, N'Che giấu những gì mà người dùng không cần.', 1, 19)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (261, 7, N'Che giấu những gì mà mình cần giữ bí mật.', 1, 19)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (262, 8, N'https://scontent.fhan3-3.fna.fbcdn.net/v/t1.0-9/93516549_128511252116360_6166061857107869696_n.jpg?_nc_cat=106&_nc_sid=e007fa&_nc_ohc=JsVt88EFnLAAX95uw7X&_nc_ht=scontent.fhan3-3.fna&oh=30d418e0d2eb0f51a2de798c4a090aa1&oe=5EC04324', 2, 19)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (263, 9, N'Tiếp theo thừa kế nhéì#Ok#GROUPCONTENT_20#Để sau đã, hỏi tí#QUES_CONTI_GROUPCONTENT_20', 1, 19)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (264, 1, N'Thừa kế là gì', 1, 20)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (265, 2, N'Là cơ chế cho phép một lớp D có được các thuộc tính và thao tác của lớp C, như thể các thuộc tính và thao tác đó đã được định nghĩa tại lớp D.', 1, 20)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (266, 3, N'Cho phép cài đặt nhiều quan hệ giữa các đối tượng:', 1, 20)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (267, 4, N'Đặc biệt hóa (“là”)', 1, 20)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (268, 5, N'Khái quát hóa', 1, 20)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (269, 6, N'https://scontent.fhan3-1.fna.fbcdn.net/v/t1.0-9/93024910_128511248783027_6500778408060911616_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=0TELfPo_WwUAX9CHar-&_nc_ht=scontent.fhan3-1.fna&oh=5a4f40595e52d9652a09055ae5c63171&oe=5EC34171', 2, 20)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (270, 7, N'Tiếp theo là đa hình nhé#Ok#GROUPCONTENT_21#Để sau đã, hỏi tí#QUES_CONTI_GROUPCONTENT_21', 3, 20)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (271, 1, N'Đa hình là gì', 1, 21)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (272, 2, N'Là cơ chế cho phép một tên thao tác hoặc thuộc tính có thể được định nghĩa tại nhiều lớp và có thể có nhiều cài đặt khác nhau tại mỗi lớp trong các lớp đó', 1, 21)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (273, 4, N'Ưu điểm của OOP#Xem#GROUPCONTENT_22#Để sau đã, hỏi tí#QUES_CONTI_GROUPCONTENT_22', 3, 21)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (274, 1, N'Các ưu điểm của Lập trình hướng đối tượng', 1, 22)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (275, 2, N'Nguyên lý kế thừa: tránh lặp, tái sử dụng.', 1, 22)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (276, 3, N'Nguyên lý đóng gói – che dấu thông tin: chương trình an toàn không bị thay đổi bới những đoạn chương trình khác  ', 1, 22)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (277, 4, N'Dễ mở rộng, nâng cấp  ', 1, 22)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (278, 5, N'Mô phỏng thế giới thực tốt hơn.', 1, 22)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (279, 6, N'Để tổng hợp, chúng ta xem lại các đặc tính chính của OOP#Xem#GROUPCONTENT_23#Để sau đã, hỏi tí#QUES_CONTI_GROUPCONTENT_23', 3, 22)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (280, 1, N'Các đặc tính chính của OOP', 1, 23)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (281, 2, N'Chương trình được chia thành các đối tượng.', 1, 23)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (282, 3, N'Các cấu trúc dữ liệu được thiết kế sao cho đặc tả được đối tượng.', 1, 23)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (283, 4, N'Các cấu trúc dữ liệu được thiết kế sao cho đặc tả được đối tượng.', 1, 23)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (284, 5, N'Dữ liệu được đóng gói lại, được che giấu và không cho phép các hàm ngoại lai truy nhập tự do.', 1, 23)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (285, 3, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94005318_128511232116362_2345575390891737088_n.jpg?_nc_cat=100&_nc_sid=e007fa&_nc_ohc=RJdYaUVmpXUAX9WgS5s&_nc_ht=scontent.fvca1-2.fna&oh=2cd50b5fd1e2b8fb452a942825fc86c4&oe=5EC27B05', 2, 21)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (286, 6, N'Các đối tượng tác động và trao đổi thông tin với nhau qua các hàm', 1, 23)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (287, 7, N'Có thể dễ dàng bổ sung dữ liệu và các hàm mới vào đối tượng nào đó khi cần thiết.', 1, 23)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (288, 8, N'Chương trình được thiết kế theo cách tiếp cận từ dưới lên (bottom-up).', 1, 23)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (289, 0, N'OOM (Object Oriented Methodology): Phương pháp luận hướng đối tượng', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (290, 0, N'OOA (Object Oriented Analysis): Phân tích hướng đối tượng', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (291, 0, N'OOD: Object Oriented Design (Thiết kế hướng đối tượng).', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (292, 0, N'OOP: Object Oriented Programming (LTHĐT).', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (293, 0, N'Inheritance: Kế thừa', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (294, 0, N'Polymorphism: Đa hình', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (295, 0, N'Encapsulation: Tính đóng gói', 1, 0)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (296, 1, N'Bây giờ chúng ta xem qua cách khai báo lớp nhé', 1, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (297, 2, N'https://scontent-hkt1-1.xx.fbcdn.net/v/t1.0-9/93916352_130219668612185_5818186479842623488_n.jpg?_nc_cat=108&_nc_sid=e007fa&_nc_ohc=AkHdYrNELUAAX-lrZFH&_nc_ht=scontent-hkt1-1.xx&oh=a80c4b5b687e20a85b78acc1aa34525e&oe=5ECD9F3E', 2, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (298, 3, N'Cú pháp khai báo lớp có dạng', 1, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (299, 4, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94708437_131670205133798_5167927580824698880_n.jpg?_nc_cat=105&_nc_sid=e007fa&_nc_ohc=vF_zHzxU5AIAX_8jXZa&_nc_ht=scontent.fvca1-1.fna&oh=1836ba34930f51eb76a0ad2f2fefc064&oe=5ECABCFE', 1, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (300, 5, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93841209_130219675278851_8775263985600561152_n.jpg?_nc_cat=103&_nc_sid=e007fa&_nc_ohc=hPc-3xR_nA8AX_2Gn0c&_nc_ht=scontent.fvca1-1.fna&oh=90709fcf1fbca66304a0ef476ac56641&oe=5ECCE256', 2, 24)
GO
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (301, 6, N'Trong đó bao gồm các thành phần', 1, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (302, 7, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93841209_130219675278851_8775263985600561152_n.jpg?_nc_cat=103&_nc_sid=e007fa&_nc_ohc=hPc-3xR_nA8AX_2Gn0c&_nc_ht=scontent.fvca1-1.fna&oh=90709fcf1fbca66304a0ef476ac56641&oe=5ECCE256', 1, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (303, 8, N'Phương thức: Các phương thức được khai báo giống như khai báo hàm trong C. Có hai cách định nghĩa thi hành của một phương thức', 1, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (304, 9, N'Thuộc tính: Các thuộc tính được khai báo giống như khai báo biến trong C', 1, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (305, 10, N'Định nghĩa hàm thành phần', 1, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (306, 11, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93687130_130219701945515_5349238353915019264_n.jpg?_nc_cat=105&_nc_sid=e007fa&_nc_ohc=ozwzJqU4DYwAX8P9lnf&_nc_ht=scontent.fvca1-1.fna&oh=29242bb89671d2a753b99bb9c18e181a&oe=5ECE2584', 2, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (307, 12, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93872781_130219741945511_6280911129438846976_n.jpg?_nc_cat=109&_nc_sid=e007fa&_nc_ohc=Np3VIIV0WDMAX8A4Wug&_nc_ht=scontent.fvca1-2.fna&oh=c867c447c7e6e9edd6485b02b145684d&oe=5ECC513B', 2, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (308, 13, N'Ví dụ lớp time', 1, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (309, 14, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93788320_130219721945513_1952790087527825408_n.jpg?_nc_cat=100&_nc_sid=e007fa&_nc_ohc=DaY67P7u59gAX9T9HUf&_nc_ht=scontent.fvca1-2.fna&oh=c106df99235272cffc7dcebcaa8a8a20&oe=5ECB8027', 2, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (310, 15, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93687061_130219758612176_829461989922177024_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=CF-x_XZg7NsAX-Tby7r&_nc_ht=scontent.fvca1-2.fna&oh=8a49fda458a354e2b9929125f01ce3b1&oe=5ECAAFEC', 2, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (311, 16, N'Tiếp theo chúng ta sẽ xem cách Khai báo và tạo lập đối tượng #Next#GROUPCONTENT_25#Để sau đã#QUES_CONTI_GROUPCONTENT_25', 3, 24)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (312, 1, N'Cách khai báo và tạo lập đối tượng', 1, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (313, 2, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/95320696_131678768466275_8317358078857052160_n.jpg?_nc_cat=106&_nc_sid=e007fa&_nc_ohc=dUoftvBf-DsAX9PADUu&_nc_ht=scontent.fvca1-1.fna&oh=9155166f4e210f4c01457cd978952416&oe=5ECD3ACF', 3, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (314, 4, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93913292_130219778612174_6970100333582221312_n.jpg?_nc_cat=101&_nc_sid=e007fa&_nc_ohc=oUH6OaMQY58AX-i77S0&_nc_ht=scontent.fvca1-2.fna&oh=fb616ccb3c91e4c20d238fbcad4dc84d&oe=5ECCAA56', 2, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (315, 3, N'Đối tượng là một sự thể hiện của một lớp. Trong một lớp có thể có nhiều sự thể hiện khác nhau. Nói một cách khác: có thể có nhiều đối tượng cùng thuộc về một lớp', 1, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (316, 5, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93796290_130219785278840_1462553853118382080_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=yLDEqV9zae0AX8qhvEf&_nc_ht=scontent.fvca1-2.fna&oh=95d5537349b75fd2fc0c7f2f782f0020&oe=5ECBFBAA', 2, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (317, 6, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93823162_130219805278838_6036001193593929728_n.jpg?_nc_cat=109&_nc_sid=e007fa&_nc_ohc=TJelHSnJpBAAX8_D5D7&_nc_ht=scontent.fvca1-2.fna&oh=98cb7f54f5598a9a24424a751b824ec4&oe=5ECCD1C9', 2, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (318, 7, N'Ví dụ khi Xây dựng lớp Điểm (Point) trong hình học 2D', 1, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (319, 8, N'Thuộc tính : Tung độ ,  Hoành độ', 1, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (320, 9, N'Thao tác (phương thức) :  Khởi tạo ,Di chuyển ,In ra màn hình', 1, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (321, 10, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94128060_130219835278835_2809372493821771776_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=MdwA6vqt-00AX_BCtTh&_nc_ht=scontent.fvca1-2.fna&oh=f7d847b6db05e068de2fb1a87eec1e19&oe=5ECB4833', 2, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (322, 11, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93849024_130219858612166_5452522258570412032_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=jy8cemxIFuUAX_LHpLx&_nc_ht=scontent.fvca1-1.fna&oh=5759625788631c2803f59619ace9fe01&oe=5ECE6135', 2, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (323, 12, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93853262_130219871945498_4577133075250544640_n.jpg?_nc_cat=103&_nc_sid=e007fa&_nc_ohc=DUORh4mSZ3oAX9Tdy2V&_nc_ht=scontent.fvca1-1.fna&oh=b9ad3023b95451b03cf475f6ab5439f4&oe=5ECAB992', 2, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (324, 13, N'Tiếp theo chúng ta sẽ xem Phạm vi truy xuất #Next#GROUPCONTENT_26#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_26', 3, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (325, 1, N'Về phạm vi truy xuất', 1, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (326, 2, N'Trong định nghĩa của lớp ta có thể xác định khả năng truy xuất thành phần của một lớp nào đó từ bên ngoài phạm vi lớp.', 1, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (327, 14, N'private, protected và public là các từ khóa xác định phạm vi truy xuất', 1, 25)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (328, 3, N'Mọi thành phần được liệt kê trong phần public đều có thể truy xuất trong bất kỳ hàm nào.', 1, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (329, 4, N'Những thành phần được liệt kê trong phần private chỉ được truy xuất bên trong phạm vi lớp.', 1, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (330, 5, N'Trong lớp có thể có nhiều nhãn private và public', 1, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (331, 6, N'Mỗi nhãn này có phạm vi ảnh hưởng cho đến khi gặp một nhãn kế tiếp hoặc hết khai báo lớp.', 1, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (332, 7, N'Nhãn private đầu tiên có thể bỏ qua vì C++ ngầm hiểu rằng các thành phần trước nhãn public đầu tiên là private.', 1, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (333, 8, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93670649_130219895278829_7029360127668912128_n.jpg?_nc_cat=102&_nc_sid=e007fa&_nc_ohc=l8XJnzmiPuMAX-w3caQ&_nc_ht=scontent.fvca1-1.fna&oh=384bb330ad1525eec0823cc389ac7bae&oe=5ECCA5B3', 2, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (334, 9, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93842514_130219915278827_1655785432492802048_n.jpg?_nc_cat=104&_nc_sid=e007fa&_nc_ohc=A0bA2CYMfGMAX-AZKR0&_nc_ht=scontent.fvca1-2.fna&oh=4598bf0d46a819efaa57e8d9e1d0fad7&oe=5ECADEB3', 2, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (335, 10, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93713260_130219931945492_6926936049696374784_n.jpg?_nc_cat=104&_nc_sid=e007fa&_nc_ohc=ad1mPq6a-HYAX-y8GWe&_nc_ht=scontent.fvca1-2.fna&oh=8bdce66e984c043571ba9bea33ccd205&oe=5ECBE9CA', 2, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (336, 11, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93674894_130219948612157_2863515938181873664_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=4Tk3f5p3OTcAX8uNpIn&_nc_ht=scontent.fvca1-2.fna&oh=e7484522ee2f498072a8da03ec2ea508&oe=5ECC3FD6', 2, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (337, 12, N'Để nối tiếp chúng ta sẽ xem qua Hàm thành phần là ntn nhé #Next#GROUPCONTENT_27#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_27', 3, 26)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (338, 1, N'Tiếp theo chúng ta sẽ xem Hàm thành phần là gì ', 1, 27)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (339, 2, N'Hàm thành phần có quyền truy cập đến tất cả các thành phần private của các đối tượng, tham chiếu đối tượng hay con trỏ đối tượng có cùng kiểu lớp khi được dùng là tham số hình thức của nó.', 1, 27)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (340, 3, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93827659_130219965278822_4215629526236921856_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=DPMd3Q08xjgAX-7MwWX&_nc_ht=scontent.fvca1-2.fna&oh=dbc151415c1e3425bb61da8e27c1d1cc&oe=5ECAB638', 2, 27)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (341, 4, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93674894_130219948612157_2863515938181873664_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=4Tk3f5p3OTcAX8uNpIn&_nc_ht=scontent.fvca1-2.fna&oh=e7484522ee2f498072a8da03ec2ea508&oe=5ECC3FD6', 2, 27)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (342, 5, N'Hàm thành phần có quyền truy nhập đến các thành phần private của đối tượng gọi nó', 1, 27)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (343, 6, N'Từ khoá this ? #Xem#GROUPCONTENT_28#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_28', 3, 27)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (344, 1, N'Từ khóa this trong định nghĩa của các hàm thành phần lớp dùng để xác định địa chỉ của đối tượng dùng làm tham số ngầm định cho hàm thành phần.', 1, 28)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (345, 2, N'Con trỏ this tham chiếu đến đối tượng đang gọi hàm thành phần.', 1, 28)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (346, 3, N'Ví dụ:    y = ::x + 3;', 1, 28)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (347, 4, N'int point::Trung(point pt){', 1, 28)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (348, 5, N'return (this -> x == pt.x && this-> y == pt.y);', 1, 28)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (349, 6, N'}', 1, 28)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (350, 7, N'Tiếc tục với phép gán đối tượng nhé #Xem#GROUPCONTENT_29#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_29', 3, 28)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (351, 1, N'Phép gán đối tượng là : ', 1, 29)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (352, 2, N'Là việc sao chép giá trị các thành phần dữ liệu từ đối tượng a sang đối tượng b tương ứng từng đôi một', 1, 29)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (353, 3, N'Là việc sao chép giá trị các thành phần dữ liệu từ đối tượng a sang đối tượng b tương ứng từng đôi một', 1, 29)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (354, 4, N'Ví dụ:', 1, 29)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (355, 5, N'point a, b;', 1, 29)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (356, 6, N'a.init(5,2);', 1, 29)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (357, 7, N'a.init(5,2);', 1, 29)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (358, 8, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/93687094_130219978612154_5058549323734712320_n.jpg?_nc_cat=105&_nc_sid=e007fa&_nc_ohc=zT4ps6ve0QwAX__T2sr&_nc_ht=scontent.fvca1-1.fna&oh=6e8ae621e0f6f75efc287357c16c7e25&oe=5ECBC14B', 2, 29)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (359, 9, N'Ok Vậy là chúng ta đã đi hết phần còn lại của Bài 2 : TỔNG QUAN LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG Bạn có muốn xem bài kế tiếp#Ok#LESSON_4#Khoan. Tôi cần xem lại#QUES_CONTI_LESSON_4', 3, 23)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (360, 9, N'Xem bài kế tiếp nhé #Ok#LESSON_5#Khoan. Tôi cần xem lại#QUES_CONTI_LESSON_5', 3, 29)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (361, 1, N'Để hiểu được contructor là gì thì chúng ta nên xem qua :', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (362, 2, N'Trong hầu hết các thuật giải, để giải quyết một vấn đề thường phải thực hiện các công việc:', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (364, 4, N'Khởi tạo giá trị cho biến, cấp phát vùng bộ nhớ của biến con trỏ, mở tập tin để truy cập,…', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (365, 5, N'Hoặc khi kết thúc, chúng ta phải thực hiện quá trình ngược lại như: Thu hồi vùng bộ nhớ đã cấp phát, đóng tập tin,…', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (366, 6, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94491300_131697491797736_3414584156636577792_n.jpg?_nc_cat=108&_nc_sid=e007fa&_nc_ohc=TarZ0piUrh8AX8ZD25T&_nc_ht=scontent.fvca1-1.fna&oh=39e55e9315a515e04a792d612421a865&oe=5ECD0E76', 2, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (367, 7, N'Phương thức thiết lập hay còn gọi là constructor, là một loại phương thức đặc biệt dùng để khởi tạo thể hiện của lớp.', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (368, 8, N'Bất kỳ một đối tượng nào được khai báo đều phải sử dụng một hàm thiết lập để khởi tạo các giá trị thành phần của đối tượng.', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (369, 9, N'Hàm thiết lập được khai báo giống như một phương thức với tên phương thức trùng với tên lớp và không có giá trị trả về (kể cả void).', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (370, 10, N'Constructor phải có thuộc tính public', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (371, 11, N'Constructor có thể được khai báo chồng như các hàm C++ thông thường khác hay không?', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (372, 12, N'Constructor có thể được khai báo với các tham số có giá trị ngầm định hay không?', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (373, 13, N'Constructor có thể được khai báo với các tham số có giá trị ngầm định hay không?', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (374, 14, N'Ví dụ', 1, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (375, 15, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94362995_131697508464401_996560497186701312_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=ZfLRdtVtXMAAX-sgylR&_nc_ht=scontent.fvca1-1.fna&oh=737e21e2f07c2f1568eed39e01c9e2c9&oe=5ECD5FA6', 2, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (376, 16, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94432943_131697568464395_5721302793717809152_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=kXuvGAEdwK0AX9-SaCz&_nc_ht=scontent.fvca1-2.fna&oh=00e9a543a0ab9adcff42b9199404885b&oe=5ECD9C20', 2, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (377, 17, N'Tiếc tục với phương thức khởi tạo mặc định nhé#Xem#GROUPCONTENT_31#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_31', 3, 30)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (378, 1, N'Vậy Defaut Constructor là gì', 1, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (379, 2, N'Constructor mặc định (default constructor) là constructor được gọi khi thể hiện được khai báo mà không có đối số nào được cung cấp', 1, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (380, 3, N'MyClass x = MyClass;', 1, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (381, 4, N'MyClass* p = new MyClass;', 1, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (382, 5, N'Ngược lại, nếu tham số được cung cấp tại khai báo thể hiện, trình biên dịch sẽ gọi constructor khác (overload)', 1, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (383, 6, N'MyClass x(5);', 1, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (384, 7, N'MyClass* p = new MyClass(5);', 1, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (385, 8, N'Đối với constructor mặc định, nếu ta không cung cấp bất kỳ constructor nào, C++ sẽ tự sinh constructor mặc định là một phương thức rỗng.', 1, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (386, 9, N'Tuy nhiên, nếu ta không định nghĩa constructor mặc định nhưng lại có các constructor khác, trình biên dịch sẽ báo lỗi không tìm thấy constructor mặc định nếu ta không cung cấp tham số khi tạo thể hiện.', 1, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (387, 10, N'ví dụ', 1, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (388, 11, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94432943_131697568464395_5721302793717809152_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=kXuvGAEdwK0AX9-SaCz&_nc_ht=scontent.fvca1-2.fna&oh=00e9a543a0ab9adcff42b9199404885b&oe=5ECD9C20', 2, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (389, 12, N'Tiếc tục với phương thức khởi tạo sao chép nhé#Xem#GROUPCONTENT_32#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_32', 3, 31)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (390, 1, N'Vậy phương thức thiết lập sao chép là gì', 1, 32)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (391, 2, N'Chúng ta có thể tạo đối tượng mới giống đối tượng cũ một số đặc điểm, không phải hoàn toàn như phép gán bình thường, hình thức “giống nhau” được định nghĩa theo quan niệm của người lập trình. Để làm được vấn đề này, trong các ngôn ngữ OOP cho phép ta xây dựng phương thức thiết lập sao chép.', 1, 32)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (392, 3, N'Đây là phương thức thiết lập có tham số là tham chiếu đến đối tượng thuộc chính lớp này.', 1, 32)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (393, 4, N'Trong phương thức thiết lập sao chép có thể ta chỉ sử dụng một số thành phần nào đó của đối tượng ta tham chiếu “gần giống nhau”', 1, 32)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (394, 5, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94359495_131697578464394_1903898232824528896_n.jpg?_nc_cat=102&_nc_sid=e007fa&_nc_ohc=z2eFQ9Dkb60AX-OgSYO&_nc_ht=scontent.fvca1-1.fna&oh=6c896d5177703fe5b71e8ed2fc2b7faa&oe=5ECC8D6D', 2, 32)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (395, 6, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94552553_131697601797725_4148991236033740800_n.jpg?_nc_cat=109&_nc_sid=e007fa&_nc_ohc=a9ftGCoYspwAX_DvwkK&_nc_ht=scontent.fvca1-2.fna&oh=abb7f3bc4fa1406ae918f8f7f0bac272&oe=5ECC6080', 2, 32)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (396, 7, N'Tiếc tục với phương thức Hủy bỏ nhé#Xem#GROUPCONTENT_33#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_33', 3, 32)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (397, 1, N'Vậy phương thức hủy bỏ là gì', 1, 33)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (398, 2, N'Phương thức hủy bỏ hay còn gọi là destructor, được gọi ngay trước khi một đối tượng bị thu hồi', 1, 33)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (399, 3, N'Destructor thường được dùng để thực hiện việc dọn dẹp cần thiết trước khi một đối tượng bị hủy.', 1, 33)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (400, 4, N'Một lớp chỉ có duy nhất một Destructor', 1, 33)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (401, 5, N'Cú pháp:', 1, 33)
GO
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (402, 6, N' +       Phương thức Destructor có tên trùng tên với tên lớp và có dấu ~ đặt trước', 1, 33)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (403, 7, N'+    Không có giá trị trả về', 1, 33)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (404, 8, N'Được tự động gọi thực hiện khi đối tượng hết phạm vi sử dụng.', 1, 33)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (405, 9, N'Destructor phải có thuộc tính public', 1, 33)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (406, 10, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94488517_131697621797723_253578549942812672_n.jpg?_nc_cat=104&_nc_sid=e007fa&_nc_ohc=6l2uU5CMxogAX_xVdZP&_nc_ht=scontent.fvca1-2.fna&oh=9f39e34073dba5f2f05d3e595b83f5bb&oe=5ECB70E0', 2, 33)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (407, 11, N'Oki nhé, Nếu ko có vấn đề gì thì chúng ta tiếp tục với Phương thức Truy vấn nhé#Xem#GROUPCONTENT_34#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_34', 3, 33)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (408, 1, N'Về phương thức truy vấn : ', 1, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (409, 2, N'Có nhiều loại câu hỏi truy vấn có thể:', 1, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (410, 3, N'+ Truy vấn đơn giản (“giá trị của x là bao nhiêu?”)', 1, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (411, 4, N'+ Truy vấn điều kiện (“thành viên x có > 10 không?”)', 1, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (412, 5, N'+ Truy vấn dẫn xuất (“tổng giá trị của các thành viên x và y là bao nhiêu?”)', 1, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (413, 6, N'Đặc điểm quan trọng của phương thức truy vấn là nó không nên thay đổi trạng thái hiện tại của đối tượng', 1, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (414, 7, N'Đối với các truy vấn đơn giản, quy ước đặt tên phương thức như sau: Tiền tố “get”, tiếp theo là tên của thành viên cần truy vấn', 1, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (415, 8, N'    int getX(); ', 1, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (416, 9, N'int getSize();', 1, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (417, 10, N'Các loại truy vấn khác nên có tên có tính mô tả', 1, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (418, 11, N'Truy vấn điều kiện nên có tiền tố “is”', 1, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (419, 12, N'Tiếc tục với phương thức cập nhật nhé#Xem#GROUPCONTENT_35#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_35', 3, 34)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (420, 1, N'Vậy phương thức cập nhật là gì', 1, 35)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (421, 2, N'Thường để thay đổi trạng thái của đối tượng bằng cách sửa đổi một hoặc nhiều thành viên dữ liệu của đối tượng đó.', 1, 35)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (422, 3, N'Dạng đơn giản nhất là gán một giá trị nào đó cho một thành viên dữ liệu.', 1, 35)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (423, 4, N'Đối với dạng cập nhật đơn giản, quy ước đặt tên như sau: Dùng tiền tố “set” kèm theo tên thành viên cần sửa', 1, 35)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (424, 5, N'Nếu phương thức get/set chỉ có nhiệm vụ cho ta đọc/ghi giá trị cho các thành viên dữ liệu Quy định các thành viên private để được ích lợi gì?', 1, 35)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (425, 6, N'Ngoài việc bảo vệ các nguyên tắc đóng gói, ta cần kiểm tra xem giá trị mới cho thành viên dữ liệu có hợp lệ hay không.', 1, 35)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (426, 7, N'Sử dụng phương thức truy vấn cho phép ta thực hiện việc kiểm tra trước khi thực sự thay đổi giá trị của thành viên.', 1, 35)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (427, 8, N'Chỉ cho phép các dữ liệu có thể truy vấn hay thay đổi mới được truy cập đến.', 1, 35)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (428, 9, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94785231_131697651797720_6770270898462130176_n.jpg?_nc_cat=105&_nc_sid=e007fa&_nc_ohc=F10F4zNnuWIAX-lFhpW&_nc_ht=scontent.fvca1-1.fna&oh=6c70f4ecf173302d0ff074dd7af29efb&oe=5ECCBD25', 2, 35)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (429, 10, N'Tiếc tục với thành viên tĩnh nhé#Xem#GROUPCONTENT_36#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_36', 3, 35)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (430, 1, N'Trong C, static xuất hiện trước dữ liệu được khai báo trong một hàm nào đó thì giá trị của dữ liệu đó vẫn được lưu lại như một biến toàn cục.', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (431, 2, N'Trong C++, nếu static xuất hiện trước một dữ liệu hoặc một phương thức của lớp thì giá trị của nó vẫn được lưu lại và có ý nghĩa cho đối tượng khác của cùng lớp này.', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (432, 3, N'Các thành viên static có thể là public, private hoặc protected.', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (433, 4, N'Đối với class, static dùng để khai báo thành viên dữ liệu dùng chung cho mọi thể hiện của lớp:', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (434, 5, N'- Một bản duy nhất tồn tại trong suốt quá trình chạy của chương trình.', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (435, 6, N'Dùng chung cho tất cả các thể hiện (instance) của lớp.', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (436, 7, N'Bất kể lớp đó có bao nhiêu thể hiện.', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (437, 8, N'Ví dụ', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (438, 9, N'https://scontent.fdad2-1.fna.fbcdn.net/v/t1.0-9/94393204_131697678464384_8653990769339662336_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=yOlwtfKVllAAX81stH4&_nc_ht=scontent.fdad2-1.fna&oh=6d9375c60261b158e7405998eb189ac9&oe=5ECBA7EC', 2, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (439, 10, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94380052_131697685131050_5627638383149842432_n.jpg?_nc_cat=106&_nc_sid=e007fa&_nc_ohc=AyjME4Gb0XQAX-Tpytt&_nc_ht=scontent.fvca1-1.fna&oh=9ecba2852ed7df009d51e1e2cc941ff8&oe=5ECB4BC3', 2, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (440, 11, N'https://scontent.fdad2-1.fna.fbcdn.net/v/t1.0-9/94402812_131697711797714_7801962647582146560_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=-2M1x5skdKcAX8ocrj9&_nc_ht=scontent.fdad2-1.fna&oh=da0113ef785f054509f88ad105ca9925&oe=5ECCF5BA', 2, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (441, 12, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94393204_131697718464380_6151885153611284480_n.jpg?_nc_cat=102&_nc_sid=e007fa&_nc_ohc=HInUlVdv6_sAX8jQjj0&_nc_ht=scontent.fvca1-1.fna&oh=a17098037893592f292e37c9cdaad003&oe=5ECE2D2C', 2, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (442, 13, N'Phương thức static?', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (443, 14, N'Phương thức static?', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (444, 15, N'Các thành viên lớp tĩnh public có thể được truy cập thông qua bất kỳ đối tượng nào của lớp đó, hoặc chúng có thể được truy cập thông qua tên lớp sử dụng toán tử định phạm vi.', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (445, 16, N'Các thành viên lớp tĩnh private và protected phải được truy cập thông qua các hàm thành viên public của lớp hoặc thông qua các friend của lớp.', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (446, 17, N'Các thành viên lớp tĩnh tồn tại ngay cả khi đối tượng của lớp đó không tồn tại.', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (447, 18, N'Để truy cập một thành viên lớp tĩnh public khi các đối tượng của lớp không tồn tại, đơn giản thêm vào đầu tên lớp và toán tử định phạm vi cho thành viên dữ liệu.', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (448, 19, N'Để truy cập một thành viên lớp tĩnh private hoặc protected khi các đối tượng của lớp không tồn tại, một hàm thành viên public phải được cung cấp và hàm phải được gọi bởi thêm vào đầu tên của nó với tên lớp và toán tử định phạm vi. ', 1, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (449, 20, N'Oki, xem bài kế tiếp nhé #Ok#LESSON_6#Khoan. Tôi cần xem lại#QUES_CONTI_LESSON_6', 3, 36)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (450, 1, N'Đối tượng là thành phần của lớp là gì ?', 1, 37)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (451, 2, N'Đối tượng là thành phần của lớp', 1, 37)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (452, 3, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94891935_131936951773790_2435347246829535232_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=2QRPIo9gn3UAX8VNBUg&_nc_ht=scontent.fvca1-2.fna&oh=a541ab99eeb2f4a4cac22566bcfef151&oe=5ECC8B96', 2, 37)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (453, 4, N'Phương thức thiết lập (nếu có) sẽ được tự động gọi cho các đối tượng thành phần.', 1, 37)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (454, 5, N'Khi đối tượng kết hợp bị hủy  đối tượng thành phần của nó cũng bị hủy, nghĩa là phương thức hủy bỏ sẽ được gọi cho các đối tượng thành phần, sau khi phương thức hủy bỏ của đối tượng kết hợp được gọi.', 1, 37)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (455, 6, N'Nếu đối tượng thành phần phải cung cấp tham số khi thiết lập thì đối tượng kết hợp (đối tượng lớn) phải có phương thức thiết lập để cung cấp tham số thiết lập cho các đối tượng thành phần.', 1, 37)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (456, 7, N'Cú pháp để khởi động đối tượng thành phần là dùng dấu hai chấm (:) theo sau bởi tên thành phần và tham số khởi động.', 1, 37)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (457, 8, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94887656_131936958440456_3020881907819741184_n.jpg?_nc_cat=109&_nc_sid=e007fa&_nc_ohc=FcBHN3xyP4MAX_YjJt2&_nc_ht=scontent.fvca1-2.fna&oh=b3a1ce23bfc2873e1b99c2f3d92f99a5&oe=5ECE8C1F', 2, 37)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (458, 9, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94878456_131936968440455_1363655548158869504_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=tOElP0MX2dUAX8sefYc&_nc_ht=scontent.fvca1-2.fna&oh=f30ee0396a715ed27346aca1b78b9c26&oe=5ECD8707', 2, 37)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (459, 10, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94772239_131937305107088_7034054539808342016_n.jpg?_nc_cat=106&_nc_sid=e007fa&_nc_ohc=JUQNHmEgcm8AX_ENo1e&_nc_ht=scontent.fvca1-1.fna&oh=e6665716aa1bb1c255254ec06faed75b&oe=5ECE536D', 2, 37)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (461, 12, N'Tiếp tục với " đối tượng là thành phần của mảng nhé"#Xem#GROUPCONTENT_38#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_38', 3, 37)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (462, 1, N'Vậy như thế nào là để khai báo và sử dụng các đối tượng trong 1 mảng', 1, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (463, 2, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94888393_131937018440450_8015690678476472320_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=Xd4BBoyg4coAX_qLUxN&_nc_ht=scontent.fvca1-1.fna&oh=0fe53def5ade2c5b18955d225ddfca2a&oe=5ECDC02E', 2, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (464, 3, N'Khi một mảng được tạo ra các phần tử của nó cũng được tạo ra phương thức thiết lập sẽ được gọi cho từng phần tử.', 1, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (465, 4, N'Vì không thể cung cấp tham số khởi động cho tất cả các phần tử của mảng khi khai báo mảng, mỗi đối tượng trong mảng phải có khả năng tự khởi động, nghĩa là có thể thiết lập không cần tham số.', 1, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (466, 5, N'Đối tượng có khả năng tự khởi động trong những trường hợp nào?', 1, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (467, 6, N'1.Lớp không có phương thức thiết lập', 1, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (468, 7, N'2.Lớp có phương thức thiết lập không tham số', 1, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (469, 8, N'3.Lớp có phương thức thiết lập mà mọi tham số đều có giá trị mặc nhiên', 1, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (470, 9, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94637323_131937158440436_2972503172859297792_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=MP8k7_LaO2gAX9Odebq&_nc_ht=scontent.fvca1-2.fna&oh=ab8da6efac5050e1a98a32e47b980fdc&oe=5ECD23A0', 2, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (471, 10, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94754518_131937035107115_646439522040545280_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=QFNeo7Q_I3gAX807pAp&_nc_ht=scontent.fvca1-2.fna&oh=0edf37eba951ddb29e4779484506e411&oe=5ECD3CDD', 2, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (472, 11, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94832788_131937248440427_3603752177257938944_n.jpg?_nc_cat=104&_nc_sid=e007fa&_nc_ohc=0C9vImdRCfUAX_z8Ura&_nc_ht=scontent.fvca1-2.fna&oh=3ae20d664b45fd2420a8dac1104bdd2b&oe=5ECD9FB7', 2, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (473, 12, N'String arrs[3]; 		// Error', 1, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (474, 13, N'Diem arrd[5];		// Error', 1, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (475, 14, N'SinhVien arrsv[7];		// Error', 1, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (476, 15, N'Tiếp tục với Dùng phương thức thiết lập với tham số có giá trị mặc nhiên nhé#Xem#GROUPCONTENT_39#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_39', 3, 38)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (477, 1, N'Cách dùng phương thức thiết lập với tham số có giá trị mặc nhiên : ', 1, 39)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (478, 2, N'Bạn xem qua hình bên dưới nè', 1, 39)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (479, 3, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94907418_131937045107114_4659499578641350656_n.jpg?_nc_cat=108&_nc_sid=e007fa&_nc_ohc=jTtKyR39tM4AX8ro04Y&_nc_ht=scontent.fvca1-1.fna&oh=6b5948373855b249129a348f2ed6cef8&oe=5ECF6CA9', 2, 39)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (480, 4, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/95191508_131937048440447_7126174836618952704_n.jpg?_nc_cat=103&_nc_sid=e007fa&_nc_ohc=Gty6spJafOUAX-CZSNM&_nc_ht=scontent.fvca1-1.fna&oh=dd5fa6c6147e8e02242fe4ae1ca0329d&oe=5ECC957B', 2, 39)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (481, 5, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94691475_131937115107107_7749529137076764672_n.jpg?_nc_cat=106&_nc_sid=e007fa&_nc_ohc=FPEsAdd4h6wAX8yAZDE&_nc_ht=scontent.fvca1-1.fna&oh=cf001d3899a341bac00363507b7e5313&oe=5ECBCAAF', 2, 39)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (482, 6, N'String as[3]; // Ok: Ca ba phan tu deu la chuoi rong', 1, 39)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (483, 7, N'Diem ad[5];	// Ok: ca 5 diem deu la (0,0)', 1, 39)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (484, 8, N'SinhVien asv[7]; // Ok: Het sai ca 7 sinh vien deu co cung hoten, maso, namsinh', 1, 39)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (485, 9, N'Tiếp tục với Dùng phương thức thiết lập không tham số nhé#Xem#GROUPCONTENT_40#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_40', 3, 39)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (486, 1, N'Cách sử dụng hàm tạo không tham só', 1, 40)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (487, 2, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94867177_131937215107097_5539667746301673472_n.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=EPvgSz7aHFcAX-qvcMn&_nc_ht=scontent.fvca1-1.fna&oh=6171bff1e22e66ccb86ed79ef94345be&oe=5ECCA604', 2, 40)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (488, 3, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94994564_131937135107105_3666192626555551744_n.jpg?_nc_cat=104&_nc_sid=e007fa&_nc_ohc=ZBHG-oQ6g1EAX9fJUGH&_nc_ht=scontent.fvca1-2.fna&oh=bac01803bde6bd1232ae387110354bd1&oe=5ECDC73B', 2, 40)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (489, 4, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/95380620_131937231773762_4630956110755397632_n.jpg?_nc_cat=108&_nc_sid=e007fa&_nc_ohc=LhZFV2h8snIAX-YLhXy&_nc_ht=scontent.fvca1-1.fna&oh=1913e19a96863a486f50b332bda4df65&oe=5ECDDC42', 2, 40)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (490, 5, N'String as[3]; // Ca ba phan tu deu la chuoi rong', 1, 40)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (491, 6, N'Diem ad[5];	// ca 5 diem deu la (0,0)', 1, 40)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (492, 7, N'SinhVien asv[7];// Ca 7 sinh vien deu co cung hoten, maso, namsinh', 1, 40)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (493, 1, N'Đối tượng được cấp phát động là các đối tượng được tạo ra bằng phép toán new và bị hủy đi bằng phép toán delete', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (494, 2, N'Phép toán new cấp đối tượng trong vùng heap và gọi phương thức thiết lập cho đối tượng được cấp.', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (495, 3, N'Phép toán new cấp đối tượng trong vùng heap (hay vùng free store) và gọi phương thức thiết lập cho đối tượng được cấp.', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (496, 4, N'Dùng new và delete cũng có thể cấp nhiều đối tượng và hủy nhiều đối tượng.', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (497, 5, N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/94700886_131937108440441_2716555622035226624_n.jpg?_nc_cat=108&_nc_sid=e007fa&_nc_ohc=_jSSDJlOSUMAX_ylsQx&_nc_ht=scontent.fvca1-1.fna&oh=563c682595b2645c14be5d7b1762879b&oe=5ECC07F2', 2, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (498, 8, N'Bây giờ chúng ta sẽ xem qua Cấp phát động là gì nhé#Xem#GROUPCONTENT_41#Để sau đã, cho mình hỏi#QUES_CONTI_GROUPCONTENT_41', 3, 40)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (499, 6, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/95013600_131937255107093_7216372267981209600_n.jpg?_nc_cat=100&_nc_sid=e007fa&_nc_ohc=hfAIFqU9RZQAX8hchqf&_nc_ht=scontent.fvca1-2.fna&oh=79bbc80cdcacd30ae0533d8251f8029c&oe=5ECC777C', 2, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (500, 8, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94569999_131937281773757_7361685653148401664_n.jpg?_nc_cat=100&_nc_sid=e007fa&_nc_ohc=b0dqf5bVXSsAX-9LxUf&_nc_ht=scontent.fvca1-2.fna&oh=6da8d748c2d0015c673e27b80e250bcf&oe=5ECD284F', 2, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (501, 9, N'Trong trường hợp cấp phát nhiều đối tượng, ta không thể cung cấp tham số cho từng phần tử được cấp phát.', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (502, 10, N'Thông báo lỗi cho đoạn chương trình trên như sau:', 1, 41)
GO
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (503, 11, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/95097828_131937091773776_2822495298243264512_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=O6iCUi0m9h8AX-Oew3y&_nc_ht=scontent.fvca1-2.fna&oh=0bcfa07b6db2eababfcc026ff4448632&oe=5ECE2977', 2, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (504, 12, N'Lỗi trên được khắc phục bằng cách cung cấp phương thức thiết lập để đối tượng có khả năng tự khởi động.', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (505, 7, N' Cách Cấp phát và hủy nhiều đối tượng', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (506, 13, N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/95125504_131937175107101_8311973224954986496_n.jpg?_nc_cat=101&_nc_sid=e007fa&_nc_ohc=JD_ZnEpIRKAAX9jFVk2&_nc_ht=scontent.fvca1-2.fna&oh=6f4636b822bc887be079680f076f7612&oe=5ECC36B3', 2, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (507, 14, N'Khi đó mọi phần tử được cấp đều được khởi động với cùng giá trị.', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (508, 15, N'int *pai = new int[10];', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (509, 16, N'Diem *pad = new Diem[5];  //Ca 5 diem co cung toa do (0,0)', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (510, 17, N'String *pas = new String[5];  //Ca 5 chuoi cung duoc khoi dong la “Alibaba”', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (512, 18, N'Việc hủy nhiều đối tượng được thực hiện bằng cách dùng delete và có thêm dấu [] ở trước.', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (513, 19, N'delete [] pas; delete [] pad; delete [] pai;', 1, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (514, 20, N'Oki, xem bài kế tiếp nhé #Ok#LESSON_7#Khoan. Tôi cần xem lại#QUES_CONTI_LESSON_7', 3, 41)
INSERT [dbo].[CONTENT] ([PK_SEQ], [STT], [CONTENT_TEXT], [TYPE], [GROUP_CONTENT_FK]) VALUES (515, 1, N'Hiện tại update :d', 1, 42)
SET IDENTITY_INSERT [dbo].[CONTENT] OFF
SET IDENTITY_INSERT [dbo].[GROUP_CONTENT] ON 

INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (1, 1, N'Lịch sử ngôn ngữ lập trình và C++', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (2, 1, N'Môi trường của C++', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (3, 1, N'Sự khác biệt của C và C++', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (4, 1, N'Toán tử phạm vi', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (5, 1, N'Nhập xuất với C++', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (6, 1, N'Các kiểu dữ liệu của C++', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (7, 1, N'Tham số mặc nhiên', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (8, 2, N'Tái định nghĩa hàm', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (9, 2, N'Toán tử quản lý bộ nhớ động', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (10, 2, N'Các cách truyền tham số', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (11, 2, N'Hàm nội', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (12, 3, N'Mục tiêu của việc thiết kế một phần mềm', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (13, 3, N'Các phương pháp lập trình', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (14, 3, N'Lập trình hướng đối tượng', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (15, 3, N'Đối tượng', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (16, 3, N'Lớp', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (17, 3, N'Các đặc điểm quan trọng của OOP', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (18, 3, N'Trừu tượng hóa', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (19, 3, N'Đóng gói', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (20, 3, N'Thừa kế', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (21, 3, N'Đa hình', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (22, 3, N'Ưu điểm của OOP', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (23, 3, N'Các đặc tính chính của OOP', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (24, 4, N'Cú pháp khai báo lớp', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (25, 4, N'Khai báo và tạo lập đối tượng', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (26, 4, N'Phạm vi truy xuất', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (27, 4, N'Hàm thành phần', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (28, 4, N'Từ khóa This', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (29, 4, N'Phép gán đối tượng', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (30, 5, N'hàm khởi tạo', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (31, 5, N'Hàm khởi tạo mặc định', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (32, 5, N'hàm thiết lập sao chép', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (33, 5, N'Hàm hủy bỏ', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (34, 5, N'Phương thức Truy vấn', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (35, 5, N'Phương thức cập nhật', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (36, 5, N'Thành viên tĩnh', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (37, 6, N'Đối tượng là thành phần của lớp', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (38, 6, N'Đói tượng là thành phần của mảng', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (39, 6, N'Phương thức thiết lập với tham số có giá trị mặc nhiên', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (40, 6, N'Phương thức thiết lập không tham số ', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (41, 6, N'Cấp phát động', NULL)
INSERT [dbo].[GROUP_CONTENT] ([PK_SEQ], [LESSION_FK], [NAME], [DESCRIPTION]) VALUES (42, 7, N'Hàm bạn, lớp bạn', NULL)
SET IDENTITY_INSERT [dbo].[GROUP_CONTENT] OFF
SET IDENTITY_INSERT [dbo].[KEYWORD] ON 

INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (1, N'default constructor', N'hàm khởi tạo mặc định', NULL, 5, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (2, N'Inline', N'nội', NULL, 1, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (3, N'Object', N'Đối tượng', NULL, 2, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (4, N'Class', N'Lớp', NULL, 1, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (5, N'abstract', N'trừu tượng hóa', NULL, 2, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (6, N'function', N'hàm', NULL, 1, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (7, N'encapsulation', N'đóng gói', NULL, 2, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (8, N'inheritance ', N'Thừa kế', NULL, 2, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (9, N'Polymorphism', N'đa hình', NULL, 2, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (10, N'constructor', N'hàm khởi tạo', NULL, 2, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (11, N'copy contructor', N'Hàm thiết lập sao chép', NULL, 5, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (12, N'decontructor', N'Hàm hủy bỏ', NULL, 2, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (13, N'static member', N'Thành viên tĩnh', NULL, 3, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (14, N'static', N'tĩnh', NULL, 1, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (15, N'dynamic allocation', N'Cấp phát động', NULL, 3, 1)
INSERT [dbo].[KEYWORD] ([PK_SEQ], [EN], [VI], [RELATE], [ORDER], [STATUS]) VALUES (16, N'dynamic ', N'động', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[KEYWORD] OFF
SET IDENTITY_INSERT [dbo].[LESSION] ON 

INSERT [dbo].[LESSION] ([PK_SEQ], [NAME], [IMAGE], [DESCRIPTION], [MENU]) VALUES (1, N'CÁC ĐẶC ĐIỂM MỚI CỦA C++', N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93289193_125753252392160_7192858361417695232_n.jpg?_nc_cat=107&_nc_sid=e007fa&_nc_ohc=nLFKQfeKJM4AX-jMc5l&_nc_ht=scontent.fvca1-2.fna&oh=9b765e7e141f4fce65fa40e7305556a8&oe=5EB8EC8A', N'Bài 1', NULL)
INSERT [dbo].[LESSION] ([PK_SEQ], [NAME], [IMAGE], [DESCRIPTION], [MENU]) VALUES (2, N'CÁC ĐẶC ĐIỂM MỚI CỦA C++ ( TT )', N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/93312752_126630875637731_7271029162796646400_n.jpg?_nc_cat=100&_nc_sid=e007fa&_nc_ohc=cfSQ9bLaoGcAX8ZWyWi&_nc_ht=scontent.fvca1-2.fna&oh=34b426aff77f94185208bd15d16ea423&oe=5EBD0EBF', N'Phần tiếp theo bài1 ~~', NULL)
INSERT [dbo].[LESSION] ([PK_SEQ], [NAME], [IMAGE], [DESCRIPTION], [MENU]) VALUES (3, N'TỔNG QUAN VỀ LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG', N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/s960x960/93794234_128488145452004_2521742382299348992_o.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=RDzI9ItHdBIAX_hbArO&_nc_ht=scontent.fvca1-2.fna&_nc_tp=7&oh=306a12c28b9c144ce13e916ac69df98b&oe=5EC06177', N'Bài 3', NULL)
INSERT [dbo].[LESSION] ([PK_SEQ], [NAME], [IMAGE], [DESCRIPTION], [MENU]) VALUES (4, N'LỚP VÀ ĐỐI TƯỢNG', N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/p720x720/94210699_130219651945520_4759390910104469504_o.jpg?_nc_cat=111&_nc_sid=e007fa&_nc_ohc=l5hW48Ya-xoAX_hvanF&_nc_ht=scontent.fvca1-1.fna&_nc_tp=6&oh=b9aafcdab287ef4f79f767eb58fe81d0&oe=5ECB91FD', NULL, NULL)
INSERT [dbo].[LESSION] ([PK_SEQ], [NAME], [IMAGE], [DESCRIPTION], [MENU]) VALUES (5, N'LỚP  VÀ ĐỐI TƯỢNG ( TT )', N'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.0-9/s960x960/94491322_131697535131065_4164144052452720640_o.jpg?_nc_cat=102&_nc_sid=e007fa&_nc_ohc=pbP_nTN0Km4AX_0o1BY&_nc_ht=scontent.fvca1-1.fna&_nc_tp=7&oh=11b71342e8e27ee6ad7bff1a92488a1c&oe=5ECDEE7A', N'phần tiếp theo', NULL)
INSERT [dbo].[LESSION] ([PK_SEQ], [NAME], [IMAGE], [DESCRIPTION], [MENU]) VALUES (6, N'THAO TÁC VỚI ĐỐI TƯỢNG', N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/94607722_131936995107119_4260500531341950976_n.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=gYaYbRDoQ2gAX8RnRdX&_nc_ht=scontent.fvca1-2.fna&oh=7af2a007aff1769ddc51248662be54ef&oe=5ECCCE49', N'b6', NULL)
INSERT [dbo].[LESSION] ([PK_SEQ], [NAME], [IMAGE], [DESCRIPTION], [MENU]) VALUES (7, N'KHỞI TẠO ĐỐI TƯỢNG HÀM BẠN VÀ LỚP BẠN (tt)', N'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/95387506_131958225104996_7615491101918494720_n.jpg?_nc_cat=100&_nc_sid=e007fa&_nc_ohc=eA_Et815YUUAX_i0TN7&_nc_ht=scontent.fvca1-2.fna&oh=67c2220ebc1b8c8d04dceae6a75f4ccb&oe=5ECC1A49', N'7', NULL)
SET IDENTITY_INSERT [dbo].[LESSION] OFF
SET IDENTITY_INSERT [dbo].[QUESTION] ON 

INSERT [dbo].[QUESTION] ([PK_SEQ], [QUESTION_TEXT], [QUESTION_USER_FK], [BEST_ANSWER_FK], [STATUS]) VALUES (1, N'Phân biệt Syntax-error, Runtime-error and Logical-error?', 1, 1, 1)
INSERT [dbo].[QUESTION] ([PK_SEQ], [QUESTION_TEXT], [QUESTION_USER_FK], [BEST_ANSWER_FK], [STATUS]) VALUES (2, N'Complier và Linker C/C++ là gì?', 1, 2, 1)
INSERT [dbo].[QUESTION] ([PK_SEQ], [QUESTION_TEXT], [QUESTION_USER_FK], [BEST_ANSWER_FK], [STATUS]) VALUES (3, N'Vòng lặp vô hạn là gì', 1, 3, 1)
INSERT [dbo].[QUESTION] ([PK_SEQ], [QUESTION_TEXT], [QUESTION_USER_FK], [BEST_ANSWER_FK], [STATUS]) VALUES (5, N'Các dạng của vòng lặp vô hạn', 1, 4, 1)
INSERT [dbo].[QUESTION] ([PK_SEQ], [QUESTION_TEXT], [QUESTION_USER_FK], [BEST_ANSWER_FK], [STATUS]) VALUES (6, N'Biến local ', 1, 0, 1)
INSERT [dbo].[QUESTION] ([PK_SEQ], [QUESTION_TEXT], [QUESTION_USER_FK], [BEST_ANSWER_FK], [STATUS]) VALUES (7, N'Biến global và extern', 1, 0, 1)
INSERT [dbo].[QUESTION] ([PK_SEQ], [QUESTION_TEXT], [QUESTION_USER_FK], [BEST_ANSWER_FK], [STATUS]) VALUES (8, N'Biến static', 1, 0, 1)
INSERT [dbo].[QUESTION] ([PK_SEQ], [QUESTION_TEXT], [QUESTION_USER_FK], [BEST_ANSWER_FK], [STATUS]) VALUES (9, N'Biến const', 1, 0, 1)
INSERT [dbo].[QUESTION] ([PK_SEQ], [QUESTION_TEXT], [QUESTION_USER_FK], [BEST_ANSWER_FK], [STATUS]) VALUES (10, N'Một số thuật ngữ OOP', 1, 0, 1)
SET IDENTITY_INSERT [dbo].[QUESTION] OFF
USE [master]
GO
ALTER DATABASE [OOPEZZ_DB] SET  READ_WRITE 
GO

DROP TABLE [QUESTION]
