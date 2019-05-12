USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[MemberCheckByEmail]    Script Date: 09/16/2014 22:18:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: April 14, 2014
-- Description:	Checks if Member exists based on email address
-- =============================================
CREATE PROCEDURE [dbo].[MemberCheckByEmail]
	@EmailAddress varchar(50)
AS
BEGIN
    SELECT
		m.MemberId,
		m.Email,
		m.[Password],
		m.Firstname,
		m.Lastname,
		m.DateJoined,
		m.DateUpdated,
		m.DateDeleted,
		m.IsDeleted		
    FROM dbo.Member m
    WHERE m.Email = @EmailAddress    
END


GO


