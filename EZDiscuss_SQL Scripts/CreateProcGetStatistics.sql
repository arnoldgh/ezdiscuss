USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[GetStatistics]    Script Date: 09/16/2014 22:13:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: April 29, 2014
-- Description:	Retrieves the Groups, Members, Topics and Message statistics
-- =============================================
CREATE PROCEDURE [dbo].[GetStatistics]
AS
BEGIN
	-- Create a Table variable that will store the result
	DECLARE @stat TABLE (GroupCount bigint, MemberCount bigint, TopicCount bigint, MessageCount bigint, LoginUser bigint)
	DECLARE @Groups bigint,
			@Members bigint,
			@Topics bigint,
			@Messages bigint,
			@LoginUsers bigint
			
	-- Retrieve the number of Groups created	
    SET @Groups = (SELECT COUNT(1) FROM dbo.[Group] WHERE IsDeleted=0)
    
    -- Retrieve the number of Members registered
    SET @Members = (SELECT COUNT(1) FROM dbo.[Member])
    
    -- Retrieve the number of Topics created
    SET @Topics = (SELECT COUNT(1) FROM dbo.[Topic] WHERE IsDeleted=0)
    
    -- Retrieve the number of Messages created
    SET @Messages = (SELECT COUNT(1) FROM dbo.[Message] WHERE IsDeleted=0)
    	
    -- Retrieve the number of current Login Users
    --SET @LoginUser = (SELECT COUNT(1) FROM dbo.[Members] WHERE IsLogin = 1)	
	
	INSERT INTO @stat(GroupCount, MemberCount, TopicCount, MessageCount)--, LoginUser)
	VALUES (@Groups, @Members, @Topics, @Messages)--, @LoginUser)
	
	SELECT * FROM @stat

END

GO


