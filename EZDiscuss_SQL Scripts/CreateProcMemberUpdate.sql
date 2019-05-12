USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MemberUpdate]    Script Date: 09/16/2014 22:20:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 25, 2014
-- Description:	Updates an existing Member record
-- =============================================
CREATE PROCEDURE [dbo].[MemberUpdate]
	@MemberId bigint,
	@Email varchar(50),
	@Password varchar(20),
	@Firstname varchar(50),
	@Lastname varchar(50),
	@Gender int,
	@Birthday date,
	@Photo varchar(50)
AS
BEGIN
	BEGIN TRY
		UPDATE dbo.Member
		SET Email = @Email,
			[Password] = @Password,
			Firstname = @Firstname,
			Lastname = @Lastname,
			Gender = @Gender,
			Birthday = @Birthday,
			DateUpdated = GETDATE(),
			Photo = @Photo
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


