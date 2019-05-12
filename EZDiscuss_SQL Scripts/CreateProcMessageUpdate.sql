USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MessageUpdate]    Script Date: 09/16/2014 22:22:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 29, 2014
-- Description:	Updates a Message record
-- =============================================
CREATE PROCEDURE [dbo].[MessageUpdate]
(
	@MessageID bigint,
	@Message varchar(250),
	@MemberID bigint
)
AS
BEGIN
    UPDATE dbo.[Message]
    SET 
		[Message] = @Message,
		DateUpdated = GETDATE(),
		UpdatedBy = @MemberID
    WHERE MessageID = @MessageID
END


GO


