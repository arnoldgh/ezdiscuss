USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MessagesRetrieveByTopicID]    Script Date: 09/16/2014 22:22:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 29, 2014
-- Description:	Retrieves all Message by TopicID
-- =============================================
CREATE PROCEDURE [dbo].[MessagesRetrieveByTopicID]
(
	@TopicID bigint
)
AS
BEGIN
	SELECT
		m.MessageID,
		m.TopicID,
		m.[Message],
		convert(varchar(10),m.DateCreated, 111) as 'DateCreated',
		m.MemberId,
		m.DateUpdated,
		m.UpdatedBy,
		m.DateDeleted,
		m.DeletedBy,
		m.IsDeleted,
		mem.Firstname,
		mem.Lastname
	FROM dbo.[Message] m
	JOIN dbo.Topic t
	ON m.TopicID = t.TopicID
	LEFT OUTER JOIN dbo.Member mem
	ON m.MemberId = mem.MemberId
    WHERE t.TopicID = @TopicID
    order by m.DateCreated DESC
END


GO


