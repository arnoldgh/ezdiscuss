USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[LogError]    Script Date: 09/16/2014 22:17:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: August 3, 2014
-- Description:	Logs the error message in the ErrorLog table
-- =============================================
CREATE PROCEDURE [dbo].[LogError]
	@PageName varchar(50),
	@MethodName varchar(50),
	@ErrorMessage varchar(1000),
	@CreatedBy bigint
AS
BEGIN
    INSERT INTO dbo.[ErrorLog]
    ( PageName,
      MethodName,
      ErrorMessage,
      DateCreated,
      CreatedBy
    )
    VALUES
    ( @PageName,
	  @MethodName,
      @ErrorMessage,
	  GETDATE(),
	  @CreatedBy
    )
END


GO


