USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[TopicMembersRetrieve]    Script Date: 09/16/2014 22:24:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: April 14, 2014
-- Description:	Retrieves all Topic Members (Participants) based on TopicId
-- =============================================

CREATE PROCEDURE [dbo].[TopicMembersRetrieve]
(
	@TopicID bigint
)
AS
BEGIN
	SELECT DISTINCT
		m.MemberId,
		m.Firstname,
		m.Lastname,
		m.Firstname + ' ' + m.Lastname AS Name,
		m.Email,
		m.Gender,
		m.Birthday,
		m.Photo
	FROM dbo.[TopicMember] tm
	JOIN dbo.[Member] m
	ON tm.MemberId = m.MemberId
	JOIN dbo.[Topic] t
	ON tm.TopicId = t.TopicId
	WHERE t.TopicId = @TopicId
	ORDER BY Name
END


GO


