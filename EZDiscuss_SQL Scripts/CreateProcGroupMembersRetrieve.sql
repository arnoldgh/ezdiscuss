USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[GroupMembersRetrieve]    Script Date: 09/16/2014 22:16:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: April 14, 2014
-- Description:	Retrieves all the members of the Group based on GroupId
-- =============================================
CREATE PROCEDURE [dbo].[GroupMembersRetrieve]
	@GroupId bigint
AS
BEGIN
	
	SELECT
		m.Username,
		m.Firstname,
		m.Lastname
	FROM [dbo].[Group] g
	JOIN [dbo].[GroupMember] gm ON g.GroupId = gm.GroupId
	JOIN [dbo].[Member] m ON gm.MemberId = m.MemberId
	WHERE g.GroupId = @GroupId
	AND g.IsDeleted = 0
	
END


GO


