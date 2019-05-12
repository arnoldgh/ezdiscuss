USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[TopicsRetrieveByGroupId]    Script Date: 09/16/2014 22:25:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: April 24, 2014
-- Description:	Retrieves all Topic Records based on GroupId
-- =============================================

CREATE PROCEDURE [dbo].[TopicsRetrieveByGroupId]
(
	@GroupID bigint
)
AS
BEGIN
	SELECT
		t.TopicId,
		t.MemberId,
		t.TopicTitle,
		t.TopicDescription
	FROM dbo.Topic t
	WHERE t.GroupId = @GroupID
END

GO


