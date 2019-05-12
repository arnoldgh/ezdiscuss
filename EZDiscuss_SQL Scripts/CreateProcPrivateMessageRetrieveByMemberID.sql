USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[PrivateMessageRetrieveByMemberID]    Script Date: 09/16/2014 22:23:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: July 7, 2014
-- Description:	Retrieves all PrivateMessage records by MemberID
-- =============================================
CREATE PROCEDURE [dbo].[PrivateMessageRetrieveByMemberID]
(
	@MemberID bigint
)
AS
BEGIN

	SELECT
		pm.PrivateMessageID,
		pm.[Message],
		m.Firstname + ' ' + m.Lastname AS name,
		pm.DateCreated
	FROM dbo.[PrivateMessage] pm
	JOIN dbo.Member m ON pm.SenderId = m.MemberId
    WHERE pm.PrivateMessageID = @MemberID
END

GO


