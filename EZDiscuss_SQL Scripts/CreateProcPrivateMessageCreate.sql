USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[PrivateMessageCreate]    Script Date: 09/16/2014 22:22:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: May 1, 2014
-- Description:	Inserts a new Private Message Record
-- =============================================
CREATE PROCEDURE [dbo].[PrivateMessageCreate]
(
	@SenderID bigint,
	@ReceiverID bigint,
	@Message varchar(1000),
	@PrivateMessageID bigint OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO dbo.[PrivateMessage]
	(
		SenderId,
		ReceiverId,
		[Message],
		DateCreated
	)			
    VALUES
    (
		@SenderID,
		@ReceiverID,
		@Message,
		GETDATE()
	)
	
	SET @PrivateMessageID = SCOPE_IDENTITY()	
END


GO


