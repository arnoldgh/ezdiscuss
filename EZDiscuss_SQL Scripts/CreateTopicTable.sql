USE [EZDiscuss]
GO

/****** Object:  Table [dbo].[Topic]    Script Date: 09/16/2014 22:13:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Topic](
	[TopicId] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[TopicTitle] [varchar](50) NOT NULL,
	[TopicDescription] [varchar](250) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[DateDeleted] [datetime] NULL,
	[DeletedBy] [bigint] NULL,
	[IsDeleted] [int] NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Topic] ADD  CONSTRAINT [DF_Topic_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO


