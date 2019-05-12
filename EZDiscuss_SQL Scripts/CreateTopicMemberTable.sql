USE [EZDiscuss]
GO

/****** Object:  Table [dbo].[TopicMember]    Script Date: 09/16/2014 22:13:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TopicMember](
	[TopicMemberId] [bigint] IDENTITY(1,1) NOT NULL,
	[TopicId] [bigint] NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[DateMemberJoined] [datetime] NULL,
	[IsMemberDeleted] [int] NULL,
	[DateMemberDeleted] [datetime] NULL,
 CONSTRAINT [PK_TopicMember] PRIMARY KEY CLUSTERED 
(
	[TopicMemberId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


