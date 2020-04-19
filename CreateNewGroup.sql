-- =======================================================
-- Create Stored Procedure Template for Azure SQL Database
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE dbo.CreateNewGroup
(
    -- Add the parameters for the stored procedure here
		@GroupMax int,
		@CourseCode varchar(100),
		@MemberName varchar(100),
		@MemberPhone varchar(100),
		@MemberEmail varchar(100)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
		Insert Into Groups (GroupMax, CourseID) Values (@GroupMax, (Select CourseID From Courses Where CourseCode = @CourseCode))

		Insert Into Members (GroupID, MemberName, MemberEmail, MemberPhone) Values (@@Identity, @MemberName, @MemberEmail, @MemberPhone)
END
GO