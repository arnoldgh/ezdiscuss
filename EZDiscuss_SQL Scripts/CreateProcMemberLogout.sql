USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MemberLogout]    Script Date: 09/16/2014 22:19:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: July 23, 2014
-- Description:	Update the Members table to log the date when the use logout.
--				This is used for Logout.
-- =============================================
CREATE PROCEDURE [dbo].[MemberLogout]
	@Email nvarchar(50),
	@Password varchar(20)
AS
BEGIN
    -- Update the Member Table to log the Login date
    UPDATE dbo.Member
    SET IsLogin = 0,
		DateLogin = NULL,
		IsLogout = 1,
		DateLogout = GETDATE()
    WHERE Email = @Email
    AND Password = @Password
    
    -- Then return the Member's record
    SELECT
		m.MemberId,
		m.Email,
		m.[Password],
		m.Firstname,
		m.Lastname,
		ISNULL(m.DateJoined, '') as 'DateJoined',
		ISNULL(m.DateUpdated, '') AS 'DateUpdated',
		ISNULL(m.DateDeleted, '') AS 'DateDeleted',
		ISNULL(m.IsDeleted, 0) AS 'IsDeleted',
		m.IsLogin,
		ISNULL(m.DateLogin, '') AS 'DateLogin',
		m.IsLogout,
		ISNULL(m.DateLogout, '') AS 'DateLogout'
    FROM dbo.Member m
    WHERE m.Email = @Email
    AND m.[Password] = @Password
END

GO


