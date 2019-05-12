USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[TopicRetrieveByMemberId]    Script Date: 09/16/2014 22:25:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: February 17, 2014
-- Description:	Retrieves all Topic Records based on Member's Id
-- =============================================

CREATE PROCEDURE [dbo].[TopicRetrieveByMemberId]
(
	@MemberID bigint
)
AS
BEGIN
	-- Select the GroupId(s) where this MemberId is a Member
	DECLARE @Groups TABLE (GroupId bigint)
	
	INSERT INTO @Groups
	SELECT DISTINCT (GroupId)
	FROM dbo.GroupMember gm
	WHERE gm.MemberId = @MemberID
	
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
	WHERE t.GroupId IN (SELECT GroupId FROM @Groups)
END



GO


