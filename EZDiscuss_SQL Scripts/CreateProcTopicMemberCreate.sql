USE [EZDiscuss]
GO

/****** Object:  StoredProcedure [dbo].[TopicMemberCreate]    Script Date: 09/16/2014 22:24:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Arnold Higuit
-- Create date: April 14, 2014
-- Description:	Inserts a new TopicMember record
-- =============================================
CREATE PROCEDURE [dbo].[TopicMemberCreate]
	@TopicId bigint,
	@MemberId bigint,
	@TopicMemberId int OUTPUT
AS
BEGIN
    INSERT INTO dbo.[TopicMember]
    ( TopicId,
      MemberId,
      DateMemberJoined
    )
    VALUES
    ( @TopicId,
      @MemberId,
	  GETDATE()	  
    )
    
    SET @TopicMemberId = SCOPE_IDENTITY()
END


GO


