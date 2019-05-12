USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[GroupRetrieve]    Script Date: 09/16/2014 22:16:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 25, 2014
-- Description:	Retrieves Groups's record based on Group Id
-- =============================================
CREATE PROCEDURE [dbo].[GroupRetrieve]
	@GroupId bigint
AS
BEGIN
    SELECT
		g.GroupId,
		g.MemberId,		
		g.GroupName,
		g.GroupDescription,
		g.DateCreated,
		g.DateUpdated,
		g.UpdatedBy,
		g.DateDeleted,
		g.DeletedBy
    FROM dbo.[Group] g
    WHERE g.GroupId = @GroupId
END


GO


