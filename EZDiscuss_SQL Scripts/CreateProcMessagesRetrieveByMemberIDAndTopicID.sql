USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MessagesRetrieveByMemberIDAndTopicID]    Script Date: 09/16/2014 22:22:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: June 4, 2014
-- Description:	Retrieves all Message by MemberID and TopicID
-- =============================================
CREATE PROCEDURE [dbo].[MessagesRetrieveByMemberIDAndTopicID]
(
	@MemberID bigint,
	@TopicID bigint
)
AS
BEGIN
	SELECT
		m.MessageID,
		m.TopicID,
		m.MemberId,
		m.[Message],
		m.DateCreated,
		m.DateUpdated,
		m.UpdatedBy,
		m.DateDeleted,
		m.DeletedBy,
		m.IsDeleted
	FROM dbo.[Message] m
    WHERE m.MemberId = @MemberID
    AND m.TopicID = @TopicID
    AND m.IsDeleted = 0
END


GO


