USE [RDE_DB]
GO
/****** Object:  User [admin]    Script Date: 10/23/2013 13:07:14 ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/23/2013 13:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 10/23/2013 13:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Type] [nvarchar](50) NULL,
	[Survey_id] [int] NOT NULL,
	[User_id] [int] NOT NULL,
	[Response_id] [int] NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Survey_id] ASC,
	[User_id] ASC,
	[Response_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey_Taken]    Script Date: 10/23/2013 13:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey_Taken](
	[Date] [datetime] NULL,
	[Users_id] [int] NOT NULL,
	[Survey_id] [int] NOT NULL,
 CONSTRAINT [PK_Survey_Taken] PRIMARY KEY CLUSTERED 
(
	[Users_id] ASC,
	[Survey_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 10/23/2013 13:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[id] [int] NOT NULL,
	[Question] [nvarchar](max) NULL,
	[User_id] [int] NOT NULL,
	[Response_id] [int] NOT NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[User_id] ASC,
	[Response_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Response]    Script Date: 10/23/2013 13:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Response](
	[User_response] [nvarchar](max) NOT NULL,
	[Survey_id] [int] NOT NULL,
	[Users_id] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Response] PRIMARY KEY CLUSTERED 
(
	[Survey_id] ASC,
	[Users_id] ASC,
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Type_Type]    Script Date: 10/23/2013 13:07:16 ******/
ALTER TABLE [dbo].[Type]  WITH CHECK ADD  CONSTRAINT [FK_Type_Type] FOREIGN KEY([Survey_id], [User_id], [Response_id])
REFERENCES [dbo].[Type] ([Survey_id], [User_id], [Response_id])
GO
ALTER TABLE [dbo].[Type] CHECK CONSTRAINT [FK_Type_Type]
GO
/****** Object:  ForeignKey [FK_Survey_Taken_Survey_Taken]    Script Date: 10/23/2013 13:07:16 ******/
ALTER TABLE [dbo].[Survey_Taken]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Taken_Survey_Taken] FOREIGN KEY([Users_id], [Survey_id])
REFERENCES [dbo].[Survey_Taken] ([Users_id], [Survey_id])
GO
ALTER TABLE [dbo].[Survey_Taken] CHECK CONSTRAINT [FK_Survey_Taken_Survey_Taken]
GO
/****** Object:  ForeignKey [FK_Survey_Survey]    Script Date: 10/23/2013 13:07:16 ******/
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Survey] FOREIGN KEY([id], [User_id], [Response_id])
REFERENCES [dbo].[Survey] ([id], [User_id], [Response_id])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_Survey]
GO
/****** Object:  ForeignKey [FK_Survey_Users]    Script Date: 10/23/2013 13:07:16 ******/
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Users] FOREIGN KEY([User_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_Users]
GO
/****** Object:  ForeignKey [FK_Response_Response]    Script Date: 10/23/2013 13:07:16 ******/
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_Response] FOREIGN KEY([Survey_id], [Users_id], [id])
REFERENCES [dbo].[Response] ([Survey_id], [Users_id], [id])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_Response]
GO
/****** Object:  ForeignKey [FK_Response_Users]    Script Date: 10/23/2013 13:07:16 ******/
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_Users] FOREIGN KEY([Users_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_Users]
GO
