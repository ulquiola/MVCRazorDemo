USE [master]
GO
/****** Object:  Database [test]    Script Date: 2018/11/6 10:54:13 ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\test.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\test_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY FULL 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [test]
GO
/****** Object:  Table [dbo].[BookInfo]    Script Date: 2018/11/6 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookInfo](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[BookTitle] [nvarchar](50) NULL,
	[BookContent] [nvarchar](max) NULL,
	[TypeId] [int] NULL,
 CONSTRAINT [PK_BookInfo] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookType]    Script Date: 2018/11/6 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeTitle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BookTypeSet] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MovieInfoSet]    Script Date: 2018/11/6 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieInfoSet](
	[MoiveId] [int] IDENTITY(1,1) NOT NULL,
	[MoiveName] [nvarchar](50) NOT NULL,
	[TypeId] [int] NOT NULL,
	[TypeInfo_TypeId] [int] NOT NULL,
 CONSTRAINT [PK_MovieInfoSet] PRIMARY KEY CLUSTERED 
(
	[MoiveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[musicInfo]    Script Date: 2018/11/6 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musicInfo](
	[MusicId] [int] IDENTITY(1,1) NOT NULL,
	[MusicTitle] [nvarchar](20) NOT NULL,
	[MusicTypeId] [nvarchar](max) NOT NULL,
	[MusicType_MusicTypeId] [int] NOT NULL,
	[MusicAuthor] [nvarchar](max) NULL,
 CONSTRAINT [PK_musicInfo] PRIMARY KEY CLUSTERED 
(
	[MusicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MusicType]    Script Date: 2018/11/6 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusicType](
	[MusicTypeId] [int] IDENTITY(1,1) NOT NULL,
	[MusicTypeInfo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MusicType] PRIMARY KEY CLUSTERED 
(
	[MusicTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsInfo]    Script Date: 2018/11/6 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsInfo](
	[nid] [int] IDENTITY(1,1) NOT NULL,
	[nTitle] [nvarchar](50) NULL,
	[nTid] [int] NOT NULL,
 CONSTRAINT [PK_NewsInfo] PRIMARY KEY CLUSTERED 
(
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsType]    Script Date: 2018/11/6 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsType](
	[tid] [int] NOT NULL,
	[tTitle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NewsType] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeInfoSet]    Script Date: 2018/11/6 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeInfoSet](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeInfoSet] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2018/11/6 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[UName] [varchar](30) NULL,
	[UPassWord] [nvarchar](6) NULL,
 CONSTRAINT [PK__Customer__3214EC270A32A84A] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BookInfo] ON 

INSERT [dbo].[BookInfo] ([BookId], [BookTitle], [BookContent], [TypeId]) VALUES (0, N'鹿鼎记', N'鹿鼎记', 1)
INSERT [dbo].[BookInfo] ([BookId], [BookTitle], [BookContent], [TypeId]) VALUES (1, N'十万个为什么', N'十万个为什么', 2)
INSERT [dbo].[BookInfo] ([BookId], [BookTitle], [BookContent], [TypeId]) VALUES (2, N'流浪记', N'流浪记', 1)
INSERT [dbo].[BookInfo] ([BookId], [BookTitle], [BookContent], [TypeId]) VALUES (3, N'三毛流浪记', N'流浪记', 1)
INSERT [dbo].[BookInfo] ([BookId], [BookTitle], [BookContent], [TypeId]) VALUES (4, N'三毛流浪记', N'流浪记', 2)
INSERT [dbo].[BookInfo] ([BookId], [BookTitle], [BookContent], [TypeId]) VALUES (5, N'三毛流浪记', N'三毛流浪记', 1)
SET IDENTITY_INSERT [dbo].[BookInfo] OFF
SET IDENTITY_INSERT [dbo].[BookType] ON 

INSERT [dbo].[BookType] ([TypeId], [TypeTitle]) VALUES (1, N'小说')
INSERT [dbo].[BookType] ([TypeId], [TypeTitle]) VALUES (2, N'科普')
INSERT [dbo].[BookType] ([TypeId], [TypeTitle]) VALUES (3, N'推理')
SET IDENTITY_INSERT [dbo].[BookType] OFF
SET IDENTITY_INSERT [dbo].[MusicType] ON 

INSERT [dbo].[MusicType] ([MusicTypeId], [MusicTypeInfo]) VALUES (1, N'古典')
INSERT [dbo].[MusicType] ([MusicTypeId], [MusicTypeInfo]) VALUES (2, N'朋克')
SET IDENTITY_INSERT [dbo].[MusicType] OFF
SET IDENTITY_INSERT [dbo].[NewsInfo] ON 

INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (1, N'天气异常', 2)
INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (2, N'新游戏推出', 5)
INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (3, N'股票大涨1', 4)
INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (4, N'新歌发现', 3)
INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (5, N'两会召开', 1)
INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (6, N'连续大雨', 2)
INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (7, N'道路改道', 2)
INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (8, N'dasfd', 2)
INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (9, N'阿萨', 2)
INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (14, N'所担负s', 2)
INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (16, N'泽西村ZC', 1)
INSERT [dbo].[NewsInfo] ([nid], [nTitle], [nTid]) VALUES (17, N'阿电磁阀', 2)
SET IDENTITY_INSERT [dbo].[NewsInfo] OFF
INSERT [dbo].[NewsType] ([tid], [tTitle]) VALUES (1, N'时事')
INSERT [dbo].[NewsType] ([tid], [tTitle]) VALUES (2, N'民生')
INSERT [dbo].[NewsType] ([tid], [tTitle]) VALUES (3, N'娱乐')
INSERT [dbo].[NewsType] ([tid], [tTitle]) VALUES (4, N'经济')
INSERT [dbo].[NewsType] ([tid], [tTitle]) VALUES (5, N'游戏')
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UID], [UName], [UPassWord]) VALUES (2, N'Vincent Ke', N'123456')
INSERT [dbo].[UserInfo] ([UID], [UName], [UPassWord]) VALUES (3, N'Alan', N'123456')
INSERT [dbo].[UserInfo] ([UID], [UName], [UPassWord]) VALUES (4, N'Jay Heyssi', N'123456')
INSERT [dbo].[UserInfo] ([UID], [UName], [UPassWord]) VALUES (5, N'Daisy Liu', N'123456')
INSERT [dbo].[UserInfo] ([UID], [UName], [UPassWord]) VALUES (6, N'张仪陇', N'123456')
INSERT [dbo].[UserInfo] ([UID], [UName], [UPassWord]) VALUES (8, N'李晓明', N'123456')
INSERT [dbo].[UserInfo] ([UID], [UName], [UPassWord]) VALUES (9, N'江海涛', N'123456')
INSERT [dbo].[UserInfo] ([UID], [UName], [UPassWord]) VALUES (10, N'关公', N'123456')
INSERT [dbo].[UserInfo] ([UID], [UName], [UPassWord]) VALUES (11, N'纷纷发', N'123456')
INSERT [dbo].[UserInfo] ([UID], [UName], [UPassWord]) VALUES (14, N'gdg', N'123456')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
/****** Object:  Index [IX_FK_MovieInfoTypeInfo]    Script Date: 2018/11/6 10:54:13 ******/
CREATE NONCLUSTERED INDEX [IX_FK_MovieInfoTypeInfo] ON [dbo].[MovieInfoSet]
(
	[TypeInfo_TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_musicInfoMusicType]    Script Date: 2018/11/6 10:54:13 ******/
CREATE NONCLUSTERED INDEX [IX_FK_musicInfoMusicType] ON [dbo].[musicInfo]
(
	[MusicType_MusicTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookInfo]  WITH CHECK ADD  CONSTRAINT [FK_BookInfo_BookInfo] FOREIGN KEY([TypeId])
REFERENCES [dbo].[BookType] ([TypeId])
GO
ALTER TABLE [dbo].[BookInfo] CHECK CONSTRAINT [FK_BookInfo_BookInfo]
GO
ALTER TABLE [dbo].[MovieInfoSet]  WITH CHECK ADD  CONSTRAINT [FK_MovieInfoTypeInfo] FOREIGN KEY([TypeInfo_TypeId])
REFERENCES [dbo].[TypeInfoSet] ([TypeId])
GO
ALTER TABLE [dbo].[MovieInfoSet] CHECK CONSTRAINT [FK_MovieInfoTypeInfo]
GO
ALTER TABLE [dbo].[musicInfo]  WITH CHECK ADD  CONSTRAINT [FK_musicInfoMusicType] FOREIGN KEY([MusicType_MusicTypeId])
REFERENCES [dbo].[MusicType] ([MusicTypeId])
GO
ALTER TABLE [dbo].[musicInfo] CHECK CONSTRAINT [FK_musicInfoMusicType]
GO
ALTER TABLE [dbo].[NewsInfo]  WITH CHECK ADD  CONSTRAINT [FK_NewsInfo_NewsType] FOREIGN KEY([nTid])
REFERENCES [dbo].[NewsType] ([tid])
GO
ALTER TABLE [dbo].[NewsInfo] CHECK CONSTRAINT [FK_NewsInfo_NewsType]
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
