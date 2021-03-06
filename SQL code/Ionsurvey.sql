USE [master]
GO
/****** Object:  Database [SurveyDB]    Script Date: 12/09/2014 21:55:26 ******/
CREATE DATABASE [SurveyDB] ON  PRIMARY 
( NAME = N'SurveyDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SurveyDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SurveyDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SurveyDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SurveyDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SurveyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SurveyDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SurveyDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SurveyDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SurveyDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SurveyDB] SET ARITHABORT OFF
GO
ALTER DATABASE [SurveyDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SurveyDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SurveyDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SurveyDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SurveyDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SurveyDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SurveyDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SurveyDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SurveyDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SurveyDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SurveyDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [SurveyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SurveyDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SurveyDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SurveyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SurveyDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SurveyDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SurveyDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SurveyDB] SET  READ_WRITE
GO
ALTER DATABASE [SurveyDB] SET RECOVERY FULL
GO
ALTER DATABASE [SurveyDB] SET  MULTI_USER
GO
ALTER DATABASE [SurveyDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SurveyDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'SurveyDB', N'ON'
GO
USE [SurveyDB]
GO
/****** Object:  Table [dbo].[UserSummary]    Script Date: 12/09/2014 21:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSummary](
	[User_ID] [int] NOT NULL,
	[Question_ID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_UserSummary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserSummary] ON
INSERT [dbo].[UserSummary] ([User_ID], [Question_ID], [ID], [Status]) VALUES (1, 13, 15, 1)
INSERT [dbo].[UserSummary] ([User_ID], [Question_ID], [ID], [Status]) VALUES (2, 13, 16, 1)
INSERT [dbo].[UserSummary] ([User_ID], [Question_ID], [ID], [Status]) VALUES (1, 14, 17, 1)
INSERT [dbo].[UserSummary] ([User_ID], [Question_ID], [ID], [Status]) VALUES (2, 14, 18, 1)
SET IDENTITY_INSERT [dbo].[UserSummary] OFF
/****** Object:  Table [dbo].[SurveyUser]    Script Date: 12/09/2014 21:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyUser](
	[Email_ID] [nvarchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Type] [nchar](10) NULL,
 CONSTRAINT [PK_SurveyUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SurveyUser] ON
INSERT [dbo].[SurveyUser] ([Email_ID], [ID], [User_Type]) VALUES (N'soumak.survey.test@gmail.com', 1, N'Emp       ')
INSERT [dbo].[SurveyUser] ([Email_ID], [ID], [User_Type]) VALUES (N'soumak.survey.test@gmail.com', 2, N'Emp       ')
SET IDENTITY_INSERT [dbo].[SurveyUser] OFF
/****** Object:  Table [dbo].[SurveyOptions]    Script Date: 12/09/2014 21:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyOptions](
	[QuestionID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Count] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_SurveyOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SurveyOptions] ON
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (10, 21, 6, N'Hello1')
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (10, 22, 1, N'Hello2')
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (11, 23, 1, N'sahjhas')
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (11, 24, 1, N'nasmdmas')
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (11, 25, 0, N'ansnmdsa')
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (12, 26, 2, N'dasdsa')
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (12, 27, 0, N'adsdad')
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (12, 28, 0, N'sdadd')
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (13, 29, 1, N'Yes')
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (13, 30, 1, N'No')
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (14, 31, 2, N'Yes')
INSERT [dbo].[SurveyOptions] ([QuestionID], [ID], [Count], [Description]) VALUES (14, 32, 0, N'No')
SET IDENTITY_INSERT [dbo].[SurveyOptions] OFF
/****** Object:  Table [dbo].[SurveyMaster]    Script Date: 12/09/2014 21:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Question_Detail] [nvarchar](max) NULL,
	[Created_By] [nvarchar](50) NULL,
	[Modified_By] [nvarchar](50) NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Question_Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_SurveyMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SurveyMaster] ON
INSERT [dbo].[SurveyMaster] ([ID], [Question_Detail], [Created_By], [Modified_By], [Start_Date], [End_Date], [Question_Type]) VALUES (13, N'Time will pass, will you?', NULL, NULL, CAST(0x0000A3FD00000000 AS DateTime), CAST(0x0000A3FE00000000 AS DateTime), NULL)
INSERT [dbo].[SurveyMaster] ([ID], [Question_Detail], [Created_By], [Modified_By], [Start_Date], [End_Date], [Question_Type]) VALUES (14, N'Will you pass TCSS 445?', NULL, NULL, CAST(0x0000A3FD00000000 AS DateTime), CAST(0x0000A3FE00000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SurveyMaster] OFF
/****** Object:  StoredProcedure [dbo].[USP_GetSurveyUser]    Script Date: 12/09/2014 21:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Soumak
-- Create date: 11-2-2014
-- Description:	Selects SurveyMaster
-- =============================================
create PROCEDURE [dbo].[USP_GetSurveyUser] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	SELECT * from SurveyUser 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetSurveyOption]    Script Date: 12/09/2014 21:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Soumak
-- Create date: 11-2-2014
-- Description:	Selects Options
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetSurveyOption] 
	-- Add the parameters for the stored procedure here
	@SurveyID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    
	SELECT * from SurveyOptions where QuestionID = @SurveyID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetSurveyMasterByID]    Script Date: 12/09/2014 21:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Soumak
-- Create date: 11-2-2014
-- Description:	Selects SurveyMaster
-- =============================================
create PROCEDURE [dbo].[USP_GetSurveyMasterByID] 
	-- Add the parameters for the stored procedure here
	@SurveyID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	SELECT * from SurveyMaster where ID = @SurveyID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetSurveyMaster]    Script Date: 12/09/2014 21:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Soumak
-- Create date: 11-2-2014
-- Description:	Selects SurveyMaster
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetSurveyMaster] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from SurveyMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CheckUserStatus]    Script Date: 12/09/2014 21:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Soumak
-- Create date: 11-2-2014
-- Description:	Selects SurveyMaster
-- =============================================
CREATE PROCEDURE [dbo].[USP_CheckUserStatus] 
	@QuestionID int,
	@UserID int,
	@Status int output
	
	
	
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select @Status = Status from UserSummary
    WHERE Question_ID = @QuestionID and User_ID=@UserID;
    if @Status is null
     
    begin
    set @Status = 0;
    Select @Status;
    return
    end
    
 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ChangeUserStatus]    Script Date: 12/09/2014 21:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Soumak
-- Create date: 11-2-2014
-- Description:	Selects SurveyMaster
-- =============================================
create PROCEDURE [dbo].[USP_ChangeUserStatus] 
	@QuestionID int,
	@UserID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF EXISTS ( select * from UserSummary
    WHERE Question_ID = @QuestionID and User_ID=@UserID)
    begin
    UPDATE UserSummary
SET Status=1
WHERE Question_ID = @QuestionID and User_ID=@UserID;
end
else
begin
    INSERT INTO table_name (User_ID,Question_ID,Status)
VALUES (@UserID,@QuestionID,1);
    end
    
   
 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AddUserSummary]    Script Date: 12/09/2014 21:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Soumak
-- Create date: 11-2-2014
-- Description:	Adds SurveyOptions
-- =============================================
create PROCEDURE [dbo].[USP_AddUserSummary] 
	-- Add the parameters for the stored procedure here
	@SurveyID int,
	@UserID int,
	
	@uid int = 0 OUTPUT 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
-- Insert statements for procedure here
	INSERT INTO UserSummary
           ([User_ID],[Question_ID])
     VALUES
           (@UserID,@SurveyID);
           
           SET @uid = SCOPE_IDENTITY()
           select @uid
 return
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AddOptionDetails]    Script Date: 12/09/2014 21:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Soumak
-- Create date: 11-2-2014
-- Description:	Adds SurveyOptions
-- =============================================
create PROCEDURE [dbo].[USP_AddOptionDetails] 
	-- Add the parameters for the stored procedure here
	@OptionDetails varchar(max),
	@SurveyID int,
	
	@uid int = 0 OUTPUT 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
-- Insert statements for procedure here
	INSERT INTO SurveyOptions
           ([Description],[QuestionID])
     VALUES
           (@OptionDetails,@SurveyID);
           
           SET @uid = SCOPE_IDENTITY()
           select @uid
 return
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AddOptionCount]    Script Date: 12/09/2014 21:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Soumak
-- Create date: 11-2-2014
-- Description:	Selects SurveyMaster
-- =============================================
CREATE PROCEDURE [dbo].[USP_AddOptionCount] 
	@OptionCount int,
	@OptionID int
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
   UPDATE SurveyOptions
   SET 
      [Count] = @OptionCount
      
 WHERE ID = @OptionID;
 
 Select 1;
 return
 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AddNewSurvey]    Script Date: 12/09/2014 21:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Soumak
-- Create date: 11-2-2014
-- Description:	Adds SurveyMaster
-- =============================================
create PROCEDURE [dbo].[USP_AddNewSurvey] 
	-- Add the parameters for the stored procedure here
	@QuestionDetail varchar(max),
	@QuestionType varchar(25),
	@StartDate date, 
	@EndDate date,
	@CreatedBy varchar(25),
	@ModifiedBy varchar(25),
	
	@uid int = 0 OUTPUT 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
-- Insert statements for procedure here
	INSERT INTO SurveyMaster
           ([Question_Detail],[Start_Date],[End_Date],[Created_By],[Modified_By])
     VALUES
           (@QuestionDetail,@StartDate,@EndDate,@CreatedBy,@ModifiedBy);
           
           SET @uid = SCOPE_IDENTITY()
           select @uid
 return
END
GO
/****** Object:  Default [DF_UserSummary_Status]    Script Date: 12/09/2014 21:55:26 ******/
ALTER TABLE [dbo].[UserSummary] ADD  CONSTRAINT [DF_UserSummary_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_SurveyOptions_Count]    Script Date: 12/09/2014 21:55:26 ******/
ALTER TABLE [dbo].[SurveyOptions] ADD  CONSTRAINT [DF_SurveyOptions_Count]  DEFAULT ((0)) FOR [Count]
GO
