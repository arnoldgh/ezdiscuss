USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[GroupRetrieveAllByMemberId]    Script Date: 09/16/2014 22:17:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: April 20, 2014
-- Description:	Retrieves all the Groups by MemberId
-- =============================================
CREATE PROCEDURE [dbo].[GroupRetrieveAllByMemberId]
	@MemberId bigint
AS
BEGIN
	-- First, return the Groups that the user created
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
    WHERE g.MemberId = @MemberId
    
    -- Second, return the Groups that the user is a member of       
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
    WHERE g.GroupId IN
		(SELECT DISTINCT GroupId FROM dbo.[GroupMember] WHERE memberId = @MemberId)		
END


GO


