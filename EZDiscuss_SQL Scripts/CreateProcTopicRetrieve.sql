USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[TopicRetrieve]    Script Date: 09/16/2014 22:24:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: February 17, 2014
-- Description:	Retrieves a Topic Record based on Topic's Id
-- =============================================

CREATE PROCEDURE [dbo].[TopicRetrieve]
(
	@TopicID bigint
)
AS
BEGIN
	SELECT
		t.TopicID,
		t.MemberId,
		t.TopicTitle,
		t.TopicDescription,
		t.DateCreated,
		t.DateUpdated,
		t.UpdatedBy,
		t.DateDeleted,
		t.DeletedBy,
		t.IsDeleted			
	FROM dbo.Topic t
	WHERE t.TopicId = @TopicId    
END


GO


