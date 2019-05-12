USE [EZDiscuss]
GO

/****** Object:  Table [dbo].[ErrorLog]    Script Date: 09/16/2014 22:10:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ErrorLog](
	[ErrorLogID] [bigint] IDENTITY(1,1) NOT NULL,
	[PageName] [varchar](50) NULL,
	[MethodName] [varchar](50) NULL,
	[ErrorMessage] [varchar](250) NULL,
	[DateCreated] [datetime] NOT NULL,
	[CreatedBy] [bigint] NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


