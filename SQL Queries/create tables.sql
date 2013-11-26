IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Type]') AND type in (N'U'))
DROP TABLE [dbo].[Type]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Taken]') AND type in (N'U'))
DROP TABLE [dbo].[Survey_Taken]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey]') AND type in (N'U'))
DROP TABLE [dbo].[Survey]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Response]') AND type in (N'U'))
DROP TABLE [dbo].[Response]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Question]') AND type in (N'U'))
DROP TABLE [dbo].[Question]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Options]') AND type in (N'U'))
DROP TABLE [dbo].[Options]
GO

CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Username] [varchar](10) NOT NULL,
	[password] [varchar](50) NOT NULL
)
GO

CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Type] [varchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Survey_Taken](
	[Date] [nchar](30) NULL,
	[Ip_address] [varchar](30) NULL,
	[surveyKey] [varchar](30) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Survey](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [varchar](50) NULL,
	[surveyKey] [varchar](30) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Response](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[User_response] [varchar](max) NOT NULL,
	[Survey_Taken_id] [int] NOT NULL,
	[Question_id] [varchar](10) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Question] [varchar](max) NULL,
	[Survey_id] [int] NOT NULL,
	[Type_id] [smallint] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Options](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Question_id] [int] NOT NULL,
	[Option_text] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
