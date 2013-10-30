��USE [RDE_DB]

GO

/****** Object:  Table [dbo].[Users]    Script Date: 10/24/2013 19:48:17 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Users](

	[id] [int] IDENTITY(1,1) NOT NULL,

	[Username] [nchar](10) NOT NULL,

	[password] [nvarchar](50) NOT NULL,

 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Type]    Script Date: 10/24/2013 19:48:17 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Type](

	[id] [int] IDENTITY(1,1) NOT NULL,

	[Name] [nvarchar](50) NULL,

 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Survey_Taken]    Script Date: 10/24/2013 19:48:17 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Survey_Taken](

	[Date] [datetime] NULL,

	[Ip_address] [nchar](10) NULL,

	[Survey_id] [int] NOT NULL

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Survey]    Script Date: 10/24/2013 19:48:17 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Survey](

	[id] [int] IDENTITY(1,1) NOT NULL,

	[Name] [nvarchar](max) NOT NULL,

 CONSTRAINT [PK_Survey_1] PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Response]    Script Date: 10/24/2013 19:48:17 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Response](

	[User_response] [nvarchar](max) NOT NULL,

	[Survey_Taken_id] [int] NOT NULL,

	[id] [int] IDENTITY(1,1) NOT NULL,

	[Question_id] [nchar](10) NULL,

 CONSTRAINT [PK_Response_1] PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Question]    Script Date: 10/24/2013 19:48:17 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Question](

	[Question] [nvarchar](max) NULL,

	[id] [int] IDENTITY(1,1) NOT NULL,

	[Survey_id] [int] NOT NULL,

	[Type_id] [smallint] NULL,

 CONSTRAINT [PK_Question_1] PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Option]    Script Date: 10/24/2013 19:48:17 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

SET ANSI_PADDING ON

GO

CREATE TABLE [dbo].[Option](

	[id] [int] IDENTITY(1,1) NOT NULL,

	[Question_id] [int] NOT NULL,

	[Option_text] [varchar](50) NOT NULL,

 CONSTRAINT [PK_Option] PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

) ON [PRIMARY]

GO

SET ANSI_PADDING OFF

GO

/****** Object:  ForeignKey [FK_Question_Question]    Script Date: 10/24/2013 19:48:17 ******/

ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Question] FOREIGN KEY([id])

REFERENCES [dbo].[Question] ([id])

GO

ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Question]

GO

