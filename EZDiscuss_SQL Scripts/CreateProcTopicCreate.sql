USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[TopicCreate]    Script Date: 09/16/2014 22:23:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: February 17, 2014
-- Description:	Inserts a new Topic Record
-- =============================================

CREATE PROCEDURE [dbo].[TopicCreate]
(
	@GroupId bigint,
	@MemberId bigint,
	@TopicTitle varchar(100),
	@TopicDescription varchar(250),
	@TopicID bigint OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Topic]
	(
		[GroupId],
		[MemberId],
		[TopicTitle],
		[TopicDescription],		
		DateCreated		
	)
    VALUES
    (
		@GroupId,
		@MemberId,		
		@TopicTitle,
		@TopicDescription,
		GETDATE()
	)
		
	SET @TopicID = SCOPE_IDENTITY()	

	-- Also, insert a new record in the TopicMember table.
	-- This Member should automatically be added as one of the Participants for this Topic
	INSERT INTO dbo.TopicMember (TopicId, MemberId, DateMemberJoined)
	VALUES (@TopicID, @MemberID, GETDATE())
	
END


GO


