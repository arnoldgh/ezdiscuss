USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[TopicUpdate]    Script Date: 09/16/2014 22:25:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: February 17, 2014
-- Description:	Updates a Topic Record
-- =============================================

CREATE PROCEDURE [dbo].[TopicUpdate]
(
	@TopicID bigint,
	@TopicTitle varchar(100),
	@TopicDescription varchar(250),
	@MemberID bigint
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
    UPDATE [dbo].[Topic]
		SET [TopicTitle] = @TopicTitle,
			[TopicDescription] = @TopicDescription,
			UpdatedBy = @MemberID,
			DateUpdated = GETDATE()			
		WHERE TopicID = @TopicID	
	END TRY
	BEGIN CATCH
		INSERT INTO dbo.ErrorLog (ErrorMessage, DateCreated, CreatedBy)
		SELECT 
			ERROR_MESSAGE() AS ErrorMessage,
			GETDATE(),
			@MemberID
	END CATCH		
END


GO


