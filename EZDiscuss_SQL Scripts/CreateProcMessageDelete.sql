USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MessageDelete]    Script Date: 09/16/2014 22:21:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 29, 2014
-- Description:	Deletes (soft delete) a Message record
-- =============================================
CREATE PROCEDURE [dbo].[MessageDelete]
(
	@MessageID bigint,
	@MemberID bigint
)
AS
BEGIN

	BEGIN TRY	
		UPDATE dbo.[Message]
		SET 
			IsDeleted = 0,
			DateDeleted = GETDATE(),
			DeletedBy = @MemberID
		WHERE MessageID = @MessageID
	END TRY
	BEGIN CATCH
		INSERT INTO dbo.ErrorLog (ErrorNumber, ErrorMessage, DateCreated, CreatedBy)
		--INSERT INTO dbo.ErrorLog (ErrorNumber, ErrorMessage, DateCreated, CreatedBy)		
		SELECT
			--ERROR_NUMBER() AS ErrorNumber,
			ERROR_MESSAGE() AS ErrorMessage,
			GETDATE(),
			@MemberID
	END CATCH
END


GO


