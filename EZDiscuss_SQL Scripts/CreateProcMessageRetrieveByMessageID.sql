USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MessageRetrieveByMessageID]    Script Date: 09/16/2014 22:21:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 29, 2014
-- Description:	Retrieves a Message record by MessageID
-- =============================================
CREATE PROCEDURE [dbo].[MessageRetrieveByMessageID]
(
	@MessageID bigint
)
AS
BEGIN

	SELECT
		m.MessageID,
		m.TopicID,
		m.MemberId,
		m.[Message],
		m.DateCreated,
		m.DateUpdated,
		m.UpdatedBy,
		m.DateDeleted,
		m.DeletedBy,
		m.IsDeleted
	FROM dbo.[Message] m
    WHERE m.MessageID = @MessageID
END


GO


