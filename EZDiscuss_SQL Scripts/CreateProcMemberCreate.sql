USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MemberCreate]    Script Date: 09/16/2014 22:18:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 25, 2014
-- Description:	Insert a new Member record into the Member table
-- =============================================
CREATE PROCEDURE [dbo].[MemberCreate]	
	@Email varchar(50),
	@Password varchar(10),
	@Firstname varchar(50),
	@Lastname varchar(50),
	@Gender int,
	@Birthday date,
	@Photo varchar(50) = null,
	@MemberId int OUTPUT	
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO dbo.Member
    (	Email,
		[Password],
		Firstname,
		Lastname,
		Gender,
		Birthday,
		Photo,
		DateJoined)
    VALUES
    (	@Email,
		@Password,
		@Firstname,
		@Lastname,
		@Gender,
		@Birthday,
		@Photo,
		GETDATE())
	
	SET @MemberId = SCOPE_IDENTITY()
END


GO


