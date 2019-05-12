USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MemberRetrieve]    Script Date: 09/29/2014 22:45:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 25, 2014
-- Description:	Retrieves Member's record based on Member's Id
-- =============================================
CREATE PROCEDURE [dbo].[MemberRetrieve]
	@MemberId bigint
AS
BEGIN
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
    WHERE m.MemberId = @MemberId    
END

    

GO


