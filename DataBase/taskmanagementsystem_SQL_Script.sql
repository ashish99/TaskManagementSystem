USE [TMSDB]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 30-12-2024 20:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 30-12-2024 20:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DueDate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Task] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskStatus]    Script Date: 30-12-2024 20:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskStatus](
	[TSId] [int] IDENTITY(1,1) NOT NULL,
	[TSName] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[TSId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30-12-2024 20:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'User')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([TaskId], [Title], [Description], [DueDate], [Status], [UserId]) VALUES (1, N'C# Exam', N'Tomorrow is new test is conduction in our company', CAST(N'2024-01-27T18:41:42.550' AS DateTime), 1, 15)
INSERT [dbo].[Task] ([TaskId], [Title], [Description], [DueDate], [Status], [UserId]) VALUES (2, N'Task 2', N'Please complete task 2 immediately', CAST(N'2024-01-28T13:05:46.953' AS DateTime), 3, 15)
INSERT [dbo].[Task] ([TaskId], [Title], [Description], [DueDate], [Status], [UserId]) VALUES (3, N'Ashish Task 1', N'Ashish First Task Started i.e Work in progress', CAST(N'2024-01-27T22:07:30.420' AS DateTime), 2, 20)
INSERT [dbo].[Task] ([TaskId], [Title], [Description], [DueDate], [Status], [UserId]) VALUES (7, N'admin task', N'admin task created', CAST(N'2024-01-28T16:53:24.047' AS DateTime), 1, 14)
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskStatus] ON 

INSERT [dbo].[TaskStatus] ([TSId], [TSName]) VALUES (1, N'To Do')
INSERT [dbo].[TaskStatus] ([TSId], [TSName]) VALUES (2, N'InProgress')
INSERT [dbo].[TaskStatus] ([TSId], [TSName]) VALUES (3, N'Done')
INSERT [dbo].[TaskStatus] ([TSId], [TSName]) VALUES (4, N'Abort')
SET IDENTITY_INSERT [dbo].[TaskStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [Password], [RoleId]) VALUES (14, N'admin', N'admin', 2)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [RoleId]) VALUES (15, N'Pavan', N'p@1', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [RoleId]) VALUES (20, N'Ashish', N'sri@1', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[TaskStatus] ([TSId])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Task_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_dbo.Task_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId]
GO
