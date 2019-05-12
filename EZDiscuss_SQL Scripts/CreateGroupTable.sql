USE [EZDiscuss]
GO

/****** Object:  Table [dbo].[Group]    Script Date: 09/16/2014 22:11:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Group](
	[GroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[GroupType] [int] NOT NULL,
	[GroupDescription] [varchar](250) NULL,
	[DateCreated] [datetime] NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[IsDeleted] [int] NULL,
	[DateDeleted] [datetime] NULL,
	[DeletedBy] [bigint] NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


