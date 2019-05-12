USE [EZDiscuss]
GO

/****** Object:  Table [dbo].[Audit]    Script Date: 09/16/2014 22:09:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Audit](
	[AuditId] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[DateLogin] [datetime] NULL,
	[DateLogout] [datetime] NULL,
 CONSTRAINT [PK_Audit] PRIMARY KEY CLUSTERED 
(
	[AuditId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


