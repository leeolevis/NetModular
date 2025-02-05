USE [master]
GO
/****** Object:  Database [Nm_Admin]    Script Date: 2019/8/9 22:55:05 ******/
CREATE DATABASE [Nm_Admin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nm_Admin', FILENAME = N'D:\Database\SqlServer\Nm_Admin.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nm_Admin_log', FILENAME = N'D:\Database\SqlServer\Nm_Admin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Nm_Admin] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nm_Admin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nm_Admin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nm_Admin] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nm_Admin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nm_Admin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nm_Admin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nm_Admin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nm_Admin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nm_Admin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nm_Admin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nm_Admin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nm_Admin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nm_Admin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nm_Admin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nm_Admin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nm_Admin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nm_Admin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Nm_Admin] SET  MULTI_USER 
GO
ALTER DATABASE [Nm_Admin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nm_Admin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nm_Admin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nm_Admin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nm_Admin] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nm_Admin', N'ON'
GO
ALTER DATABASE [Nm_Admin] SET QUERY_STORE = OFF
GO
USE [Nm_Admin]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[LoginIP] [nvarchar](50) NOT NULL,
	[Status] [smallint] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[ClosedTime] [datetime] NOT NULL,
	[ClosedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK__account__3214EC071E3612B8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Role]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__account___3214EC073D3C30BD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditinfo]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditinfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [uniqueidentifier] NULL,
	[Area] [nvarchar](50) NOT NULL,
	[Controller] [nvarchar](50) NOT NULL,
	[ControllerDesc] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NOT NULL,
	[ActionDesc] [nvarchar](50) NULL,
	[Parameters] [nvarchar](max) NULL,
	[Result] [nvarchar](max) NULL,
	[ExecutionTime] [datetime] NOT NULL,
	[ExecutionDuration] [bigint] NOT NULL,
	[BrowserInfo] [nvarchar](500) NULL,
	[Platform] [smallint] NOT NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK__auditinf__3214EC07298C1FEC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Button]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button](
	[Id] [uniqueidentifier] NOT NULL,
	[MenuCode] [varchar](100) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](50) NULL,
	[Code] [nvarchar](100) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__button__3214EC072D40EF87] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Button_Permission]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ButtonCode] [varchar](100) NOT NULL,
	[PermissionCode] [varchar](200) NOT NULL,
 CONSTRAINT [PK__button_p__3214EC07808728BE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](500) NULL,
	[Remarks] [nvarchar](255) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__config__3214EC07FEE4C807] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [uniqueidentifier] NOT NULL,
	[ModuleCode] [nvarchar](50) NOT NULL,
	[Type] [smallint] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RouteName] [nvarchar](100) NOT NULL,
	[RouteParams] [nvarchar](300) NULL,
	[RouteQuery] [nvarchar](300) NULL,
	[Icon] [nvarchar](20) NOT NULL,
	[IconColor] [nvarchar](10) NULL,
	[Url] [nvarchar](255) NOT NULL,
	[Level] [int] NOT NULL,
	[Show] [bit] NOT NULL,
	[Sort] [int] NOT NULL,
	[Target] [smallint] NOT NULL,
	[DialogWidth] [nvarchar](20) NULL,
	[DialogHeight] [nvarchar](20) NULL,
	[DialogFullscreen] [bit] NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__menu__3214EC0779FF22F5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Permission]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuCode] [varchar](100) NOT NULL,
	[PermissionCode] [varchar](200) NOT NULL,
 CONSTRAINT [PK__menu_per__3214EC07AB759BF9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moduleinfo]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moduleinfo](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](200) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__modulein__3214EC07EFDFDD04] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ModuleCode] [nvarchar](50) NOT NULL,
	[Controller] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[HttpMethod] [smallint] NULL,
	[Code] [varchar](200) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__permissi__3214EC07495D53C6] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK__role__3214EC07950A42FF] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Menu]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__role_men__3214EC07821D4003] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Menu_Button]    Script Date: 2019/8/9 22:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Menu_Button](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[ButtonId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__role_men__3214EC0755A8E868] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Id], [Type], [UserName], [Password], [Name], [Phone], [Email], [LoginTime], [LoginIP], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [ClosedTime], [ClosedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', 0, N'admin', N'E739279CB28CDAFD7373618313803524', N'管理员', N'', N'', CAST(N'2019-08-09T22:50:58.950' AS DateTime), N'0.0.0.1', 1, CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-04-18T17:30:57.000' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', 0, CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
SET IDENTITY_INSERT [dbo].[Account_Role] ON 

INSERT [dbo].[Account_Role] ([Id], [AccountId], [RoleId]) VALUES (2, N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d')
SET IDENTITY_INSERT [dbo].[Account_Role] OFF
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6d48e80c-da4d-d915-4fe4-39ef5d638931', N'admin_moduleinfo', N'同步', N'refresh', N'admin_moduleinfo_sync', CAST(N'2019-08-01T11:26:11.250' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:11.250' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f3e43fc9-608f-92dc-91e1-39ef5d638937', N'admin_moduleinfo', N'删除', N'delete', N'admin_moduleinfo_del', CAST(N'2019-08-01T11:26:11.257' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:11.257' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6b9fd4fd-3769-6369-a879-39ef5d63c1ce', N'admin_permission', N'同步', N'refresh', N'admin_permission_sync', CAST(N'2019-08-01T11:26:25.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:25.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'89dbcee1-9d98-34cd-834c-39ef5d63dfda', N'admin_menu', N'添加', N'add', N'admin_menu_add', CAST(N'2019-08-01T11:26:33.433' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:33.433' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'23510d36-c147-1ac3-bf3c-39ef5d63dfdd', N'admin_menu', N'编辑', N'edit', N'admin_menu_edit', CAST(N'2019-08-01T11:26:33.437' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:33.437' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'41d22c0b-42a2-63ac-09c4-39ef5d63dfe8', N'admin_menu', N'删除', N'delete', N'admin_menu_del', CAST(N'2019-08-01T11:26:33.450' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:33.450' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'64e4e23d-9737-c3d3-61f2-39ef5d63dfec', N'admin_menu', N'排序', N'sort', N'admin_menu_sort', CAST(N'2019-08-01T11:26:33.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:33.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'bcca0fe2-98a1-f0f5-2fcc-39ef5d641643', N'admin_role', N'添加', N'add', N'admin_role_add', CAST(N'2019-08-01T11:26:47.363' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:47.363' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'fc209f25-69b1-ce42-5a4c-39ef5d64164d', N'admin_role', N'编辑', N'edit', N'admin_role_edit', CAST(N'2019-08-01T11:26:47.373' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:47.373' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5ec181c6-84ff-a50f-d11a-39ef5d641657', N'admin_role', N'删除', N'delete', N'admin_role_del', CAST(N'2019-08-01T11:26:47.383' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:47.383' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'33554ab7-156f-c6d5-b8e4-39ef5d64165f', N'admin_role', N'绑定菜单', N'bind', N'admin_role_bind_menu', CAST(N'2019-08-01T11:26:47.393' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:47.393' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'589e1573-49b4-dc4c-42a4-39ef5d642b7f', N'admin_account', N'添加', N'add', N'admin_account_add', CAST(N'2019-08-01T11:26:52.800' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:52.800' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd0dd01ee-ee8b-8d6c-9b51-39ef5d642b8a', N'admin_account', N'编辑', N'edit', N'admin_account_edit', CAST(N'2019-08-01T11:26:52.810' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:52.810' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ddcd08a9-4efe-c4bc-caea-39ef5d642b8e', N'admin_account', N'删除', N'delete', N'admin_account_del', CAST(N'2019-08-01T11:26:52.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:52.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'fd515dc7-8219-102b-350d-39ef5d642b95', N'admin_account', N'重置密码', N'refresh', N'admin_account_reset_password', CAST(N'2019-08-01T11:26:52.820' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:52.820' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'91c48748-3e25-1aa0-96dd-39ef5d64d363', N'admin_auditinfo', N'详情', N'detail', N'admin_auditinfo_details', CAST(N'2019-08-01T11:27:35.780' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:27:35.780' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'20663365-6d64-b04a-9697-39ef5d661a1a', N'admin_config', N'添加', N'add', N'admin_config_add', CAST(N'2019-08-01T11:28:59.420' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T17:08:22.603' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8c77bca9-1722-8c16-898f-39ef5d661a23', N'admin_config', N'编辑', N'edit', N'admin_config_edit', CAST(N'2019-08-01T11:28:59.427' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T17:08:22.617' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ff2db547-7c95-cb53-85ef-39ef5d661a26', N'admin_config', N'删除', N'delete', N'admin_config_del', CAST(N'2019-08-01T11:28:59.430' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T17:08:22.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'83a4a5a8-85fe-16ec-b6ad-39ef5dd70244', N'codegenerator_project', N'添加', N'add', N'codegenerator_project_add', CAST(N'2019-08-01T13:32:18.883' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:51.177' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3791a0e2-8b47-1624-ae7f-39ef5dd70247', N'codegenerator_project', N'编辑', N'edit', N'codegenerator_project_edit', CAST(N'2019-08-01T13:32:18.887' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:51.190' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b4e3e507-930e-2cc8-1dd5-39ef5dd7024e', N'codegenerator_project', N'删除', N'delete', N'codegenerator_project_del', CAST(N'2019-08-01T13:32:18.893' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:51.203' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3dd730ff-6d7b-7816-b712-39ef5dd70256', N'codegenerator_project', N'生成', N'download', N'codegenerator_project_build_code', CAST(N'2019-08-01T13:32:18.903' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:51.203' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'119b7837-d5a1-56ea-057a-39ef5dd72328', N'codegenerator_enum', N'添加', N'add', N'codegenerator_enum_add', CAST(N'2019-08-01T13:32:27.303' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:55.080' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'130946e5-bfb1-9544-3b31-39ef5dd72330', N'codegenerator_enum', N'编辑', N'edit', N'codegenerator_enum_edit', CAST(N'2019-08-01T13:32:27.313' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:55.083' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6aa7cc7b-3f35-d0b5-12dc-39ef5dd72334', N'codegenerator_enum', N'删除', N'delete', N'codegenerator_enum_del', CAST(N'2019-08-01T13:32:27.317' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:55.087' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'69c7ed85-b5f1-4df0-e346-39ef5e4656a5', N'common_attachment', N'删除', N'delete', N'common_attachment_del', CAST(N'2019-08-01T15:33:54.980' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:33:54.980' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1f81afe3-7322-35d1-5427-39ef5e4656a9', N'common_attachment', N'导出', N'export', N'common_attachment_export', CAST(N'2019-08-01T15:33:54.987' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:33:54.987' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0cc19790-fd06-11a0-83b6-39ef5e478299', N'common_area', N'添加', N'add', N'common_area_add', CAST(N'2019-08-01T15:35:11.770' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:35:11.770' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'651257d9-a57b-c11c-51d7-39ef5e47829b', N'common_area', N'编辑', N'edit', N'common_area_edit', CAST(N'2019-08-01T15:35:11.770' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:35:11.770' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'146809bb-4747-93b2-7487-39ef5e47829c', N'common_area', N'删除', N'delete', N'common_area_del', CAST(N'2019-08-01T15:35:11.773' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:35:11.773' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3823dc51-7e60-6661-b404-39ef630387b6', N'personnelfiles_company', N'添加', N'add', N'personnelfiles_company_add', CAST(N'2019-08-02T13:39:02.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:39:02.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'759aa692-2fd3-ee2c-eb5f-39ef630387c2', N'personnelfiles_company', N'编辑', N'edit', N'personnelfiles_company_edit', CAST(N'2019-08-02T13:39:02.723' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:39:02.723' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'bb24087c-d8bf-398f-3809-39ef630387ca', N'personnelfiles_company', N'删除', N'delete', N'personnelfiles_company_del', CAST(N'2019-08-02T13:39:02.730' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:39:02.730' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3d1ac993-f208-9cc9-751c-39ef63079f8e', N'personnelfiles_department', N'添加', N'add', N'personnelfiles_department_add', CAST(N'2019-08-02T13:43:30.960' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:30.960' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b54364c5-413b-cac1-dda6-39ef63079f9e', N'personnelfiles_department', N'编辑', N'edit', N'personnelfiles_department_edit', CAST(N'2019-08-02T13:43:30.973' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:30.973' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6a4c07ff-f990-45ff-a93b-39ef63079fa2', N'personnelfiles_department', N'删除', N'delete', N'personnelfiles_department_del', CAST(N'2019-08-02T13:43:30.977' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:30.977' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b2380156-bca7-ca55-361e-39ef63079fa7', N'personnelfiles_department', N'岗位', N'edit', N'personnelfiles_department_position', CAST(N'2019-08-02T13:43:30.983' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:30.983' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7ba8f4f6-fe45-918e-5a3c-39ef63079fac', N'personnelfiles_department', N'岗位添加', N'add', N'personnelfiles_department_position_add', CAST(N'2019-08-02T13:43:30.990' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:30.990' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'56aadff1-f9df-4513-0b5f-39ef63079faf', N'personnelfiles_department', N'岗位编辑', N'edit', N'personnelfiles_department_position_edit', CAST(N'2019-08-02T13:43:30.993' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:30.993' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'34ec6ba4-cf9b-5f8b-e9c5-39ef63079fb4', N'personnelfiles_department', N'岗位删除', N'delete', N'personnelfiles_department_position_del', CAST(N'2019-08-02T13:43:30.997' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:30.997' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'db171c47-9cbb-902b-d082-39ef6307bf37', N'personnelfiles_position', N'删除', N'delete', N'personnelfiles_position_del', CAST(N'2019-08-02T13:43:39.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:39.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'945cfb1a-50f5-8054-d581-39ef6307ef93', N'personnelfiles_user', N'添加', N'add', N'personnelfiles_user_add', CAST(N'2019-08-02T13:43:51.443' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:51.443' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f392fb83-1564-05c6-15cf-39ef6307ef9e', N'personnelfiles_user', N'编辑', N'edit', N'personnelfiles_user_edit', CAST(N'2019-08-02T13:43:51.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:51.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e9537a96-4222-3cf6-9289-39ef6307efa1', N'personnelfiles_user', N'删除', N'delete', N'personnelfiles_user_del', CAST(N'2019-08-02T13:43:51.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:51.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'00c434f0-862b-8ecd-0086-39ef6307efa6', N'personnelfiles_user', N'工作经历', N'work', N'personnelfiles_user_work_history', CAST(N'2019-08-02T13:43:51.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:51.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7f4c26ec-d840-1f90-899d-39ef6307efae', N'personnelfiles_user', N'教育经历', N'education', N'personnelfiles_user_education_history', CAST(N'2019-08-02T13:43:51.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:51.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c7562df4-f09f-31a8-01cf-39ef788b82be', N'quartz_group', N'添加', N'add', N'quartz_group_add', CAST(N'2019-08-06T17:59:35.870' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T17:59:35.870' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cfaf46e6-5673-e919-0b99-39ef788b82d2', N'quartz_group', N'删除', N'delete', N'quartz_group_del', CAST(N'2019-08-06T17:59:35.890' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T17:59:35.890' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'847f11b0-ca45-d702-d185-39ef788bf4cb', N'quartz_job', N'添加', N'add', N'quartz_job_add', CAST(N'2019-08-06T18:00:05.067' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:05.067' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0c5ca34c-db1a-0ecc-5b99-39ef788bf4d5', N'quartz_job', N'编辑', N'edit', N'quartz_job_edit', CAST(N'2019-08-06T18:00:05.077' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:05.077' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd44ec598-b5f0-7c38-a5ff-39ef788bf4e1', N'quartz_job', N'暂停', N'pause', N'quartz_job_pause', CAST(N'2019-08-06T18:00:05.090' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:05.090' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2b9f21ab-b24e-f473-358f-39ef788bf4e5', N'quartz_job', N'启动', N'run', N'quartz_job_resume', CAST(N'2019-08-06T18:00:05.093' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:05.093' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4891dfb8-3583-5cee-cb70-39ef788bf4fa', N'quartz_job', N'日志', N'log', N'quartz_job_log', CAST(N'2019-08-06T18:00:05.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:05.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd5d2c3ca-38a6-a3ca-5091-39ef788bf500', N'quartz_job', N'删除', N'delete', N'quartz_job_del', CAST(N'2019-08-06T18:00:05.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:05.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
SET IDENTITY_INSERT [dbo].[Button_Permission] ON 

INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (1, N'admin_moduleinfo_sync', N'admin_moduleinfo_sync_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (2, N'admin_moduleinfo_del', N'admin_moduleinfo_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (3, N'admin_permission_sync', N'admin_permission_sync_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (4, N'admin_menu_add', N'admin_menu_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (5, N'admin_menu_edit', N'admin_menu_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (6, N'admin_menu_edit', N'admin_menu_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (7, N'admin_menu_del', N'admin_menu_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (8, N'admin_menu_sort', N'admin_menu_sort_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (9, N'admin_menu_sort', N'admin_menu_sort_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (10, N'admin_role_add', N'admin_role_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (11, N'admin_role_edit', N'admin_role_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (12, N'admin_role_edit', N'admin_role_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (13, N'admin_role_del', N'admin_role_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (14, N'admin_role_bind_menu', N'admin_role_menulist_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (15, N'admin_role_bind_menu', N'admin_role_bindmenu_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (16, N'admin_role_bind_menu', N'admin_role_menubuttonlist_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (17, N'admin_role_bind_menu', N'admin_role_bindmenubutton_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (18, N'admin_account_add', N'admin_account_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (19, N'admin_account_edit', N'admin_account_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (20, N'admin_account_edit', N'admin_account_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (21, N'admin_account_del', N'admin_account_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (22, N'admin_account_reset_password', N'admin_account_updatepassword_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (27, N'admin_auditinfo_details', N'admin_auditinfo_details_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (49, N'common_attachment_del', N'common_attachment_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (50, N'common_attachment_export', N'common_attachment_export_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (51, N'common_area_add', N'common_area_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (52, N'common_area_edit', N'common_area_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (53, N'common_area_edit', N'common_area_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (54, N'common_area_del', N'common_area_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (55, N'admin_config_add', N'admin_config_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (56, N'admin_config_edit', N'admin_config_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (57, N'admin_config_edit', N'admin_config_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (58, N'admin_config_del', N'admin_config_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (64, N'personnelfiles_company_add', N'personnelfiles_company_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (65, N'personnelfiles_company_edit', N'personnelfiles_company_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (66, N'personnelfiles_company_edit', N'personnelfiles_company_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (67, N'personnelfiles_company_del', N'personnelfiles_company_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (68, N'personnelfiles_department_add', N'personnelfiles_department_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (69, N'personnelfiles_department_edit', N'personnelfiles_department_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (70, N'personnelfiles_department_edit', N'personnelfiles_department_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (71, N'personnelfiles_department_del', N'personnelfiles_department_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (72, N'personnelfiles_department_position', N'personnelfiles_position_query_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (73, N'personnelfiles_department_position_add', N'personnelfiles_position_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (74, N'personnelfiles_department_position_edit', N'personnelfiles_position_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (75, N'personnelfiles_department_position_edit', N'personnelfiles_position_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (76, N'personnelfiles_department_position_del', N'personnelfiles_position_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (77, N'personnelfiles_position_del', N'personnelfiles_position_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (78, N'personnelfiles_user_add', N'personnelfiles_user_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (79, N'personnelfiles_user_add', N'personnelfiles_user_uploadpicture_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (80, N'personnelfiles_user_edit', N'personnelfiles_user_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (81, N'personnelfiles_user_edit', N'personnelfiles_user_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (82, N'personnelfiles_user_edit', N'personnelfiles_user_uploadpicture_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (83, N'personnelfiles_user_edit', N'personnelfiles_user_editcontact_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (84, N'personnelfiles_user_edit', N'personnelfiles_user_updatecontact_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (85, N'personnelfiles_user_edit', N'personnelfiles_user_contactdetails_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (86, N'personnelfiles_user_del', N'personnelfiles_user_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (87, N'personnelfiles_user_work_history', N'personnelfiles_userworkhistory_query_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (88, N'personnelfiles_user_work_history', N'personnelfiles_userworkhistory_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (89, N'personnelfiles_user_work_history', N'personnelfiles_userworkhistory_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (90, N'personnelfiles_user_work_history', N'personnelfiles_userworkhistory_update_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (91, N'personnelfiles_user_work_history', N'personnelfiles_userworkhistory_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (92, N'personnelfiles_user_education_history', N'personnelfiles_usereducationhistory_query_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (93, N'personnelfiles_user_education_history', N'personnelfiles_usereducationhistory_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (94, N'personnelfiles_user_education_history', N'personnelfiles_usereducationhistory_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (95, N'personnelfiles_user_education_history', N'personnelfiles_usereducationhistory_update_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (96, N'personnelfiles_user_education_history', N'personnelfiles_usereducationhistory_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (97, N'quartz_group_add', N'quartz_group_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (98, N'quartz_group_del', N'quartz_group_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (99, N'quartz_job_add', N'quartz_job_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (100, N'quartz_job_edit', N'quartz_job_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (101, N'quartz_job_edit', N'quartz_job_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (102, N'quartz_job_pause', N'quartz_job_pause_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (103, N'quartz_job_resume', N'quartz_job_resume_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (104, N'quartz_job_log', N'quartz_job_log_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (105, N'quartz_job_del', N'quartz_job_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (106, N'codegenerator_project_add', N'codegenerator_project_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (107, N'codegenerator_project_edit', N'codegenerator_project_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (108, N'codegenerator_project_edit', N'codegenerator_project_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (109, N'codegenerator_project_del', N'codegenerator_project_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (110, N'codegenerator_project_build_code', N'codegenerator_project_buildcode_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (111, N'codegenerator_enum_add', N'codegenerator_enum_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (112, N'codegenerator_enum_edit', N'codegenerator_enum_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (113, N'codegenerator_enum_edit', N'codegenerator_enum_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (114, N'codegenerator_enum_del', N'codegenerator_enum_delete_delete')
SET IDENTITY_INSERT [dbo].[Button_Permission] OFF
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (1, N'sys_button_permission', N'True', N'启用按钮权限', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-08-01T15:31:02.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (3, N'sys_auditing', N'True', N'启用审计日志', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-08-01T15:31:02.153' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (4, N'sys_toolbar_skin', N'False', N'显示工具栏皮肤按钮', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-08-01T15:31:02.167' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (5, N'sys_title', N'通用权限管理系统', N'系统标题', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-08-01T15:31:02.103' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (6, N'sys_toolbar_fullscreen', N'True', N'显示工具栏全屏按钮', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-08-01T15:31:02.163' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (7, N'sys_home', N'/admin/home', N'系统首页', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-08-01T15:31:02.123' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (8, N'sys_verify_code', N'False', N'启用登录验证码功能', CAST(N'2019-05-06T09:11:35.000' AS DateTime), N'39ed5ab3-0c91-a26c-2f8a-a3b723ef422a', CAST(N'2019-08-01T15:31:02.157' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (9, N'sys_toolbar_userinfo', N'True', N'显示工具栏用户信息按钮', CAST(N'2019-05-06T09:35:48.000' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:02.173' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (10, N'sys_toolbar_logout', N'True', N'显示工具栏退出按钮', CAST(N'2019-05-06T09:35:48.000' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:02.170' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (11, N'sys_userinfo_page', N'', N'个人信息页', CAST(N'2019-06-14T13:47:55.000' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:02.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (12, N'sys_toolbar_customcss', N'', N'自定义CSS样式', CAST(N'2019-06-20T19:20:08.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:02.180' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (13, N'sys_logo', N'', N'系统Logo', CAST(N'2019-06-27T17:32:34.077' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:02.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (14, N'sys_permission_validate', N'True', N'启用权限验证功能', CAST(N'2019-08-01T13:12:11.597' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:02.150' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
SET IDENTITY_INSERT [dbo].[Config] OFF
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7b3e4dc4-506e-b7b9-ef52-39ef5d621bd1', N'', 0, N'00000000-0000-0000-0000-000000000000', N'权限管理', N'', N'', N'', N'permission', N'', N'', 0, 1, 2, -1, N'', N'', 1, N'', CAST(N'2019-08-01T11:24:37.697' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:41.077' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7241bb5b-afe9-6e12-9991-39ef5d638918', N'Admin', 1, N'7b3e4dc4-506e-b7b9-ef52-39ef5d621bd1', N'模块管理', N'admin_moduleinfo', N'', N'', N'product', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-08-01T11:26:11.223' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:11.223' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e3bd0255-2542-b595-8c5c-39ef5d63c1bd', N'Admin', 1, N'7b3e4dc4-506e-b7b9-ef52-39ef5d621bd1', N'权限列表', N'admin_permission', N'', N'', N'verifycode', N'', N'', 1, 1, 1, 0, N'', N'', 1, N'', CAST(N'2019-08-01T11:26:25.723' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:25.723' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'040b5af2-f9d5-dc1f-920f-39ef5d63dfc9', N'Admin', 1, N'7b3e4dc4-506e-b7b9-ef52-39ef5d621bd1', N'菜单管理', N'admin_menu', N'', N'', N'menu', N'', N'', 1, 1, 2, 0, N'', N'', 1, N'', CAST(N'2019-08-01T11:26:33.417' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:33.417' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'85334641-9195-3a5a-fcea-39ef5d64161b', N'Admin', 1, N'7b3e4dc4-506e-b7b9-ef52-39ef5d621bd1', N'角色管理', N'admin_role', N'', N'', N'role', N'', N'', 1, 1, 3, 0, N'', N'', 1, N'', CAST(N'2019-08-01T11:26:47.320' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:47.320' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5195a031-4376-68ce-1c6c-39ef5d642b66', N'Admin', 1, N'7b3e4dc4-506e-b7b9-ef52-39ef5d621bd1', N'账户管理', N'admin_account', N'', N'', N'user', N'', N'', 1, 1, 4, 0, N'', N'', 1, N'', CAST(N'2019-08-01T11:26:52.767' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:26:52.767' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c5254bf6-6217-7391-731b-39ef5d646840', N'', 0, N'00000000-0000-0000-0000-000000000000', N'系统管理', N'', N'', N'', N'system', N'', N'', 0, 1, 4, -1, N'', N'', 1, N'', CAST(N'2019-08-01T11:27:08.350' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:41.080' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9303fd20-668d-4729-c865-39ef5d649fb8', N'Admin', 1, N'c5254bf6-6217-7391-731b-39ef5d646840', N'系统配置', N'admin_system', N'', N'', N'system', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-08-01T11:27:22.553' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:27:54.130' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'eb58188f-24e2-1a91-71b0-39ef5d64b0ee', N'Admin', 1, N'c5254bf6-6217-7391-731b-39ef5d646840', N'配置项管理', N'admin_config', N'', N'', N'tag', N'', N'', 1, 1, 1, 0, N'', N'', 1, N'', CAST(N'2019-08-01T11:27:26.957' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T17:08:22.560' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a96cfca1-0ff1-f8cd-6fad-39ef5d64d352', N'Admin', 1, N'c5254bf6-6217-7391-731b-39ef5d646840', N'审计日志', N'admin_auditinfo', N'', N'', N'log', N'', N'', 1, 1, 2, 0, N'', N'', 1, N'', CAST(N'2019-08-01T11:27:35.763' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:27:35.763' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c6196255-5793-c17b-3b3a-39ef5d64f01d', N'Admin', 1, N'c5254bf6-6217-7391-731b-39ef5d646840', N'图标管理', N'admin_icon', N'', N'', N'icon', N'', N'', 1, 1, 3, 0, N'', N'', 1, N'', CAST(N'2019-08-01T11:27:43.133' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T11:27:43.133' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a7bd5903-ff4a-d048-5acd-39ef5dd4846b', N'', 0, N'00000000-0000-0000-0000-000000000000', N'代码生成', N'', N'', N'', N'develop', N'', N'', 0, 1, 5, -1, N'', N'', 1, N'', CAST(N'2019-08-01T13:29:35.593' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:41.080' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f66f43cc-8b96-f728-cdb6-39ef5dd6c36e', N'CodeGenerator', 1, N'a7bd5903-ff4a-d048-5acd-39ef5dd4846b', N'枚举列表', N'codegenerator_enum', N'', N'', N'tag', N'', N'', 1, 1, 1, 0, N'', N'', 1, N'', CAST(N'2019-08-01T13:32:02.773' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:55.057' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4e6093ec-219c-dce0-98db-39ef5dd70232', N'CodeGenerator', 1, N'a7bd5903-ff4a-d048-5acd-39ef5dd4846b', N'项目列表', N'codegenerator_project', N'', N'', N'project', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-08-01T13:32:18.867' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:51.110' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd9591178-238a-4775-5df2-39ef5e444262', N'', 0, N'00000000-0000-0000-0000-000000000000', N'基础数据', N'', N'', N'', N'database', N'', N'', 0, 1, 3, -1, N'', N'', 1, N'', CAST(N'2019-08-01T15:31:38.723' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:41.077' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'03c3673a-2fda-7005-c81f-39ef5e45aca5', N'Common', 1, N'd9591178-238a-4775-5df2-39ef5e444262', N'区划代码', N'common_area', N'', N'', N'area', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-08-01T15:33:11.443' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:35:11.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'521baf65-dd56-6feb-90c3-39ef5e46568b', N'Common', 1, N'd9591178-238a-4775-5df2-39ef5e444262', N'附件管理', N'common_attachment', N'', N'', N'attachment', N'', N'', 1, 1, 1, 0, N'', N'', 1, N'', CAST(N'2019-08-01T15:33:54.957' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:33:54.957' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'75d8c1dc-8f61-cbca-80f0-39ef62fb2550', N'', 0, N'00000000-0000-0000-0000-000000000000', N'人事档案', N'', N'', N'', N'archives', N'', N'', 0, 1, 0, -1, N'', N'', 1, N'', CAST(N'2019-08-02T13:29:53.233' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:41.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'72e3d2c8-af4a-8f18-0ffb-39ef6303876a', N'PersonnelFiles', 1, N'75d8c1dc-8f61-cbca-80f0-39ef62fb2550', N'公司单位', N'personnelfiles_company', N'', N'', N'enterprise', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-08-02T13:39:02.607' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:39:02.607' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'aacbd69c-3a4d-f09b-9df3-39ef63079f3f', N'PersonnelFiles', 1, N'75d8c1dc-8f61-cbca-80f0-39ef62fb2550', N'部门列表', N'personnelfiles_department', N'', N'', N'department', N'', N'', 1, 1, 1, 0, N'', N'', 1, N'', CAST(N'2019-08-02T13:43:30.860' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:30.860' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'95992f25-2a67-e7c1-a123-39ef6307bf1b', N'PersonnelFiles', 1, N'75d8c1dc-8f61-cbca-80f0-39ef62fb2550', N'岗位列表', N'personnelfiles_position', N'', N'', N'post', N'', N'', 1, 1, 2, 0, N'', N'', 1, N'', CAST(N'2019-08-02T13:43:39.033' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:39.033' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd0bd19f3-a5dd-06f8-3bf0-39ef6307ef82', N'PersonnelFiles', 1, N'75d8c1dc-8f61-cbca-80f0-39ef62fb2550', N'用户管理', N'personnelfiles_user', N'', N'', N'user', N'', N'', 1, 1, 3, 0, N'', N'', 1, N'', CAST(N'2019-08-02T13:43:51.423' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:43:51.423' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'fc313376-c2c3-5545-4942-39ef788b4b77', N'', 0, N'00000000-0000-0000-0000-000000000000', N'任务调度', N'', N'', N'', N'timer', N'', N'', 0, 1, 1, -1, N'', N'', 1, N'', CAST(N'2019-08-06T17:59:21.720' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:41.077' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'badc5903-7033-d966-4fc0-39ef788b828f', N'Quartz', 1, N'fc313376-c2c3-5545-4942-39ef788b4b77', N'任务组', N'quartz_group', N'', N'', N'group', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-08-06T17:59:35.807' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T17:59:35.807' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'44811e83-b1b4-ef27-936b-39ef788bf4b6', N'Quartz', 1, N'fc313376-c2c3-5545-4942-39ef788b4b77', N'任务列表', N'quartz_job', N'', N'', N'project', N'', N'', 1, 1, 1, 0, N'', N'', 1, N'', CAST(N'2019-08-06T18:00:05.043' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T18:00:05.043' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ada4fc6d-4b8b-efb3-beab-39ef7c944837', N'Common', 1, N'd9591178-238a-4775-5df2-39ef5e444262', N'区划代码示例', N'common_area_demo', N'', N'', N'develop', N'', N'', 1, 1, 2, 0, N'', N'', 1, N'', CAST(N'2019-08-07T12:47:39.543' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-07T12:47:39.543' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
SET IDENTITY_INSERT [dbo].[Menu_Permission] ON 

INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (3, N'admin_moduleinfo', N'admin_moduleinfo_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (4, N'admin_permission', N'admin_permission_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (5, N'admin_menu', N'admin_menu_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (6, N'admin_menu', N'admin_menu_tree_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (7, N'admin_role', N'admin_role_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (8, N'admin_account', N'admin_account_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (11, N'admin_auditinfo', N'admin_auditinfo_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (12, N'admin_system', N'admin_system_config_post')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (18, N'common_attachment', N'common_attachment_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (19, N'common_area', N'common_area_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (20, N'common_area', N'common_area_querychildren_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (21, N'admin_config', N'admin_config_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (27, N'personnelfiles_company', N'personnelfiles_company_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (28, N'personnelfiles_department', N'personnelfiles_department_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (29, N'personnelfiles_department', N'personnelfiles_department_tree_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (30, N'personnelfiles_user', N'personnelfiles_user_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (31, N'quartz_group', N'quartz_group_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (32, N'quartz_job', N'quartz_job_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (33, N'codegenerator_project', N'codegenerator_project_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (34, N'codegenerator_enum', N'codegenerator_enum_query_get')
SET IDENTITY_INSERT [dbo].[Menu_Permission] OFF
INSERT [dbo].[Moduleinfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b7e36bf1-3a10-daa1-b8f4-39ef5d625502', N'权限管理', N'Admin', N'1.0.10', N'', CAST(N'2019-08-01T11:24:52.323' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T17:57:48.770' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Moduleinfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'062430dc-0caf-d245-547a-39ef5dd4ade3', N'代码生成器', N'CodeGenerator', N'1.0.4', NULL, CAST(N'2019-08-01T13:29:46.203' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T13:29:46.203' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Moduleinfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9e1d230f-de6e-c6af-660a-39ef5e447d3e', N'通用模块', N'Common', N'1.0.6', NULL, CAST(N'2019-08-01T15:31:53.787' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:53.787' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Moduleinfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8a96796d-9645-5c43-24a2-39ef62f968bf', N'人事档案', N'PersonnelFiles', N'1.0.3', N'', CAST(N'2019-08-02T13:27:59.417' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-02T13:28:53.687' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Moduleinfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'83af004f-93ab-2674-e68c-39ef7889a888', N'任务调度模块', N'Quartz', N'1.0.0', N'', CAST(N'2019-08-06T17:57:34.467' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T17:57:48.793' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c619b5e2-ea0e-bcf0-7bad-39ef5d627a10', N'账户管理_绑定角色', N'Admin', N'Account', N'BindRole', 2, N'admin_account_bindrole_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.563' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b369e0a7-38e4-651d-acfa-39ef5d627a27', N'账户管理_查询', N'Admin', N'Account', N'Query', 0, N'admin_account_query_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.580' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ff06fe80-18f7-fd12-b5e6-39ef5d627a36', N'账户管理_添加', N'Admin', N'Account', N'Add', 2, N'admin_account_add_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.587' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ef0049b8-18ec-5507-7c82-39ef5d627a48', N'账户管理_编辑', N'Admin', N'Account', N'Edit', 0, N'admin_account_edit_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.600' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'05e4e6b8-9651-e946-3b67-39ef5d627a57', N'账户管理_更新', N'Admin', N'Account', N'Update', 2, N'admin_account_update_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.617' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4dd47492-1914-9118-727f-39ef5d627a60', N'账户管理_删除', N'Admin', N'Account', N'Delete', 3, N'admin_account_delete_delete', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.637' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7fb68987-6639-0f51-925a-39ef5d627a6d', N'账户管理_重置密码', N'Admin', N'Account', N'ResetPassword', 2, N'admin_account_resetpassword_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.657' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1f457041-376c-b7b1-8cc2-39ef5d627a7c', N'审计信息_查询', N'Admin', N'AuditInfo', N'Query', 0, N'admin_auditinfo_query_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.680' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7275192a-3790-c912-939f-39ef5d627a89', N'审计信息_详情', N'Admin', N'AuditInfo', N'Details', 0, N'admin_auditinfo_details_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.697' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'fe0d0528-cefb-8e63-956e-39ef5d627a9c', N'按钮管理_查询', N'Admin', N'Button', N'Query', 0, N'admin_button_query_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.717' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd1b93378-a9b4-27c7-a284-39ef5d627ab4', N'配置项管理_查询', N'Admin', N'Config', N'Query', 0, N'admin_config_query_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.737' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'81669d34-444e-e13a-4d5a-39ef5d627aca', N'配置项管理_添加', N'Admin', N'Config', N'Add', 2, N'admin_config_add_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.753' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2cf3772b-a2f9-c132-f6f5-39ef5d627ad2', N'配置项管理_删除', N'Admin', N'Config', N'Delete', 3, N'admin_config_delete_delete', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.773' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'129a6809-028c-85f2-2592-39ef5d627add', N'配置项管理_编辑', N'Admin', N'Config', N'Edit', 0, N'admin_config_edit_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.783' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'08bd9264-87d1-2c57-b6c0-39ef5d627ae2', N'配置项管理_修改', N'Admin', N'Config', N'Update', 2, N'admin_config_update_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.797' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f5b1a685-3b6f-3b60-7dac-39ef5d627aee', N'菜单管理_菜单树', N'Admin', N'Menu', N'Tree', 0, N'admin_menu_tree_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.800' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e20e9269-b134-f5f7-360b-39ef5d627af3', N'菜单管理_查询菜单列表', N'Admin', N'Menu', N'Query', 0, N'admin_menu_query_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.810' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3cd7a637-fd5f-e24b-95ab-39ef5d627afc', N'菜单管理_添加', N'Admin', N'Menu', N'Add', 2, N'admin_menu_add_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c9f76401-5fe0-d762-95a7-39ef5d627b00', N'菜单管理_删除', N'Admin', N'Menu', N'Delete', 3, N'admin_menu_delete_delete', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.820' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'317a3877-63e9-1fe0-867b-39ef5d627b09', N'菜单管理_编辑', N'Admin', N'Menu', N'Edit', 0, N'admin_menu_edit_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.827' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'216167e1-05b6-79a1-a360-39ef5d627b0f', N'菜单管理_更新', N'Admin', N'Menu', N'Update', 2, N'admin_menu_update_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.830' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9fe9d26b-f72a-af71-c83a-39ef5d627b13', N'菜单管理_更新排序信息', N'Admin', N'Menu', N'Sort', 0, N'admin_menu_sort_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.847' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd33217dc-8c8c-bed2-923e-39ef5d627b19', N'菜单管理_更新排序信息', N'Admin', N'Menu', N'Sort', 2, N'admin_menu_sort_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.847' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1cc99a3a-c423-084f-6c29-39ef5d627b1d', N'模块信息_查询', N'Admin', N'ModuleInfo', N'Query', 0, N'admin_moduleinfo_query_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.850' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3eb2aed9-c9f7-3ba1-ec84-39ef5d627b23', N'模块信息_同步模块数据', N'Admin', N'ModuleInfo', N'Sync', 2, N'admin_moduleinfo_sync_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.857' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a0fbc30c-7d49-28b8-3df6-39ef5d627b29', N'模块信息_删除', N'Admin', N'ModuleInfo', N'Delete', 3, N'admin_moduleinfo_delete_delete', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.867' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9e609224-3cd8-19be-8d98-39ef5d627b2f', N'权限接口_查询', N'Admin', N'Permission', N'Query', 0, N'admin_permission_query_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.880' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2a3042b2-e359-e39f-c5a1-39ef5d627b32', N'权限接口_同步', N'Admin', N'Permission', N'Sync', 2, N'admin_permission_sync_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.893' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'021eb035-02ab-3f92-07ce-39ef5d627b3b', N'角色管理_查询', N'Admin', N'Role', N'Query', 0, N'admin_role_query_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.907' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'618a6b39-eea2-8eeb-1476-39ef5d627b3e', N'角色管理_添加', N'Admin', N'Role', N'Add', 2, N'admin_role_add_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.917' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9c63fafd-e5aa-4a99-f97f-39ef5d627b44', N'角色管理_删除', N'Admin', N'Role', N'Delete', 3, N'admin_role_delete_delete', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.927' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8cdbe98d-8e41-4be6-0e65-39ef5d627b49', N'角色管理_编辑', N'Admin', N'Role', N'Edit', 0, N'admin_role_edit_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.937' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'693571a7-255a-4b27-173e-39ef5d627b4f', N'角色管理_修改', N'Admin', N'Role', N'Update', 2, N'admin_role_update_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.950' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'30f9d469-f22e-1f44-2bb6-39ef5d627b53', N'角色管理_获取角色的关联菜单列表', N'Admin', N'Role', N'MenuList', 0, N'admin_role_menulist_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.960' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'64ea39ed-02a7-47af-d465-39ef5d627b5a', N'角色管理_绑定菜单', N'Admin', N'Role', N'BindMenu', 2, N'admin_role_bindmenu_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.973' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2ac5e60d-d577-95d1-64c9-39ef5d627b5e', N'角色管理_获取角色关联的菜单按钮列表', N'Admin', N'Role', N'MenuButtonList', 0, N'admin_role_menubuttonlist_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.983' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6de85b47-f74f-d46f-45d1-39ef5d627b61', N'角色管理_绑定菜单按钮', N'Admin', N'Role', N'BindMenuButton', 2, N'admin_role_bindmenubutton_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.997' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9dc95e2f-8c16-d910-4800-39ef5d627b6b', N'角色管理_下拉列表数据', N'Admin', N'Role', N'Select', 0, N'admin_role_select_get', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:15.867' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5441b8ee-60b1-f828-1b0d-39ef5d627b70', N'系统_修改系统配置', N'Admin', N'System', N'Config', 2, N'admin_system_config_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.007' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3dcd98f4-1c3a-c05c-4d7b-39ef5d627b74', N'系统_上传Logo', N'Admin', N'System', N'UploadLogo', 2, N'admin_system_uploadlogo_post', CAST(N'2019-08-01T11:25:01.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.017' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4a3d231d-0ba8-e2cf-54b1-39ef5dd3fdc5', N'实体管理_查询', N'CodeGenerator', N'Class', N'Query', 0, N'codegenerator_class_query_get', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.027' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f6577247-6048-f3c5-e134-39ef5dd3fdcf', N'实体管理_添加', N'CodeGenerator', N'Class', N'Add', 2, N'codegenerator_class_add_post', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.033' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'97d4f5f0-cb5d-4dc0-840a-39ef5dd3fdd3', N'实体管理_删除', N'CodeGenerator', N'Class', N'Delete', 3, N'codegenerator_class_delete_delete', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.043' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9b3b60c6-8d3d-bc00-7632-39ef5dd3fdda', N'实体管理_编辑', N'CodeGenerator', N'Class', N'Edit', 0, N'codegenerator_class_edit_get', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.050' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'728fa999-10a8-82ef-0c4d-39ef5dd3fdde', N'实体管理_修改', N'CodeGenerator', N'Class', N'Update', 2, N'codegenerator_class_update_post', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.057' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ad4ec759-8bde-e21b-ffa5-39ef5dd3fde5', N'实体管理_获取基类类型下拉列表', N'CodeGenerator', N'Class', N'BaseEntityTypeSelect', 0, N'codegenerator_class_baseentitytypeselect_get', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'04c9ace7-3e4d-41eb-f39b-39ef5dd3fde9', N'枚举管理_查询', N'CodeGenerator', N'Enum', N'Query', 0, N'codegenerator_enum_query_get', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.083' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'39077641-046d-e858-5287-39ef5dd3fdef', N'枚举管理_添加', N'CodeGenerator', N'Enum', N'Add', 2, N'codegenerator_enum_add_post', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.090' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8c609dd5-12d7-4f7b-6962-39ef5dd3fdf3', N'枚举管理_删除', N'CodeGenerator', N'Enum', N'Delete', 3, N'codegenerator_enum_delete_delete', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.097' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'582be2da-a5df-0a8d-328e-39ef5dd3fdfd', N'枚举管理_编辑', N'CodeGenerator', N'Enum', N'Edit', 0, N'codegenerator_enum_edit_get', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.103' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd87beee4-1ce2-02dc-6d78-39ef5dd3fe02', N'枚举管理_修改', N'CodeGenerator', N'Enum', N'Update', 2, N'codegenerator_enum_update_post', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.110' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8a326d0f-b48c-7271-3552-39ef5dd3fe07', N'枚举管理_下拉列表', N'CodeGenerator', N'Enum', N'Select', 0, N'codegenerator_enum_select_get', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b8b22c46-3650-20ad-7d98-39ef5dd3fe10', N'枚举项管理_查询', N'CodeGenerator', N'EnumItem', N'Query', 0, N'codegenerator_enumitem_query_get', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f117dfc0-2f68-36dd-d34f-39ef5dd3fe14', N'枚举项管理_添加', N'CodeGenerator', N'EnumItem', N'Add', 2, N'codegenerator_enumitem_add_post', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.130' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'19602767-141b-b09b-abfd-39ef5dd3fe17', N'枚举项管理_删除', N'CodeGenerator', N'EnumItem', N'Delete', 3, N'codegenerator_enumitem_delete_delete', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'73b518b2-f9ab-53d0-aa48-39ef5dd3fe1a', N'枚举项管理_编辑', N'CodeGenerator', N'EnumItem', N'Edit', 0, N'codegenerator_enumitem_edit_get', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.153' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1fb8051b-61fb-e64e-e778-39ef5dd3fe22', N'枚举项管理_修改', N'CodeGenerator', N'EnumItem', N'Update', 2, N'codegenerator_enumitem_update_post', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.167' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'02c5fbd8-639b-4399-784d-39ef5dd3fe29', N'枚举项管理_更新排序信息', N'CodeGenerator', N'EnumItem', N'Sort', 0, N'codegenerator_enumitem_sort_get', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.193' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'81089803-7022-ec7b-49e7-39ef5dd3fe2f', N'枚举项管理_更新排序信息', N'CodeGenerator', N'EnumItem', N'Sort', 2, N'codegenerator_enumitem_sort_post', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.193' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3b8c34bb-0deb-cc81-c4d9-39ef5dd3fe35', N'模型属性管理_查询', N'CodeGenerator', N'ModelProperty', N'Query', 0, N'codegenerator_modelproperty_query_get', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.200' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2d17ddc2-c036-aa7d-ca32-39ef5dd3fe3d', N'模型属性管理_添加', N'CodeGenerator', N'ModelProperty', N'Add', 2, N'codegenerator_modelproperty_add_post', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.213' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'63c1f81b-85c6-5a1c-5d12-39ef5dd3fe44', N'模型属性管理_删除', N'CodeGenerator', N'ModelProperty', N'Delete', 3, N'codegenerator_modelproperty_delete_delete', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.230' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5876c4f1-d963-024f-0979-39ef5dd3fe48', N'模型属性管理_编辑', N'CodeGenerator', N'ModelProperty', N'Edit', 0, N'codegenerator_modelproperty_edit_get', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.243' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'addefdc8-3b7b-3cfa-e6be-39ef5dd3fe52', N'模型属性管理_修改', N'CodeGenerator', N'ModelProperty', N'Update', 2, N'codegenerator_modelproperty_update_post', CAST(N'2019-08-01T13:29:00.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.257' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cc07a380-4d0c-d6f1-73aa-39ef5dd3fe58', N'模型属性管理_更新排序信息', N'CodeGenerator', N'ModelProperty', N'Sort', 0, N'codegenerator_modelproperty_sort_get', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.280' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8244853b-8743-6fc8-dc68-39ef5dd3fe5d', N'模型属性管理_更新排序信息', N'CodeGenerator', N'ModelProperty', N'Sort', 2, N'codegenerator_modelproperty_sort_post', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.280' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9ce31f93-f24a-2955-b3b6-39ef5dd3fe66', N'模型属性管理_修改可空状态', N'CodeGenerator', N'ModelProperty', N'UpdateNullable', 2, N'codegenerator_modelproperty_updatenullable_post', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.290' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e91f1f3e-51d2-f7dc-0700-39ef5dd3fe6b', N'模型属性管理_获取下拉列表', N'CodeGenerator', N'ModelProperty', N'Select', 0, N'codegenerator_modelproperty_select_get', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.293' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a9878b82-2654-a29e-a1aa-39ef5dd3fe72', N'模型属性管理_从实体中导入属性', N'CodeGenerator', N'ModelProperty', N'ImportFromEntity', 2, N'codegenerator_modelproperty_importfromentity_post', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.300' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e371630a-0283-7a96-2247-39ef5dd3fe78', N'项目管理_查询', N'CodeGenerator', N'Project', N'Query', 0, N'codegenerator_project_query_get', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.307' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5baa1f5d-0a2f-bde0-458e-39ef5dd3fe7c', N'项目管理_添加', N'CodeGenerator', N'Project', N'Add', 2, N'codegenerator_project_add_post', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.310' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c21ab362-ea3b-9a8f-3fb1-39ef5dd3fe82', N'项目管理_删除', N'CodeGenerator', N'Project', N'Delete', 3, N'codegenerator_project_delete_delete', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.317' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3a3ac770-a8e9-ed60-b2ee-39ef5dd3fe87', N'项目管理_编辑', N'CodeGenerator', N'Project', N'Edit', 0, N'codegenerator_project_edit_get', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.327' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'22b1090a-2b7e-0296-58ac-39ef5dd3fe8c', N'项目管理_修改', N'CodeGenerator', N'Project', N'Update', 2, N'codegenerator_project_update_post', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.330' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'274eb806-46d7-09f5-e1f9-39ef5dd3fe91', N'项目管理_生成代码', N'CodeGenerator', N'Project', N'BuildCode', 2, N'codegenerator_project_buildcode_post', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.337' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9bcff5e8-eaa6-8711-b8c0-39ef5dd3fe95', N'实体属性管理_查询', N'CodeGenerator', N'Property', N'Query', 0, N'codegenerator_property_query_get', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.343' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cb75804f-a86b-1d78-10c5-39ef5dd3fe9a', N'实体属性管理_添加', N'CodeGenerator', N'Property', N'Add', 2, N'codegenerator_property_add_post', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.347' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0c518559-d3c9-f259-a90b-39ef5dd3fea0', N'实体属性管理_删除', N'CodeGenerator', N'Property', N'Delete', 3, N'codegenerator_property_delete_delete', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.357' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'13b7e2ae-f375-fadd-1542-39ef5dd3fea9', N'实体属性管理_编辑', N'CodeGenerator', N'Property', N'Edit', 0, N'codegenerator_property_edit_get', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.380' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'702c8ec1-74a3-0a07-69ef-39ef5dd3fead', N'实体属性管理_修改', N'CodeGenerator', N'Property', N'Update', 2, N'codegenerator_property_update_post', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.393' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd9f0e440-45f1-3ba9-1d4a-39ef5dd3feb4', N'实体属性管理_获取属性类型下拉列表', N'CodeGenerator', N'Property', N'PropertyTypeSelect', 0, N'codegenerator_property_propertytypeselect_get', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.403' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'99d2cd5c-b03c-5f88-b74d-39ef5dd3febb', N'实体属性管理_更新排序信息', N'CodeGenerator', N'Property', N'Sort', 0, N'codegenerator_property_sort_get', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.433' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8b33e725-6dce-9ed3-5e1b-39ef5dd3fec1', N'实体属性管理_更新排序信息', N'CodeGenerator', N'Property', N'Sort', 2, N'codegenerator_property_sort_post', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.433' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3d611f13-d260-9bd5-f88c-39ef5dd3fec6', N'实体属性管理_修改可空状态', N'CodeGenerator', N'Property', N'UpdateNullable', 2, N'codegenerator_property_updatenullable_post', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.443' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'35073dc8-e0d2-1395-6f62-39ef5dd3fecb', N'实体属性管理_修改列表显示状态', N'CodeGenerator', N'Property', N'UpdateShowInList', 2, N'codegenerator_property_updateshowinlist_post', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4b48cefd-6321-75e5-4400-39ef5dd3fed0', N'实体属性管理_获取下拉列表', N'CodeGenerator', N'Property', N'Select', 0, N'codegenerator_property_select_get', CAST(N'2019-08-01T13:29:00.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9b13133a-8f1d-d18d-2720-39ef5e43e92f', N'区划代码管理_查询', N'Common', N'Area', N'Query', 0, N'common_area_query_get', CAST(N'2019-08-01T15:31:15.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.483' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'beeef6d0-9081-1004-8606-39ef5e43e936', N'区划代码管理_添加', N'Common', N'Area', N'Add', 2, N'common_area_add_post', CAST(N'2019-08-01T15:31:15.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.493' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b4e0de1b-505e-d542-59a1-39ef5e43e940', N'区划代码管理_删除', N'Common', N'Area', N'Delete', 3, N'common_area_delete_delete', CAST(N'2019-08-01T15:31:15.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.507' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'87924d14-2d33-aad9-7bd0-39ef5e43e946', N'区划代码管理_编辑', N'Common', N'Area', N'Edit', 0, N'common_area_edit_get', CAST(N'2019-08-01T15:31:15.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.520' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'65a64c15-fc86-10a5-93c0-39ef5e43e94e', N'区划代码管理_修改', N'Common', N'Area', N'Update', 2, N'common_area_update_post', CAST(N'2019-08-01T15:31:15.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.530' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cb3bab19-d961-495e-4c33-39ef5e43e954', N'区划代码管理_查询子节点', N'Common', N'Area', N'QueryChildren', 0, N'common_area_querychildren_get', CAST(N'2019-08-01T15:31:15.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:15.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4df121d8-c0d8-b66f-06f1-39ef5e43e95d', N'附件表管理_查询', N'Common', N'Attachment', N'Query', 0, N'common_attachment_query_get', CAST(N'2019-08-01T15:31:15.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.540' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7bac5a4e-6c15-8d6e-4115-39ef5e43e963', N'附件表管理_上传', N'Common', N'Attachment', N'Upload', 2, N'common_attachment_upload_post', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3e805ab1-982a-7241-ebcd-39ef5e43e968', N'附件表管理_下载', N'Common', N'Attachment', N'Download', 0, N'common_attachment_download_get', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'09b180fa-186f-9d2d-353b-39ef5e43e96d', N'附件表管理_导出', N'Common', N'Attachment', N'Export', 0, N'common_attachment_export_get', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b0a2ae7b-2ee1-68a8-7442-39ef5e43e972', N'字典管理_查询', N'Common', N'Dict', N'Query', 0, N'common_dict_query_get', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.547' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3ecf7ccf-dbc2-a970-2461-39ef5e43e977', N'字典管理_添加', N'Common', N'Dict', N'Add', 2, N'common_dict_add_post', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'628fc9ec-03af-6419-6015-39ef5e43e97e', N'字典管理_删除', N'Common', N'Dict', N'Delete', 3, N'common_dict_delete_delete', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.560' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'559b0158-1a70-7004-2fd1-39ef5e43e984', N'字典管理_编辑', N'Common', N'Dict', N'Edit', 0, N'common_dict_edit_get', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.563' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
GO
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7b90cfad-b7c4-6366-032a-39ef5e43e988', N'字典管理_修改', N'Common', N'Dict', N'Update', 2, N'common_dict_update_post', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.573' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0d9ae6f6-2756-427c-e009-39ef5e43e992', N'多媒体管理_查询', N'Common', N'MediaType', N'Query', 0, N'common_mediatype_query_get', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.580' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd952b3ab-c334-7be0-9894-39ef5e43e996', N'多媒体管理_添加', N'Common', N'MediaType', N'Add', 2, N'common_mediatype_add_post', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0fc74bd6-adb9-724b-6a86-39ef5e43e99b', N'多媒体管理_删除', N'Common', N'MediaType', N'Delete', 3, N'common_mediatype_delete_delete', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.590' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9b4c75ad-0d15-cad0-d5e5-39ef5e43e9a1', N'多媒体管理_编辑', N'Common', N'MediaType', N'Edit', 0, N'common_mediatype_edit_get', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.597' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'bed4cf2f-35e0-16ad-d089-39ef5e43e9a7', N'多媒体管理_修改', N'Common', N'MediaType', N'Update', 2, N'common_mediatype_update_post', CAST(N'2019-08-01T15:31:15.457' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.600' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'42c45fd2-644d-b620-85aa-39ef62facec8', N'公司单位管理_查询', N'PersonnelFiles', N'Company', N'Query', 0, N'personnelfiles_company_query_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.607' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5d0b68cd-e45d-8c26-e695-39ef62faced2', N'公司单位管理_添加', N'PersonnelFiles', N'Company', N'Add', 2, N'personnelfiles_company_add_post', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.613' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ac1e4ed1-d101-7bc6-3082-39ef62faced9', N'公司单位管理_删除', N'PersonnelFiles', N'Company', N'Delete', 3, N'personnelfiles_company_delete_delete', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.627' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e2233a82-5666-d50e-fab5-39ef62facede', N'公司单位管理_编辑', N'PersonnelFiles', N'Company', N'Edit', 0, N'personnelfiles_company_edit_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.637' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'953917c0-c2f3-4253-e7eb-39ef62facee3', N'公司单位管理_修改', N'PersonnelFiles', N'Company', N'Update', 2, N'personnelfiles_company_update_post', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.650' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'81ae0836-0886-2468-f72a-39ef62facee9', N'部门管理_部门树', N'PersonnelFiles', N'Department', N'Tree', 0, N'personnelfiles_department_tree_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.663' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ce548401-75f1-84b6-18e1-39ef62faceef', N'部门管理_查询', N'PersonnelFiles', N'Department', N'Query', 0, N'personnelfiles_department_query_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.677' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4c0ef761-267a-6614-e6a2-39ef62facef6', N'部门管理_添加', N'PersonnelFiles', N'Department', N'Add', 2, N'personnelfiles_department_add_post', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.690' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8d77472a-2571-2a56-7dbf-39ef62facefc', N'部门管理_删除', N'PersonnelFiles', N'Department', N'Delete', 3, N'personnelfiles_department_delete_delete', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.703' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'fa95a02b-b91d-b8f6-fc55-39ef62facf01', N'部门管理_编辑', N'PersonnelFiles', N'Department', N'Edit', 0, N'personnelfiles_department_edit_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.713' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'65334950-91c6-f3a9-2a9d-39ef62facf0a', N'部门管理_修改', N'PersonnelFiles', N'Department', N'Update', 2, N'personnelfiles_department_update_post', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.727' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'265eb40a-c28e-65c7-c55f-39ef62facf10', N'岗位管理_查询', N'PersonnelFiles', N'Position', N'Query', 0, N'personnelfiles_position_query_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.740' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'aec26d05-74b4-79ef-e526-39ef62facf15', N'岗位管理_添加', N'PersonnelFiles', N'Position', N'Add', 2, N'personnelfiles_position_add_post', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.750' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'bffe52e9-555e-795e-2221-39ef62facf1e', N'岗位管理_删除', N'PersonnelFiles', N'Position', N'Delete', 3, N'personnelfiles_position_delete_delete', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.763' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'16237e2f-862a-0b34-5aaa-39ef62facf23', N'岗位管理_编辑', N'PersonnelFiles', N'Position', N'Edit', 0, N'personnelfiles_position_edit_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.777' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e7b04073-4f8b-b878-341b-39ef62facf29', N'岗位管理_修改', N'PersonnelFiles', N'Position', N'Update', 2, N'personnelfiles_position_update_post', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.787' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'678381f1-0622-3094-87aa-39ef62facf2f', N'用户信息管理_查询', N'PersonnelFiles', N'User', N'Query', 0, N'personnelfiles_user_query_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.793' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'620a759d-5f64-39c6-7ad1-39ef62facf36', N'用户信息管理_添加', N'PersonnelFiles', N'User', N'Add', 2, N'personnelfiles_user_add_post', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.797' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7c88526a-3be9-c396-c3cd-39ef62facf3c', N'用户信息管理_删除', N'PersonnelFiles', N'User', N'Delete', 3, N'personnelfiles_user_delete_delete', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.807' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'455a98df-6fc7-9367-099e-39ef62facf43', N'用户信息管理_编辑', N'PersonnelFiles', N'User', N'Edit', 0, N'personnelfiles_user_edit_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'040dcdb5-2b48-385f-99d2-39ef62facf4a', N'用户信息管理_修改', N'PersonnelFiles', N'User', N'Update', 2, N'personnelfiles_user_update_post', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.820' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9bfea08a-64c8-07ed-04c4-39ef62facf50', N'用户信息管理_上传照片', N'PersonnelFiles', N'User', N'UploadPicture', 2, N'personnelfiles_user_uploadpicture_post', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.827' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2baa5cd7-77a8-64d0-3ca2-39ef62facf53', N'用户信息管理_编辑联系信息', N'PersonnelFiles', N'User', N'EditContact', 0, N'personnelfiles_user_editcontact_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.830' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a6b265c7-9956-69f4-7358-39ef62facf57', N'用户信息管理_修改联系信息', N'PersonnelFiles', N'User', N'UpdateContact', 2, N'personnelfiles_user_updatecontact_post', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.840' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8fa83bf6-1dac-6a9f-2735-39ef62facf61', N'用户信息管理_联系信息详情', N'PersonnelFiles', N'User', N'ContactDetails', 0, N'personnelfiles_user_contactdetails_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.843' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b1e7261d-319d-0252-6f86-39ef62facf68', N'用户教育经历管理_查询', N'PersonnelFiles', N'UserEducationHistory', N'Query', 0, N'personnelfiles_usereducationhistory_query_get', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.850' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'bcb35a06-bb1b-21d6-f311-39ef62facf6f', N'用户教育经历管理_添加', N'PersonnelFiles', N'UserEducationHistory', N'Add', 2, N'personnelfiles_usereducationhistory_add_post', CAST(N'2019-08-02T13:29:30.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.857' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a41feda2-40d1-465e-c511-39ef62facf75', N'用户教育经历管理_删除', N'PersonnelFiles', N'UserEducationHistory', N'Delete', 3, N'personnelfiles_usereducationhistory_delete_delete', CAST(N'2019-08-02T13:29:30.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.863' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd60d4fb7-c1c5-37f3-3599-39ef62facf7a', N'用户教育经历管理_编辑', N'PersonnelFiles', N'UserEducationHistory', N'Edit', 0, N'personnelfiles_usereducationhistory_edit_get', CAST(N'2019-08-02T13:29:30.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.873' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'001bdcac-34e2-8313-16a8-39ef62facf81', N'用户教育经历管理_修改', N'PersonnelFiles', N'UserEducationHistory', N'Update', 2, N'personnelfiles_usereducationhistory_update_post', CAST(N'2019-08-02T13:29:30.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.887' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd49b92d3-3d8e-4630-4bed-39ef62facf88', N'用户工作经历管理_查询', N'PersonnelFiles', N'UserWorkHistory', N'Query', 0, N'personnelfiles_userworkhistory_query_get', CAST(N'2019-08-02T13:29:30.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.900' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0b2032ae-3bcd-5d55-8834-39ef62facf90', N'用户工作经历管理_添加', N'PersonnelFiles', N'UserWorkHistory', N'Add', 2, N'personnelfiles_userworkhistory_add_post', CAST(N'2019-08-02T13:29:30.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.913' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'746daceb-b4af-ad6a-ce5a-39ef62facf95', N'用户工作经历管理_删除', N'PersonnelFiles', N'UserWorkHistory', N'Delete', 3, N'personnelfiles_userworkhistory_delete_delete', CAST(N'2019-08-02T13:29:30.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.927' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5616936e-5675-218b-2d41-39ef62facf99', N'用户工作经历管理_编辑', N'PersonnelFiles', N'UserWorkHistory', N'Edit', 0, N'personnelfiles_userworkhistory_edit_get', CAST(N'2019-08-02T13:29:30.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.937' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'19b9e186-01ca-6c88-121f-39ef62facf9f', N'用户工作经历管理_修改', N'PersonnelFiles', N'UserWorkHistory', N'Update', 2, N'personnelfiles_userworkhistory_update_post', CAST(N'2019-08-02T13:29:30.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.950' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'44daac55-570d-9636-750c-39ef788aac40', N'任务组管理_查询', N'Quartz', N'Group', N'Query', 0, N'quartz_group_query_get', CAST(N'2019-08-06T17:58:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.960' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cbe3fc6b-16ba-b353-279e-39ef788aac49', N'任务组管理_添加', N'Quartz', N'Group', N'Add', 2, N'quartz_group_add_post', CAST(N'2019-08-06T17:58:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.973' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'37792db7-5d58-7886-812e-39ef788aac4d', N'任务组管理_删除', N'Quartz', N'Group', N'Delete', 3, N'quartz_group_delete_delete', CAST(N'2019-08-06T17:58:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.983' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1d3ecf5c-9262-7096-36de-39ef788aac55', N'任务组管理_Select', N'Quartz', N'Group', N'Select', 0, N'quartz_group_select_get', CAST(N'2019-08-06T17:58:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-06T17:58:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'671bf572-bbad-c7e1-d6c0-39ef788aac5c', N'任务管理_查询', N'Quartz', N'Job', N'Query', 0, N'quartz_job_query_get', CAST(N'2019-08-06T17:58:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:40.997' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8246081c-c2a2-3310-3b0e-39ef788aac63', N'任务管理_添加', N'Quartz', N'Job', N'Add', 2, N'quartz_job_add_post', CAST(N'2019-08-06T17:58:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:41.007' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'18b5f026-5aaf-7119-8b76-39ef788aac6b', N'任务管理_编辑', N'Quartz', N'Job', N'Edit', 0, N'quartz_job_edit_get', CAST(N'2019-08-06T17:58:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:41.017' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b5bc31af-4f96-6e91-75ee-39ef788aac70', N'任务管理_修改', N'Quartz', N'Job', N'Update', 2, N'quartz_job_update_post', CAST(N'2019-08-06T17:58:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:41.030' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'67b948f1-e414-7c79-62e7-39ef788aac75', N'任务管理_删除', N'Quartz', N'Job', N'Delete', 3, N'quartz_job_delete_delete', CAST(N'2019-08-06T17:58:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:41.040' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2715184a-7011-744d-7ce2-39ef788aac7d', N'任务管理_暂停', N'Quartz', N'Job', N'Pause', 2, N'quartz_job_pause_post', CAST(N'2019-08-06T17:58:40.470' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:41.047' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e294b3be-ef6e-edee-f199-39ef788aac85', N'任务管理_启动', N'Quartz', N'Job', N'Resume', 2, N'quartz_job_resume_post', CAST(N'2019-08-06T17:58:40.473' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:41.053' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ded105fc-8c7e-7775-5875-39ef788aac9f', N'任务管理_日志', N'Quartz', N'Job', N'Log', 0, N'quartz_job_log_get', CAST(N'2019-08-06T17:58:40.473' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:41.060' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'39f9b019-e585-d1d4-c1d3-39ef8909fcaa', N'实体管理_生成代码', N'CodeGenerator', N'Class', N'BuildCode', 0, N'codegenerator_class_buildcode_get', CAST(N'2019-08-09T22:51:39.497' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-09T22:51:39.497' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Role] ([Id], [Name], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'系统管理员', N'超级管理员', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-06-24T18:17:04.170' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', 0, CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Role] ([Id], [Name], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'a62add7c-7c00-e669-6897-39ef5ea12259', N'ttt', N'', CAST(N'2019-08-01T17:13:05.370' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-08-01T17:13:05.370' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', 1, CAST(N'2019-08-06T18:00:30.670' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
SET IDENTITY_INSERT [dbo].[Role_Menu] ON 

INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (90, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'75d8c1dc-8f61-cbca-80f0-39ef62fb2550')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (91, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'72e3d2c8-af4a-8f18-0ffb-39ef6303876a')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (92, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'aacbd69c-3a4d-f09b-9df3-39ef63079f3f')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (93, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'95992f25-2a67-e7c1-a123-39ef6307bf1b')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (94, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'd0bd19f3-a5dd-06f8-3bf0-39ef6307ef82')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (95, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'fc313376-c2c3-5545-4942-39ef788b4b77')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (96, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'badc5903-7033-d966-4fc0-39ef788b828f')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (97, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'44811e83-b1b4-ef27-936b-39ef788bf4b6')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (98, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'7b3e4dc4-506e-b7b9-ef52-39ef5d621bd1')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (99, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'7241bb5b-afe9-6e12-9991-39ef5d638918')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (100, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e3bd0255-2542-b595-8c5c-39ef5d63c1bd')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (101, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'040b5af2-f9d5-dc1f-920f-39ef5d63dfc9')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (102, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'85334641-9195-3a5a-fcea-39ef5d64161b')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (103, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'5195a031-4376-68ce-1c6c-39ef5d642b66')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (104, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'd9591178-238a-4775-5df2-39ef5e444262')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (105, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'03c3673a-2fda-7005-c81f-39ef5e45aca5')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (106, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'521baf65-dd56-6feb-90c3-39ef5e46568b')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (107, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ada4fc6d-4b8b-efb3-beab-39ef7c944837')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (108, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'c5254bf6-6217-7391-731b-39ef5d646840')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (109, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'9303fd20-668d-4729-c865-39ef5d649fb8')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (110, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'eb58188f-24e2-1a91-71b0-39ef5d64b0ee')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (111, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a96cfca1-0ff1-f8cd-6fad-39ef5d64d352')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (112, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'c6196255-5793-c17b-3b3a-39ef5d64f01d')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (113, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a7bd5903-ff4a-d048-5acd-39ef5dd4846b')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (114, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'4e6093ec-219c-dce0-98db-39ef5dd70232')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (115, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f66f43cc-8b96-f728-cdb6-39ef5dd6c36e')
SET IDENTITY_INSERT [dbo].[Role_Menu] OFF
SET IDENTITY_INSERT [dbo].[Role_Menu_Button] ON 

INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (1, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'7241bb5b-afe9-6e12-9991-39ef5d638918', N'6d48e80c-da4d-d915-4fe4-39ef5d638931')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (2, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'7241bb5b-afe9-6e12-9991-39ef5d638918', N'f3e43fc9-608f-92dc-91e1-39ef5d638937')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (3, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e3bd0255-2542-b595-8c5c-39ef5d63c1bd', N'6b9fd4fd-3769-6369-a879-39ef5d63c1ce')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (4, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'85334641-9195-3a5a-fcea-39ef5d64161b', N'bcca0fe2-98a1-f0f5-2fcc-39ef5d641643')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (5, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'85334641-9195-3a5a-fcea-39ef5d64161b', N'fc209f25-69b1-ce42-5a4c-39ef5d64164d')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (6, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'85334641-9195-3a5a-fcea-39ef5d64161b', N'5ec181c6-84ff-a50f-d11a-39ef5d641657')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (7, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'85334641-9195-3a5a-fcea-39ef5d64161b', N'33554ab7-156f-c6d5-b8e4-39ef5d64165f')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (8, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'040b5af2-f9d5-dc1f-920f-39ef5d63dfc9', N'89dbcee1-9d98-34cd-834c-39ef5d63dfda')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (9, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'040b5af2-f9d5-dc1f-920f-39ef5d63dfc9', N'23510d36-c147-1ac3-bf3c-39ef5d63dfdd')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (10, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'040b5af2-f9d5-dc1f-920f-39ef5d63dfc9', N'41d22c0b-42a2-63ac-09c4-39ef5d63dfe8')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (11, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'040b5af2-f9d5-dc1f-920f-39ef5d63dfc9', N'64e4e23d-9737-c3d3-61f2-39ef5d63dfec')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (12, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'5195a031-4376-68ce-1c6c-39ef5d642b66', N'589e1573-49b4-dc4c-42a4-39ef5d642b7f')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (13, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'5195a031-4376-68ce-1c6c-39ef5d642b66', N'd0dd01ee-ee8b-8d6c-9b51-39ef5d642b8a')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (14, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'5195a031-4376-68ce-1c6c-39ef5d642b66', N'ddcd08a9-4efe-c4bc-caea-39ef5d642b8e')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (15, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'5195a031-4376-68ce-1c6c-39ef5d642b66', N'fd515dc7-8219-102b-350d-39ef5d642b95')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (16, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'a96cfca1-0ff1-f8cd-6fad-39ef5d64d352', N'91c48748-3e25-1aa0-96dd-39ef5d64d363')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (20, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'4e6093ec-219c-dce0-98db-39ef5dd70232', N'83a4a5a8-85fe-16ec-b6ad-39ef5dd70244')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (21, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'4e6093ec-219c-dce0-98db-39ef5dd70232', N'3791a0e2-8b47-1624-ae7f-39ef5dd70247')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (22, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'4e6093ec-219c-dce0-98db-39ef5dd70232', N'b4e3e507-930e-2cc8-1dd5-39ef5dd7024e')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (24, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f66f43cc-8b96-f728-cdb6-39ef5dd6c36e', N'119b7837-d5a1-56ea-057a-39ef5dd72328')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (25, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f66f43cc-8b96-f728-cdb6-39ef5dd6c36e', N'130946e5-bfb1-9544-3b31-39ef5dd72330')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (26, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f66f43cc-8b96-f728-cdb6-39ef5dd6c36e', N'6aa7cc7b-3f35-d0b5-12dc-39ef5dd72334')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (30, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'521baf65-dd56-6feb-90c3-39ef5e46568b', N'69c7ed85-b5f1-4df0-e346-39ef5e4656a5')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (31, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'521baf65-dd56-6feb-90c3-39ef5e46568b', N'1f81afe3-7322-35d1-5427-39ef5e4656a9')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (32, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'03c3673a-2fda-7005-c81f-39ef5e45aca5', N'0cc19790-fd06-11a0-83b6-39ef5e478299')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (33, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'03c3673a-2fda-7005-c81f-39ef5e45aca5', N'651257d9-a57b-c11c-51d7-39ef5e47829b')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (34, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'03c3673a-2fda-7005-c81f-39ef5e45aca5', N'146809bb-4747-93b2-7487-39ef5e47829c')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (35, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'eb58188f-24e2-1a91-71b0-39ef5d64b0ee', N'20663365-6d64-b04a-9697-39ef5d661a1a')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (36, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'eb58188f-24e2-1a91-71b0-39ef5d64b0ee', N'8c77bca9-1722-8c16-898f-39ef5d661a23')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (37, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'eb58188f-24e2-1a91-71b0-39ef5d64b0ee', N'ff2db547-7c95-cb53-85ef-39ef5d661a26')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (38, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'72e3d2c8-af4a-8f18-0ffb-39ef6303876a', N'3823dc51-7e60-6661-b404-39ef630387b6')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (39, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'72e3d2c8-af4a-8f18-0ffb-39ef6303876a', N'759aa692-2fd3-ee2c-eb5f-39ef630387c2')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (40, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'72e3d2c8-af4a-8f18-0ffb-39ef6303876a', N'bb24087c-d8bf-398f-3809-39ef630387ca')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (41, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'aacbd69c-3a4d-f09b-9df3-39ef63079f3f', N'3d1ac993-f208-9cc9-751c-39ef63079f8e')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (42, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'aacbd69c-3a4d-f09b-9df3-39ef63079f3f', N'b54364c5-413b-cac1-dda6-39ef63079f9e')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (43, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'aacbd69c-3a4d-f09b-9df3-39ef63079f3f', N'6a4c07ff-f990-45ff-a93b-39ef63079fa2')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (44, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'aacbd69c-3a4d-f09b-9df3-39ef63079f3f', N'b2380156-bca7-ca55-361e-39ef63079fa7')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (45, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'aacbd69c-3a4d-f09b-9df3-39ef63079f3f', N'7ba8f4f6-fe45-918e-5a3c-39ef63079fac')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (46, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'aacbd69c-3a4d-f09b-9df3-39ef63079f3f', N'56aadff1-f9df-4513-0b5f-39ef63079faf')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (47, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'aacbd69c-3a4d-f09b-9df3-39ef63079f3f', N'34ec6ba4-cf9b-5f8b-e9c5-39ef63079fb4')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (48, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'95992f25-2a67-e7c1-a123-39ef6307bf1b', N'db171c47-9cbb-902b-d082-39ef6307bf37')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (49, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'd0bd19f3-a5dd-06f8-3bf0-39ef6307ef82', N'945cfb1a-50f5-8054-d581-39ef6307ef93')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (50, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'd0bd19f3-a5dd-06f8-3bf0-39ef6307ef82', N'f392fb83-1564-05c6-15cf-39ef6307ef9e')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (51, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'd0bd19f3-a5dd-06f8-3bf0-39ef6307ef82', N'e9537a96-4222-3cf6-9289-39ef6307efa1')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (52, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'd0bd19f3-a5dd-06f8-3bf0-39ef6307ef82', N'00c434f0-862b-8ecd-0086-39ef6307efa6')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (53, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'd0bd19f3-a5dd-06f8-3bf0-39ef6307ef82', N'7f4c26ec-d840-1f90-899d-39ef6307efae')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (54, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'badc5903-7033-d966-4fc0-39ef788b828f', N'c7562df4-f09f-31a8-01cf-39ef788b82be')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (55, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'badc5903-7033-d966-4fc0-39ef788b828f', N'cfaf46e6-5673-e919-0b99-39ef788b82d2')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (56, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'44811e83-b1b4-ef27-936b-39ef788bf4b6', N'847f11b0-ca45-d702-d185-39ef788bf4cb')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (57, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'44811e83-b1b4-ef27-936b-39ef788bf4b6', N'0c5ca34c-db1a-0ecc-5b99-39ef788bf4d5')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (58, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'44811e83-b1b4-ef27-936b-39ef788bf4b6', N'd44ec598-b5f0-7c38-a5ff-39ef788bf4e1')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (59, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'44811e83-b1b4-ef27-936b-39ef788bf4b6', N'2b9f21ab-b24e-f473-358f-39ef788bf4e5')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (60, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'44811e83-b1b4-ef27-936b-39ef788bf4b6', N'4891dfb8-3583-5cee-cb70-39ef788bf4fa')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (61, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'44811e83-b1b4-ef27-936b-39ef788bf4b6', N'd5d2c3ca-38a6-a3ca-5091-39ef788bf500')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (64, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'4e6093ec-219c-dce0-98db-39ef5dd70232', N'3dd730ff-6d7b-7816-b712-39ef5dd70256')
SET IDENTITY_INSERT [dbo].[Role_Menu_Button] OFF
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_LoginTime]  DEFAULT (getdate()) FOR [LoginTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_ClosedTime]  DEFAULT (getdate()) FOR [ClosedTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_DeletedTime]  DEFAULT (getdate()) FOR [DeletedTime]
GO
ALTER TABLE [dbo].[Auditinfo] ADD  CONSTRAINT [DF_Auditinfo_ExecutionTime]  DEFAULT (getdate()) FOR [ExecutionTime]
GO
ALTER TABLE [dbo].[Button] ADD  CONSTRAINT [DF_Button_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Button] ADD  CONSTRAINT [DF_Button_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Show]  DEFAULT ((1)) FOR [Show]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_DialogFullscreen]  DEFAULT ((1)) FOR [DialogFullscreen]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Moduleinfo] ADD  CONSTRAINT [DF_Moduleinfo_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Moduleinfo] ADD  CONSTRAINT [DF_Moduleinfo_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_DeletedTime]  DEFAULT (getdate()) FOR [DeletedTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LoginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态：0、未激活 1、正常 2、禁用 3、注销' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注销时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ClosedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注销人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ClosedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'DeletedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'DeletedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Role', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Role', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Controller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'ControllerDesc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'ActionDesc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返回数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Result'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法开始执行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'ExecutionTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法执行总用时(ms)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'ExecutionDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览器信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'BrowserInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Platform'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'MenuCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button_Permission', @level2type=N'COLUMN',@level2name=N'ButtonCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button_Permission', @level2type=N'COLUMN',@level2name=N'PermissionCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属模块' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModuleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型，0、节点 1、链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteParams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteQuery'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'IconColor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Show'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打开方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Target'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框宽度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框高度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogHeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框可全屏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogFullscreen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu_Permission', @level2type=N'COLUMN',@level2name=N'MenuCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu_Permission', @level2type=N'COLUMN',@level2name=N'PermissionCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'Version'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModuleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Controller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求方法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'HttpMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'DeletedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'DeletedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Menu', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Menu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
USE [master]
GO
ALTER DATABASE [Nm_Admin] SET  READ_WRITE 
GO
