USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[GroupUpdate]    Script Date: 09/16/2014 22:17:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 25, 2014
-- Description:	Updates Groups's record based on the paassed parameter
-- =============================================
CREATE PROCEDURE [dbo].[GroupUpdate]
	@GroupId bigint,
	@GroupName varchar(50),
	@GroupDescription varchar(250),
	@UpdatedBy bigint
AS
BEGIN
    UPDATE dbo.[Group]
    SET 
		GroupName = @GroupName,
		GroupDescription = @GroupDescription,
		DateUpdated = GETDATE(),
		UpdatedBy = @UpdatedBy
    WHERE GroupId = @GroupId
END


GO


