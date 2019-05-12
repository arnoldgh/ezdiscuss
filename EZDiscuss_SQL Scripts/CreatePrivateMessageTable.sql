USE [EZDiscuss]
GO

/****** Object:  Table [dbo].[PrivateMessage]    Script Date: 09/16/2014 22:12:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PrivateMessage](
	[PrivateMessageID] [bigint] IDENTITY(1,1) NOT NULL,
	[SenderId] [bigint] NOT NULL,
	[ReceiverId] [bigint] NOT NULL,
	[Message] [varchar](1000) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_PrivateMessage] PRIMARY KEY CLUSTERED 
(
	[PrivateMessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


