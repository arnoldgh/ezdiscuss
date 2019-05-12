USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MemberPhotoUpload]    Script Date: 09/16/2014 22:19:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: June 21, 2014
-- Description:	Updates the Photo of an existing Member record
-- =============================================
CREATE PROCEDURE [dbo].[MemberPhotoUpload]
	@MemberId bigint,
	@Photo varchar(50)
AS
BEGIN
	BEGIN TRY
		UPDATE dbo.Member
		SET	Photo = @Photo
		WHERE MemberId = @MemberId	
	END TRY
	BEGIN CATCH
		INSERT INTO dbo.ErrorLog (ErrorNumber, ErrorMessage, DateCreated, CreatedBy)
		SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_MESSAGE() AS ErrorMessage,
			GETDATE(),
			@MemberID
	END CATCH
END


GO


