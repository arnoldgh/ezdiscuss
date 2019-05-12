USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MessagesRetrieveByMemberID]    Script Date: 09/16/2014 22:21:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 29, 2014
-- Description:	Retrieves all Message by MemberID
-- =============================================
CREATE PROCEDURE [dbo].[MessagesRetrieveByMemberID]
(
	@MemberID bigint
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
END


GO


