USE [master]
GO
DROP DATABASE [TEST_1]
GO

CREATE DATABASE [TEST_1] 
GO

USE [TEST_1]
GO

CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Administrator', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'hungnq', N'Nguyen Quang Hung', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'se190011', N'Tran Manh Hung', N'hcm', N'MB', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'he181122', N'Hoang Minh Thoa', N'hn', N'MB', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'de175533', N'Vo Thi Hoang Oanh', N'dn', N'MB', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'qe175533', N'Pham Tuan Minh', N'qn', N'MB', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'ce175533', N'Mai Thanh Quan', N'ct', N'MB', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'se171594', N'Nguyen Ngo Gia Minh ', N'hcm', N'AD', 1)
go