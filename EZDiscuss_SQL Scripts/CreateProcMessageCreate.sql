USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MessageCreate]    Script Date: 09/16/2014 22:20:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 29, 2014
-- Description:	Inserts a new Message Record
-- =============================================
CREATE PROCEDURE [dbo].[MessageCreate]
(
	@TopicID bigint,
	@MemberID bigint,
	@Message varchar(250),	
	@MessageID bigint OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO dbo.[Message]
	(
		TopicID,
		[Message],
		DateCreated,
		MemberId
	)			
    VALUES
    (
		@TopicID,
		@Message,
		GETDATE(),
		@MemberID
	)
	
	SET @MessageID = SCOPE_IDENTITY()
	
	-- Also, insert a new record in the TopicMember table.
	-- This Member should automatically be added as one of the Participants for this Topic
	INSERT INTO dbo.TopicMember (TopicId, MemberId, DateMemberJoined)
	VALUES (@TopicID, @MemberID, GETDATE())	
END


GO


