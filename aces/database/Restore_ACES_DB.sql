USE [master]
GO
/****** Object:  Database [ACES_DB]    Script Date: 8/5/2020 7:45:10 PM ******/
CREATE DATABASE [ACES_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ACES_TEST', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ACES_TEST.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ACES_TEST_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ACES_TEST_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ACES_DB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ACES_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ACES_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ACES_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ACES_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ACES_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ACES_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ACES_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ACES_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ACES_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ACES_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ACES_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ACES_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ACES_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ACES_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ACES_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ACES_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ACES_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ACES_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ACES_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ACES_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ACES_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ACES_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ACES_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ACES_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ACES_DB] SET  MULTI_USER 
GO
ALTER DATABASE [ACES_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ACES_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ACES_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ACES_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ACES_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ACES_DB] SET QUERY_STORE = OFF
GO
USE [ACES_DB]
GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 8/5/2020 7:45:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[RepositoryUrl] [nvarchar](max) NOT NULL,
	[AssignmentCode] [int] NULL,
	[CourseId] [int] NOT NULL,
	[PointsPossible] [int] NOT NULL,
 CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commit]    Script Date: 8/5/2020 7:45:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentAssignmentId] [int] NOT NULL,
	[PointsEarned] [int] NOT NULL,
	[DateCommitted] [datetime] NOT NULL,
	[LinesAdded] [int] NOT NULL,
	[LinesDeleted] [int] NOT NULL,
	[NumWatermarks] [int] NOT NULL,
 CONSTRAINT [PK_Commit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 8/5/2020 7:45:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](100) NOT NULL,
	[InstructorId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 8/5/2020 7:45:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 8/5/2020 7:45:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Salt] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/5/2020 7:45:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Salt] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAssignment]    Script Date: 8/5/2020 7:45:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[AssignmentId] [int] NOT NULL,
	[Watermark] [nvarchar](max) NOT NULL,
	[RepositoryUrl] [nvarchar](max) NOT NULL,
	[NumWatermarks] [int] NOT NULL,
 CONSTRAINT [PK_StudentAssignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assignment] ON 

INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (1, N'Stacks and Queues', N'stacksandqueues.myassignment.com', 123456, 1, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (2, N'Linked Lists Intro', N'linkedlistsintro.myassignment.com', 234567, 1, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (3, N'Linked List Generalized Methods', N'linkedlistgeneralizedmethods.myassignment.com', 345678, 1, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (4, N'Linked List Iterators', N'linkedlistiterators.myassignment.com', 456789, 1, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (5, N'Hash Tables with Iterators', N'hashtableswithiterators.myassignment.com', 567890, 1, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (6, N'Single Threaded Bucket Sort', N'singlethreadedbucketsort.myassignment.com', 987652, 1, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (7, N'Multithreaded Bucket Sort', N'multithreadedbucketsort.myassignment.com', 987652, 1, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (8, N'Binary Tree Recursion', N'binarytreerecursion.myassignment.com', 345123, 1, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (9, N'Binary Tree Calculator', N'binarytreecalculator.myassignment.com', 246890, 1, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (10, N'Single Threaded Bucket Sort', N'singlethreadedbucketsort.myassignment.com', 875657, 1, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (11, N'Number Guessing Game', N'numberguessinggame.myassignment.com', 346778, 2, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (12, N'SignalR Project', N'signalRproject.myassignment.com', 356767, 2, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (13, N'Introduction to C and Pointers', N'introtocandpointers.myassignment.com', 346789, 3, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (14, N'XV6 Introduction', N'xv6intro.myassignment.com', 765543, 3, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (15, N'Forks', N'forks.myassignment.com', 858556, 3, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (16, N'System Calls', N'systemcalls.myassignment.com', 905623, 3, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (17, N'XV6 Scheduler', N'xv6scheduler.myassignment.com', 457678, 3, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (18, N'PThreads introduction', N'pthreadsintroduction.myassignment.com', 575655, 3, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (19, N'PThreads and Sloppy Counter', N'pthreadsandsloppycounter.myassignment.com', 345789, 3, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (20, N'Hello World', N'cs3030helloword.myassignment.com', 456477, 4, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (21, N'Search and Report', N'searchandreport.myassignment.com', 456456, 4, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (22, N'Failed Login Report', N'failedloginreport.myassignment.com', 456478, 4, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (23, N'Temperature Converter', N'temperatureconverter.myassignment.com', 799545, 4, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (24, N'Database Loader', N'temperatureconverterblog.myassignment.com', 984334, 4, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (25, N'Filemaker', N'temperatureconverterblog.myassignment.com', 865555, 4, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (26, N'Flashlight', N'flashlight.myassignment.com', 987665, 5, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (27, N'Bowling Scores', N'bowlingscores.myassignment.com', 133633, 5, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (28, N'Course Catalog', N'coursecatalog.myassignment.com', 623337, 5, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (29, N'Inventory', N'inventory.myassignment.com', 785745, 5, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (30, N'Inventory with Data', N'inventorywithdata.myassignment.com', 234533, 5, 200)
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [AssignmentCode], [CourseId], [PointsPossible]) VALUES (31, N'Final Project', N'cs3260finalproject.myassignment.com', 234555, 5, 200)
SET IDENTITY_INSERT [dbo].[Assignment] OFF
GO
SET IDENTITY_INSERT [dbo].[Commit] ON 

INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (1, 1, 200, CAST(N'2019-09-01T07:50:46.000' AS DateTime), 45, 0, 3)
INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (2, 1, 190, CAST(N'2019-12-25T17:39:22.000' AS DateTime), 4, 47, 3)
INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (3, 3, 170, CAST(N'2020-02-06T10:19:00.000' AS DateTime), 9, 5, 2)
INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (4, 2, 100, CAST(N'2019-08-28T14:59:05.000' AS DateTime), 12, 74, 3)
INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (5, 5, 50, CAST(N'2019-09-13T12:30:52.000' AS DateTime), 96, 65, 3)
INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (6, 8, 0, CAST(N'2020-04-22T06:43:45.000' AS DateTime), 1, 95, 3)
INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (7, 9, 0, CAST(N'2020-12-01T19:22:29.000' AS DateTime), 72, 32, 3)
INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (8, 4, 111, CAST(N'2020-10-05T18:55:58.000' AS DateTime), 25, 49, 3)
INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (9, 5, 120, CAST(N'2020-12-23T13:20:07.000' AS DateTime), 74, 14, 3)
INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (10, 5, 130, CAST(N'2021-01-08T14:17:34.000' AS DateTime), 84, 14, 1)
INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (11, 6, 145, CAST(N'2020-01-03T08:20:47.000' AS DateTime), 99, 81, 3)
INSERT [dbo].[Commit] ([Id], [StudentAssignmentId], [PointsEarned], [DateCommitted], [LinesAdded], [LinesDeleted], [NumWatermarks]) VALUES (12, 7, 30, CAST(N'2020-12-05T04:53:03.000' AS DateTime), 41, 7, 3)
SET IDENTITY_INSERT [dbo].[Commit] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId]) VALUES (1, N'CS 2420', 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId]) VALUES (2, N'CS 3750', 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId]) VALUES (3, N'CS 3100', 2)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId]) VALUES (4, N'CS 3030', 3)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId]) VALUES (5, N'CS 3260', 3)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Enrollment] ON 

INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (1, 1, 1, 0)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (2, 1, 2, 0)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (3, 1, 3, 0)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (4, 1, 4, 1)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (5, 1, 5, 1)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (6, 2, 1, 1)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (7, 2, 2, 1)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (8, 2, 3, 1)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (9, 2, 4, 0)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (10, 2, 5, 0)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (11, 3, 1, 0)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (12, 3, 2, 0)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (13, 3, 3, 1)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (14, 3, 4, 0)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (15, 3, 5, 0)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (16, 4, 1, 1)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (17, 4, 2, 0)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (18, 4, 4, 1)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (19, 4, 4, 0)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId], [Active]) VALUES (20, 4, 5, 1)
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
GO
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([Id], [FirstName], [LastName], [Email], [Password], [Salt]) VALUES (1, N'Brad', N'Peterson', N'bradleypeterson@weber.edu', N'A00BD61B115B108033CBC507F0CEF15D3039E255E0BF48BB726E28DF98FF65CF', N'EADB5746-D556-4635-B379-ED5A56A1CE26')
INSERT [dbo].[Instructor] ([Id], [FirstName], [LastName], [Email], [Password], [Salt]) VALUES (2, N'Mark', N'Huson', N'markhuson@weber.edu', N'31594BFBE50E5AC948AAA900D038818BD4324E6FE936B13D6648D9AEC7F4C832', N'13F2D33D-6645-47EA-891B-A8B342BCD664')
INSERT [dbo].[Instructor] ([Id], [FirstName], [LastName], [Email], [Password], [Salt]) VALUES (3, N'Ted', N'Cowan', N'tedcowan@weber.edu', N'7EE350D479133C4FD632FFA3E94695AD737A3A35AACDB959C7277D6FFEDEA14B', N'06CE52C9-B457-4D45-BD27-0736E9FC0691')
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt]) VALUES (1, N'Joshua', N'Abbott', N'joshuaabbott@mail.weber.edu', N'E159F2A3C0911B96E162F4D54EA91E627D33C62EB65333577A5A31622D3C2429', N'8ddf7a3f-3a4f-456f-8f4d-dd616920837b')
INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt]) VALUES (2, N'Logan', N'Rios', N'loganrios@mail.weber.edu', N'0A52F4C6B3C27C72660849CFBD351D6E0BE4EB0BB2BC9BB78DF4F1BB1D430774', N'46837f64-b58c-4570-aa88-1394009e4c84')
INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt]) VALUES (3, N'Morgan', N'Jensen', N'morganjensen@mail.weber.edu', N'FCD2955C5F398055CAB83DA192C9DC6DB57CA5A54F26B1EEF4D3078A66178CA6', N'47141bac-68d2-48a3-8bc6-385a6a4680ab')
INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt]) VALUES (4, N'Tanner', N'Law', N'tannerlaw@mail.weber.edu', N'68EBA8EED3669998B6D1E755E2B003BECD4E947236880A33D220615511C61887', N'5cf65683-df41-4d2f-a178-12625f451380')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentAssignment] ON 

INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [Watermark], [RepositoryUrl], [NumWatermarks]) VALUES (1, 1, 1, N'1098842E-18E1-4934-82C2-21F7C8727829', N'repo1.com', 3)
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [Watermark], [RepositoryUrl], [NumWatermarks]) VALUES (2, 1, 2, N'E6EDF941-AD40-4F32-83FC-CB9E337EF6C5', N'repo2.com', 3)
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [Watermark], [RepositoryUrl], [NumWatermarks]) VALUES (3, 2, 3, N'9FC7FD8E-B7E8-467B-A88E-8F75CF72E173', N'repo3.com', 3)
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [Watermark], [RepositoryUrl], [NumWatermarks]) VALUES (4, 2, 4, N'70E94CB6-C618-4256-9F1C-488FB9E49113', N'repo4.com', 3)
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [Watermark], [RepositoryUrl], [NumWatermarks]) VALUES (5, 3, 5, N'3C378601-BC88-4B0B-9547-3A85D37C093F', N'repo5.com', 3)
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [Watermark], [RepositoryUrl], [NumWatermarks]) VALUES (6, 3, 6, N'0CE07E5A-97A8-43F9-9CA1-70E3C7F5B880', N'repo6.com', 3)
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [Watermark], [RepositoryUrl], [NumWatermarks]) VALUES (7, 4, 7, N'1F3D6AF7-5F55-4CBC-8421-32F06A51EC93', N'repo7.com', 3)
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [Watermark], [RepositoryUrl], [NumWatermarks]) VALUES (8, 4, 8, N'6021C4FC-37BC-4BBD-8F5A-5049B1FCD660', N'repo8.com', 3)
SET IDENTITY_INSERT [dbo].[StudentAssignment] OFF
GO
USE [master]
GO
ALTER DATABASE [ACES_DB] SET  READ_WRITE 
GO
