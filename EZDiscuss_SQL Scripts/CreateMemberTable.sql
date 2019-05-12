USE [EZDiscuss]
GO

/****** Object:  Table [dbo].[Member]    Script Date: 09/16/2014 22:12:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Member](
	[MemberId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Firstname] [varchar](50) NOT NULL,
	[Lastname] [varchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[Birthday] [date] NOT NULL,
	[DateJoined] [datetime] NOT NULL,
	[DateUpdated] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
	[IsDeleted] [int] NULL,
	[Photo] [varchar](50) NULL,
	[IsLogin] [bit] NULL,
	[DateLogin] [datetime] NULL,
	[IsLogout] [bit] NULL,
	[DateLogout] [datetime] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


