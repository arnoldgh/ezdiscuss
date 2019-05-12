USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[GroupCreate]    Script Date: 09/16/2014 22:14:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 25, 2014
-- Description:	Inserts a new Group record
-- =============================================
CREATE PROCEDURE [dbo].[GroupCreate]
	@GroupName varchar(50),
	@GroupType int,
	@GroupDescription varchar(250),	
	@MemberId bigint,
	@GroupId int OUTPUT
AS
BEGIN
    INSERT INTO dbo.[Group]
    ( GroupName,
      GroupType,
      GroupDescription,
      IsDeleted,     
      DateCreated,
      MemberId
    )
    VALUES
    ( @GroupName,
      @GroupType,
      @GroupDescription,
	  0,
	  GETDATE(),
	  @MemberId
    )
    
    SET @GroupId = SCOPE_IDENTITY()
END


GO


