USE [db_Admin]
GO
/****** Object:  Table [dbo].[admin_AccessGroupUserForm]    Script Date: 11/10/2019 10:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_AccessGroupUserForm](
	[guf_id] [int] IDENTITY(1,1) NOT NULL,
	[guf_active] [bit] NULL,
	[groupuser_id] [int] NULL,
	[form_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[guf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_AccessGroupUserModule]    Script Date: 11/10/2019 10:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_AccessGroupUserModule](
	[gum_id] [int] IDENTITY(1,1) NOT NULL,
	[gum_active] [bit] NULL,
	[groupuser_id] [int] NULL,
	[module_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[gum_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_AccessUserForm]    Script Date: 11/10/2019 10:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_AccessUserForm](
	[uf_id] [int] IDENTITY(1,1) NOT NULL,
	[uf_active] [bit] NULL,
	[username_id] [int] NULL,
	[form_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_Form]    Script Date: 11/10/2019 10:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Form](
	[form_id] [int] IDENTITY(1,1) NOT NULL,
	[form_position] [int] NULL,
	[form_name] [nvarchar](max) NULL,
	[form_link] [nvarchar](max) NULL,
	[form_active] [bit] NULL,
	[module_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[form_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_GroupUser]    Script Date: 11/10/2019 10:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_GroupUser](
	[groupuser_id] [int] IDENTITY(1,1) NOT NULL,
	[groupuser_name] [nvarchar](max) NULL,
	[groupuser_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[groupuser_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_Module]    Script Date: 11/10/2019 10:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Module](
	[module_id] [int] IDENTITY(1,1) NOT NULL,
	[module_position] [int] NULL,
	[module_name] [nvarchar](max) NULL,
	[module_icon] [nvarchar](max) NULL,
	[module_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[module_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_User]    Script Date: 11/10/2019 10:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_User](
	[username_id] [int] IDENTITY(1,1) NOT NULL,
	[username_username] [nvarchar](max) NULL,
	[username_password] [nvarchar](max) NULL,
	[username_fullname] [nvarchar](max) NULL,
	[username_gender] [bit] NULL,
	[username_phone] [nvarchar](max) NULL,
	[username_email] [nvarchar](max) NULL,
	[username_active] [bit] NULL,
	[groupuser_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[admin_AccessGroupUserForm] ON 

INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (2, 1, 1, 2)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (3, 1, 1, 3)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (4, 1, 1, 4)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (64, 1, 1, 33)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (65, 1, 1, 34)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (66, 1, 1, 35)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (67, 1, 1, 36)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (68, 1, 1, 37)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (69, 1, 1, 38)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (70, 1, 1, 39)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (71, 1, 1, 40)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (72, 1, 1, 41)
SET IDENTITY_INSERT [dbo].[admin_AccessGroupUserForm] OFF
SET IDENTITY_INSERT [dbo].[admin_AccessGroupUserModule] ON 

INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (2, 1, 1, 2)
INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (33, 1, 1, 16)
INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (34, 1, 1, 17)
INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (35, 1, 1, 18)
SET IDENTITY_INSERT [dbo].[admin_AccessGroupUserModule] OFF
SET IDENTITY_INSERT [dbo].[admin_AccessUserForm] ON 

INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (2, 1, 1, 2)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (3, 1, 1, 3)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (4, 1, 1, 4)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (59, 1, 1, 33)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (60, 1, 1, 34)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (61, 1, 1, 35)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (62, 1, 1, 36)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (63, 1, 1, 37)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (64, 1, 1, 38)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (65, 1, 1, 39)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (66, 1, 1, 40)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (67, 1, 1, 41)
SET IDENTITY_INSERT [dbo].[admin_AccessUserForm] OFF
SET IDENTITY_INSERT [dbo].[admin_Form] ON 

INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (1, 1, N'Quản lý phân quyền', N'admin-access', 1, 1)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (2, 2, N'Quản lý Module', N'admin-module', 1, 1)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (3, 3, N'Quản lý Form', N'admin-form', 1, 1)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (4, 1, N'Quản lý tài khoản', N'admin-account', 1, 2)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (33, NULL, N'Danh sách giáo viên', N'admin-giao-vien', 1, 17)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (34, NULL, N'Danh sách trung tâm', N'admin-truong', 1, 16)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (35, NULL, N'Năm học', N'admin-nam-hoc', 1, 16)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (36, NULL, N'Danh sách lớp học', N'admin-lop-hoc', 1, 16)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (37, NULL, N'Môn học', N'admin-mon-hoc', 1, 16)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (38, NULL, N'Danh sách học sinh', N'admin-hoc-sinh', 1, 18)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (39, NULL, N'Phân lớp cho giáo viên', N'admin-giao-vien-day-lop', 1, 17)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (40, NULL, N'Danh sách đã phân công', N'admin-danh-sach-giao-vien-da-phan-cong', 1, 17)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (41, NULL, N'Tạo lớp học cho học sinh', N'admin-hoc-sinh-trong-lop', 1, 18)
SET IDENTITY_INSERT [dbo].[admin_Form] OFF
SET IDENTITY_INSERT [dbo].[admin_GroupUser] ON 

INSERT [dbo].[admin_GroupUser] ([groupuser_id], [groupuser_name], [groupuser_active]) VALUES (1, N'root', 1)
INSERT [dbo].[admin_GroupUser] ([groupuser_id], [groupuser_name], [groupuser_active]) VALUES (2, N'Admin', 1)
INSERT [dbo].[admin_GroupUser] ([groupuser_id], [groupuser_name], [groupuser_active]) VALUES (3, N'Employees
', 1)
SET IDENTITY_INSERT [dbo].[admin_GroupUser] OFF
SET IDENTITY_INSERT [dbo].[admin_Module] ON 

INSERT [dbo].[admin_Module] ([module_id], [module_position], [module_name], [module_icon], [module_active]) VALUES (1, 1, N'Phân quyền', N'', 1)
INSERT [dbo].[admin_Module] ([module_id], [module_position], [module_name], [module_icon], [module_active]) VALUES (2, 2, N'Tài khoản', N'fas fa-users', 1)
INSERT [dbo].[admin_Module] ([module_id], [module_position], [module_name], [module_icon], [module_active]) VALUES (16, NULL, N'Danh mục', N'', 1)
INSERT [dbo].[admin_Module] ([module_id], [module_position], [module_name], [module_icon], [module_active]) VALUES (17, NULL, N'Quản lý giáo viên', N'', 1)
INSERT [dbo].[admin_Module] ([module_id], [module_position], [module_name], [module_icon], [module_active]) VALUES (18, NULL, N'Quản lý học sinh', N'', 1)
SET IDENTITY_INSERT [dbo].[admin_Module] OFF
SET IDENTITY_INSERT [dbo].[admin_User] ON 

INSERT [dbo].[admin_User] ([username_id], [username_username], [username_password], [username_fullname], [username_gender], [username_phone], [username_email], [username_active], [groupuser_id]) VALUES (1, N'root', N'12378248145104161527610811213823414203124130', N'ROOT', 1, N'01634057167', N'qutienpro@gmail.com', 1, 1)
INSERT [dbo].[admin_User] ([username_id], [username_username], [username_password], [username_fullname], [username_gender], [username_phone], [username_email], [username_active], [groupuser_id]) VALUES (2, N'admin', N'12378248145104161527610811213823414203124130', N'Quản trị', 1, N'12345', N'quantri@hifiveplus.vn', 1, 2)
INSERT [dbo].[admin_User] ([username_id], [username_username], [username_password], [username_fullname], [username_gender], [username_phone], [username_email], [username_active], [groupuser_id]) VALUES (3, N'staff', N'12378248145104161527610811213823414203124130', N'Nhân viên', 0, N'67891', N'staff@hifiveplus.vn', 1, 3)
SET IDENTITY_INSERT [dbo].[admin_User] OFF
ALTER TABLE [dbo].[admin_AccessGroupUserForm]  WITH CHECK ADD FOREIGN KEY([form_id])
REFERENCES [dbo].[admin_Form] ([form_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_AccessGroupUserForm]  WITH CHECK ADD FOREIGN KEY([groupuser_id])
REFERENCES [dbo].[admin_GroupUser] ([groupuser_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_AccessGroupUserModule]  WITH CHECK ADD FOREIGN KEY([groupuser_id])
REFERENCES [dbo].[admin_GroupUser] ([groupuser_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_AccessGroupUserModule]  WITH CHECK ADD FOREIGN KEY([module_id])
REFERENCES [dbo].[admin_Module] ([module_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_AccessUserForm]  WITH CHECK ADD FOREIGN KEY([form_id])
REFERENCES [dbo].[admin_Form] ([form_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_AccessUserForm]  WITH CHECK ADD FOREIGN KEY([username_id])
REFERENCES [dbo].[admin_User] ([username_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_Form]  WITH CHECK ADD FOREIGN KEY([module_id])
REFERENCES [dbo].[admin_Module] ([module_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_User]  WITH CHECK ADD FOREIGN KEY([groupuser_id])
REFERENCES [dbo].[admin_GroupUser] ([groupuser_id])
ON UPDATE CASCADE
GO
