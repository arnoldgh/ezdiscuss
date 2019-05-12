USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[GroupDelete]    Script Date: 09/16/2014 22:15:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 25, 2014
-- Description:	Deletes (Soft delete) Groups's record
-- =============================================
CREATE PROCEDURE [dbo].[GroupDelete]
	@GroupId bigint,
	@DeletedBy bigint
AS
BEGIN
    UPDATE dbo.[Group]
    SET 
		IsDeleted = 0,
		DateDeleted = GETDATE(),
		DeletedBy = @DeletedBy
    WHERE GroupId = @GroupId
END


GO


