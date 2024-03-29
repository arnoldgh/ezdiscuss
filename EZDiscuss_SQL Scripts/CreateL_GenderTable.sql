USE [EZDiscuss]
GO

/****** Object:  Table [dbo].[L_Gender]    Script Date: 09/16/2014 22:11:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[L_Gender](
	[GenderId] [int] IDENTITY(1,1) NOT NULL,
	[GenderType] [varchar](20) NOT NULL,
	[Remarks] [varchar](50) NULL,
 CONSTRAINT [PK_L_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


