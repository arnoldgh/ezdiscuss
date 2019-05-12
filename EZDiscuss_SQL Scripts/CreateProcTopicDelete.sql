USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[TopicDelete]    Script Date: 09/16/2014 22:23:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: February 17, 2014
-- Description:	Deletes (soft delete) a Topic Record
-- =============================================

CREATE PROCEDURE [dbo].[TopicDelete]
(
	@TopicID bigint,
	@MemberID bigint
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
    UPDATE [dbo].[Topic]
		SET IsDeleted = 1,
			DateDeleted = GETDATE(),
			DeletedBy = @MemberID			
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


