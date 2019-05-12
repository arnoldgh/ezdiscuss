USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MemberDelete]    Script Date: 09/16/2014 22:18:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 25, 2014
-- Description:	Deletes (soft delete) an existing Member record
-- =============================================
CREATE PROCEDURE [dbo].[MemberDelete]
	@MemberId bigint
AS
BEGIN
    UPDATE dbo.Member
    SET IsDeleted = 1,
		DateDeleted = GETDATE()
	WHERE MemberId = @MemberId	
END


GO


