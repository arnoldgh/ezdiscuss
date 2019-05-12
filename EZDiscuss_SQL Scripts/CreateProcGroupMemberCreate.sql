USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[GroupMemberCreate]    Script Date: 09/16/2014 22:15:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: January 25, 2014
-- Description:	Inserts a new GroupMember record
-- =============================================
CREATE PROCEDURE [dbo].[GroupMemberCreate]
	@GroupId bigint,
	@MemberId bigint,
	@GroupMemberId int OUTPUT
AS
BEGIN
    INSERT INTO dbo.[GroupMember]
    ( GroupId,
      MemberId,
      DateMemberJoined
    )
    VALUES
    ( @GroupId,
      @MemberId,
	  GETDATE()	  
    )
    
    SET @GroupMemberId = SCOPE_IDENTITY()
END


GO


