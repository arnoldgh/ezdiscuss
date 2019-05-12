USE [EZDiscuss]
GO

/****** Object:  Table [dbo].[GroupMember]    Script Date: 09/16/2014 22:11:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GroupMember](
	[GroupMemberId] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[DateMemberJoined] [datetime] NULL,
	[IsMemberDeleted] [int] NULL,
	[DateMemberDeleted] [datetime] NULL,
 CONSTRAINT [PK_GroupMember] PRIMARY KEY CLUSTERED 
(
	[GroupMemberId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[GroupMember] ADD  CONSTRAINT [DF_GroupMember_IsDeleted]  DEFAULT ((0)) FOR [IsMemberDeleted]
GO


