USE [EZDiscuss]
GO

/****** Object:  Table [dbo].[Message]    Script Date: 09/16/2014 22:12:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Message](
	[MessageID] [bigint] IDENTITY(1,1) NOT NULL,
	[TopicID] [bigint] NOT NULL,
	[Message] [varchar](250) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[DateDeleted] [datetime] NULL,
	[DeletedBy] [bigint] NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO


