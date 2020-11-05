
--SQL 5th OCT for adding configuration key in DataBase
CREATE TABLE [dbo].[AppConfiguration](
	ConfigurationId [int] IDENTITY NOT NULL,
	[Key] [varchar](100) NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
)
GO

INSERT INTO [AppConfiguration] ([Key], [Value], [Description])  values('IsDevelopmentMode', 'true', 'To prevent settings like payement gate way and google analytics to excuet in Dev environment');