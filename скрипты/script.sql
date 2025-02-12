USE [demo]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 23.09.2024 12:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[ID_equipment] [int] NOT NULL,
	[ID_malfunction] [int] NOT NULL,
	[ID_client] [int] NOT NULL,
	[Job_description] [nvarchar](max) NOT NULL,
	[ID_satatus] [int] NOT NULL,
	[ID_executor] [int] NOT NULL,
	[time] [int] NULL,
	[ID_priority] [int] NOT NULL,
	[ID_stage] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 23.09.2024 12:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[ID] [int] NOT NULL,
	[equipment] [nvarchar](50) NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[malfunction]    Script Date: 23.09.2024 12:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[malfunction](
	[ID] [int] NOT NULL,
	[malfunction] [nvarchar](50) NULL,
 CONSTRAINT [PK_malfunction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[priority]    Script Date: 23.09.2024 12:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[priority](
	[ID] [int] NOT NULL,
	[priority] [nvarchar](50) NULL,
 CONSTRAINT [PK_priority] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 23.09.2024 12:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IDRole] [int] NOT NULL,
	[NameRole] [nvarchar](10) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stage]    Script Date: 23.09.2024 12:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stage](
	[ID] [int] NOT NULL,
	[stage] [nvarchar](50) NULL,
 CONSTRAINT [PK_stage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 23.09.2024 12:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[ID] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23.09.2024 12:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] NOT NULL,
	[USER] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (2, CAST(N'2023-03-13' AS Date), 2, 2, 126, N'Нарушение в электрических цепях', 2, 110, NULL, 1, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (3, CAST(N'2023-03-14' AS Date), 3, 3, 127, N'Износ деталей', 3, 105, NULL, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (4, CAST(N'2023-03-15' AS Date), 4, 4, 128, N'Ошибки в работе управляещего ПО', 3, 105, NULL, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (5, CAST(N'2023-03-16' AS Date), 5, 1, 129, N'Внешние признаки неработоспособности', 3, 119, NULL, 1, 1, N'Ремонт полность выполнен без дополниетльных запчастей')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (6, CAST(N'2023-03-17' AS Date), 5, 1, 131, N'Появление дыма при работе', 1, 106, NULL, 2, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (7, CAST(N'2023-03-18' AS Date), 6, 1, 131, N'Поломка механических деталей конструкции', 3, 137, NULL, 2, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (8, CAST(N'2023-03-19' AS Date), 7, 1, 101, N'Посторонние шумы', 3, 105, NULL, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (9, CAST(N'2023-03-20' AS Date), 8, 2, 101, N'Нарушения в электрических компонентах', 3, 137, NULL, 1, 3, N'Отсутствуют необходимые инностранные запчасти')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (10, CAST(N'2023-03-21' AS Date), 9, 3, 102, N'Ошибки монтажа', 3, 146, 2, 3, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (11, CAST(N'2023-03-22' AS Date), 10, 5, 102, N'Попадание грязи и влаги', 3, 119, 10, 2, 1, N'Потребовались дополнительные запчасти')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (12, CAST(N'2023-03-23' AS Date), 11, 2, 102, N'Нарушения в электрических соединениях', 2, 115, NULL, 1, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (13, CAST(N'2023-03-24' AS Date), 9, 2, 107, N'Нарушения в электрических соединениях', 3, 119, 10, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (14, CAST(N'2023-03-25' AS Date), 8, 4, 107, N'Ошибки в работе прошивок', 3, 106, NULL, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (15, CAST(N'2023-03-26' AS Date), 12, 4, 131, N'Ошибки в работе управляещего ПО', 3, 106, 8, 2, 3, N'Отсутствуют необходимые инностранные запчасти')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (16, CAST(N'2023-03-27' AS Date), 13, 5, 107, N'Попадание грязи и влаги', 1, 137, NULL, 1, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (17, CAST(N'2023-03-28' AS Date), 9, 1, 116, N'Износ элементов конструкции', 2, 110, NULL, 3, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (18, CAST(N'2023-03-29' AS Date), 14, 1, 101, N'Износ элементов конструкции', 2, 110, NULL, 3, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (19, CAST(N'2023-03-30' AS Date), 5, 3, 117, N'Износ деталей', 1, 146, NULL, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (20, CAST(N'2023-03-31' AS Date), 15, 1, 116, N'Поломка механических деталей конструкции', 1, 137, NULL, 1, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (21, CAST(N'2023-04-01' AS Date), 16, 3, 134, N'Ошибки монтажа', 3, 106, 2, 1, 1, N'Ремонт полность выполнен без дополниетльных запчастей')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (22, CAST(N'2023-04-02' AS Date), 17, 3, 118, N'Воздействие вредных факторов среды', 3, 137, 10, 2, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (23, CAST(N'2023-04-03' AS Date), 18, 2, 111, N'Нарушения в электрических компонентах', 3, 137, NULL, 1, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (24, CAST(N'2023-04-04' AS Date), 18, 5, 145, N'Ошибки проектирования', 3, 105, 8, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (25, CAST(N'2023-04-05' AS Date), 19, 1, 116, N'Внешние признаки неработоспособности', 2, 137, NULL, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (26, CAST(N'2023-04-06' AS Date), 5, 5, 145, N'Воздействие вредных факторов среды', 2, 146, NULL, 3, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (27, CAST(N'2023-04-07' AS Date), 16, 2, 150, N'Нарушение в электрических цепях', 3, 105, 12, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (28, CAST(N'2023-04-08' AS Date), 18, 1, 134, N'Появление дыма при работе', 3, 105, 2, 3, 3, N'Отсутствуют необходимые инностранные запчасти')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (29, CAST(N'2023-04-09' AS Date), 15, 1, 116, N'Поломка механических деталей конструкции', 3, 146, 10, 2, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (30, CAST(N'2023-04-10' AS Date), 20, 1, 117, N'Поломка механических деталей конструкции', 2, 105, NULL, 3, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (31, CAST(N'2023-04-11' AS Date), 21, 5, 117, N'Загрязнение деталей', 3, 119, 10, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (32, CAST(N'2023-04-12' AS Date), 18, 4, 111, N'Ошибки в работе управляещего ПО', 1, 115, NULL, 3, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (33, CAST(N'2023-04-13' AS Date), 22, 4, 134, N'Ошибки в работе прошивок', 3, 115, 8, 2, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (34, CAST(N'2023-04-14' AS Date), 7, 5, 117, N'Загрязнение деталей', 1, 137, NULL, 3, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (35, CAST(N'2023-04-15' AS Date), 18, 5, 117, N'Загрязнение деталей', 2, 106, NULL, 3, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (36, CAST(N'2023-04-02' AS Date), 23, 2, 145, N'Нарушение в электрических цепях', 2, 137, NULL, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (37, CAST(N'2023-04-03' AS Date), 18, 2, 118, N'Нарушение в электрических цепях', 2, 110, NULL, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (38, CAST(N'2023-04-04' AS Date), 21, 1, 134, N'Износ элементов конструкции', 3, 137, 10, 2, 3, N'Отсутствуют необходимые инностранные запчасти')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (39, CAST(N'2023-04-05' AS Date), 15, 1, 145, N'Износ элементов конструкции', 2, 137, NULL, 1, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (40, CAST(N'2023-04-06' AS Date), 15, 1, 118, N'Посторонние шумы', 1, 105, NULL, 2, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (41, CAST(N'2023-04-07' AS Date), 24, 1, 145, N'Появление дыма при работе', 3, 146, NULL, 1, 3, N'Отсутствуют необходимые инностранные запчасти')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (42, CAST(N'2023-04-08' AS Date), 21, 3, 145, N'Износ деталей', 2, 115, NULL, 1, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (43, CAST(N'2023-04-09' AS Date), 16, 2, 117, N'Нарушения в электрических соединениях', 3, 105, 21, 1, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (44, CAST(N'2023-04-01' AS Date), 5, 1, 145, N'Поломка механических деталей конструкции', 2, 105, NULL, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (45, CAST(N'2023-04-02' AS Date), 16, 5, 117, N'Загрязнение деталей', 3, 137, 12, 1, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (46, CAST(N'2023-04-03' AS Date), 25, 2, 145, N'Нарушения в электрических компонентах', 3, 110, 8, 2, 2, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (47, CAST(N'2023-04-04' AS Date), 21, 2, 111, N'Нарушение в электрических цепях', 3, 106, NULL, 3, 1, N'Потребовались дополнительные запчасти')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (48, CAST(N'2023-04-05' AS Date), 26, 5, 134, N'Загрязнение деталей', 1, 137, NULL, 2, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (49, CAST(N'2023-04-06' AS Date), 25, 4, 145, N'Ошибки в работе управляещего ПО', 3, 115, NULL, 3, 1, N'')
INSERT [dbo].[Application] ([ID], [Date], [ID_equipment], [ID_malfunction], [ID_client], [Job_description], [ID_satatus], [ID_executor], [time], [ID_priority], [ID_stage], [Comment]) VALUES (50, CAST(N'2023-04-07' AS Date), 5, 1, 118, N'Посторонние шумы', 3, 105, NULL, 2, 1, N'')
GO
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (1, N'Токарный станок АП567
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (2, N'Фрезерный станок 12
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (3, N'Расточный станок ТИ90
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (4, N'Расточный станок ОР99
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (5, N'Расточный станок 55
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (6, N'Токарный станок ОР788
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (7, N'Сверлильный станок ВТ567
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (8, N'Лазерный станок для резки металла
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (9, N'Гибочный станок ВА34
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (10, N'Фрезерный станок 124
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (11, N'Фрезерный станок 45
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (12, N'Фрезерный станок ВА44
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (13, N'Фрезерный станок 766
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (14, N'Шлифовальный станок
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (15, N'Шлифовальный станок 66
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (16, N'Гибочный станок СМ44
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (17, N'Расточный станок СМИ56
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (18, N'Гибочный станок ВА35
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (19, N'Токарный станок ЛОР
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (20, N'Токарный станок
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (21, N'Плазменный станок ПС567
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (22, N'Шлифовальный станок РП77
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (23, N'Фрезерный станок 77
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (24, N'Токарный станок ФЫ567
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (25, N'Лазерный станок для резки металла ПА56
')
INSERT [dbo].[Equipment] ([ID], [equipment]) VALUES (26, N'Фрезерный станок РП77
')
GO
INSERT [dbo].[malfunction] ([ID], [malfunction]) VALUES (1, N'Механическая')
INSERT [dbo].[malfunction] ([ID], [malfunction]) VALUES (2, N'Электрическая')
INSERT [dbo].[malfunction] ([ID], [malfunction]) VALUES (3, N'Ошибки эксплуатации')
INSERT [dbo].[malfunction] ([ID], [malfunction]) VALUES (4, N'Программная')
INSERT [dbo].[malfunction] ([ID], [malfunction]) VALUES (5, N'Ненадлежащее обслуживание')
GO
INSERT [dbo].[priority] ([ID], [priority]) VALUES (1, N'Низкий')
INSERT [dbo].[priority] ([ID], [priority]) VALUES (2, N'Высокий')
INSERT [dbo].[priority] ([ID], [priority]) VALUES (3, N'Средний')
GO
INSERT [dbo].[Role] ([IDRole], [NameRole]) VALUES (1, N'Заказчик')
INSERT [dbo].[Role] ([IDRole], [NameRole]) VALUES (2, N'Мастер')
INSERT [dbo].[Role] ([IDRole], [NameRole]) VALUES (3, N'Оператор')
INSERT [dbo].[Role] ([IDRole], [NameRole]) VALUES (4, N'Менеджер')
GO
INSERT [dbo].[stage] ([ID], [stage]) VALUES (1, N'Выполнено')
INSERT [dbo].[stage] ([ID], [stage]) VALUES (2, N'В работе')
INSERT [dbo].[stage] ([ID], [stage]) VALUES (3, N'Не выполнено')
GO
INSERT [dbo].[status] ([ID], [status]) VALUES (1, N'В ожидании')
INSERT [dbo].[status] ([ID], [status]) VALUES (2, N'В работе')
INSERT [dbo].[status] ([ID], [status]) VALUES (3, N'Выполнено')
GO
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (101, N'Ефремов Сергей Пантелеймонович', N'loginDEppn2018', N'6}i+FD', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (102, N'Родионова Тамара Валентиновна', N'loginDElqb2018', N'RNynil', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (103, N'Миронова Галина Улебовна', N'loginDEydn2018', N'34I}X9', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (104, N'Сидоров Роман Иринеевич', N'loginDEijg2018', N'4QlKJW', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (105, N'Ситников Парфений Всеволодович', N'loginDEdpy2018', N'MJ0W|f', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (106, N'Никонов Роман Геласьевич', N'loginDEwdm2018', N'&PynqU', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (107, N'Щербаков Владимир Матвеевич', N'loginDEdup2018', N'JM+2{s', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (108, N'Кулаков Мартын   Михаилович', N'loginDEhbm2018', N'9aObu4', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (109, N'  Сазонова Оксана Лаврентьевна', N'loginDExvq2018', N'hX0wJz', 3)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (110, N'Архипов Варлам Мэлорович', N'loginDErks2018', N'LQNSjo', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (111, N'Устинова Ираида Мэлоровна', N'loginDErvb2018', N'ceAf&R', 3)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (112, N'Лукин Георгий Альбертович', N'loginDEulo2018', N'fg56DRgh', 3)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (113, N'Кононов Эдуард Валентинович', N'loginDEgfw2018', N'3c2Ic1', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (114, N'Орехова Клавдия Альбертовна', N'loginDEmxb2018', N'ZPXcRS', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (115, N'Яковлев Яков Эдуардович', N'loginDEgeq2018', N'&&Eim0', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (116, N'Воронов Мэлс Семёнович', N'loginDEkhj2018', N'Pbc0t{', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (117, N'Вишнякова Ия Данииловна', N'loginDEliu2018', N'32FyTl', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (118, N'Третьяков Фёдор Вадимович', N'loginDEsmf2018', N'{{O2QG', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (119, N'Макаров Максим Ильяович', N'loginDEutd2018', N'GbcJvC', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (120, N'Шубина Маргарита Анатольевна', N'loginDEpgh2018', N'YV2lvh', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (121, N'Блинова Ангелина Владленовна', N'loginDEvop2018', N'pBP8rO', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (122, N'Воробьёв Владлен Фролович', N'loginDEwjo2018', N'EQaD|d', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (123, N'  Сорокина Прасковья Фёдоровна', N'loginDEbur2018', N'aZKGeI', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (124, N'Давыдов    Яков Антонович', N'loginDEszw2018', N'EGU{YE', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (125, N'Рыбакова Евдокия Анатольевна', N'loginDExsu2018', N'*2RMsp', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (126, N'Маслов Геннадий Фролович', N'loginDEztn2018', N'nJBZpU', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (127, N'Цветкова Элеонора Аристарховна', N'loginDEtmn2018', N'UObB}N', 4)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (128, N'Евдокимов Ростислав Александрович', N'loginDEhep2018', N'SwRicr', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (129, N'   Никонова Венера Станиславовна', N'loginDEevr2018', N'zO5l}l', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (130, N'Громов Егор Антонович', N'loginDEnpa2018', N'M*QLjf', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (131, N'Суворова Валерия Борисовна', N'loginDEgyt2018', N'Pav+GP', 3)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (132, N'Мишина Елизавета Романовна', N'loginDEbrr2018', N'Z7L|+i', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (133, N'Зимина   Ольга Аркадьевна', N'loginDEyoo2018', N'UG1BjP', 3)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (134, N'Игнатьев Игнатий Антонинович', N'loginDEaob2018', N'3fy+3I', 3)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (135, N'Пахомова Зинаида Витальевна', N'loginDEwtz2018', N'&GxSST', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (136, N'Устинов Владимир Федосеевич', N'loginDEctf2018', N'sjt*3N', 3)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (137, N'Кулаков Мэлор Вячеславович', N'loginDEipm2018', N'MAZl6|', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (138, N'Сазонов Авксентий Брониславович', N'loginDEjoi2018', N'o}C4jv', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (139, N' Бурова Наина Брониславовна', N'loginDEwap2018', N'4hny7k', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (140, N'Фадеев Демьян Федосеевич', N'loginDEaxm2018', N'BEc3xq', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (141, N'Бобылёва Дарья    Якуновна', N'loginDEsmq2018', N'ATVmM7', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (142, N'Виноградов Созон Арсеньевич', N'loginDEeur2018', N'n4V{wP', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (143, N'Гордеев Владлен Ефимович', N'loginDEvke2018', N'WQLXSl', 4)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (144, N'Иванова  Зинаида Валерьевна', N'loginDEvod2018', N'0EW93v', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (145, N'Гусев Руслан Дамирович', N'loginDEjaw2018', N'h6z&Ky', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (146, N'Маслов Дмитрий Иванович', N'loginDEpdp2018', N'8NvRfC', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (147, N'Антонова Ульяна Семёновна', N'loginDEjpp2018', N'oMOQq3', 1)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (148, N'Орехова Людмила    Владимировна', N'loginDEkiy2018', N'BQzsts', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (149, N'Авдеева  Жанна Куприяновна', N'loginDEhmn2018', N'a|Iz|7', 2)
INSERT [dbo].[Users] ([ID], [USER], [Login], [Password], [Role]) VALUES (150, N'Кузнецов Фрол Варламович', N'loginDEfmn2018', N'cw3|03', 1)
GO
