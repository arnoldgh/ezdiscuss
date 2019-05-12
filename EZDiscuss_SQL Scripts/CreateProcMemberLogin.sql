USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MemberLogin]    Script Date: 09/29/2014 22:43:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: February 23, 2014
-- Description:	Retrieves Member's record based on Member's Email and Password.
--				This is used for Login.
-- =============================================
CREATE PROCEDURE [dbo].[MemberLogin]
	@Email nvarchar(50),
	@Password varchar(20)
AS
BEGIN
    -- Update the Member Table to log the Login date
    UPDATE dbo.Member
    SET IsLogin = 1,
		DateLogin = GETDATE(),
		IsLogout = 0,
		DateLogout = NULL
    WHERE Email = @Email
    AND Password = @Password
    
    -- Then return the Member's record
    SELECT
		m.MemberId,
		m.Email,
		m.[Password],
		m.Firstname,
		m.Lastname,
		m.Gender,
		m.Birthday,		
		ISNULL(m.DateJoined, '') as 'DateJoined',
		ISNULL(m.DateUpdated, '') AS 'DateUpdated',
		ISNULL(m.DateDeleted, '') AS 'DateDeleted',
		ISNULL(m.IsDeleted, 0) as 'IsDeleted',
		m.IsLogin,
		ISNULL(m.DateLogin, '') AS 'DateLogin',
		m.IsLogout,
		ISNULL(m.DateLogout, '') AS 'DateLogout',
		ISNULL(m.Photo, '') AS 'Photo'
    FROM dbo.Member m
    WHERE m.Email = @Email
    AND m.[Password] = @Password
END

GO


