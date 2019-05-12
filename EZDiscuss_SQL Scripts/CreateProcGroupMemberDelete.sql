USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[GroupMemberDelete]    Script Date: 09/16/2014 22:15:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 25, 2014
-- Description:	Deletes (soft delete) a GroupMember
-- =============================================
CREATE PROCEDURE [dbo].[GroupMemberDelete]
	@GroupMemberId bigint
AS
BEGIN
    UPDATE dbo.[GroupMember]
    SET
		IsMemberDeleted = 1,
		DateMemberDeleted = GETDATE()     
    WHERE
		GroupMemberId = @GroupMemberId
END


GO


