USE [demoe]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 23.09.2024 12:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfFault]    Script Date: 23.09.2024 12:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfFault](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeOfFault] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 23.09.2024 12:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priority]    Script Date: 23.09.2024 12:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priority](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Step]    Script Date: 23.09.2024 12:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Step](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](12) NOT NULL,
 CONSTRAINT [PK_Step] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23.09.2024 12:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](150) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 23.09.2024 12:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[id] [int] IDENTITY(1,101) NOT NULL,
	[dateOfCreation] [date] NOT NULL,
	[equipment] [int] NOT NULL,
	[typeOfFault] [int] NOT NULL,
	[client] [int] NOT NULL,
	[description] [nvarchar](250) NULL,
	[status] [int] NOT NULL,
	[master] [int] NOT NULL,
	[timeOfWork] [int] NOT NULL,
	[priority] [int] NOT NULL,
	[step] [int] NOT NULL,
	[comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 23.09.2024 12:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT dbo.Request.id, dbo.Request.dateOfCreation, dbo.Equipment.name AS equipment, dbo.TypeOfFault.name AS type, Client.FIO AS client, dbo.Request.description, dbo.Status.name AS status, Master.FIO AS master, 
                  dbo.Request.timeOfWork, dbo.Priority.name AS priority, dbo.Step.name AS step, dbo.Request.comment
FROM     dbo.Equipment INNER JOIN
                  dbo.Request ON dbo.Equipment.id = dbo.Request.equipment INNER JOIN
                  dbo.Priority ON dbo.Request.priority = dbo.Priority.id INNER JOIN
                  dbo.Status ON dbo.Request.status = dbo.Status.id INNER JOIN
                  dbo.Step ON dbo.Request.step = dbo.Step.id INNER JOIN
                  dbo.TypeOfFault ON dbo.Request.typeOfFault = dbo.TypeOfFault.id INNER JOIN
                  dbo.Users AS Client ON dbo.Request.client = Client.id INNER JOIN
                  dbo.Users AS Master ON dbo.Request.master = Master.id
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 23.09.2024 12:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([id], [name]) VALUES (1, N'Токарный станок АП567')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (2, N'Фрезерный станок 12')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (3, N'Расточный станок ТИ90')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (4, N'Расточный станок ОР99')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (5, N'Расточный станок 55')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (6, N'Токарный станок ОР788')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (7, N'Сверлильный станок ВТ567')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (8, N'Лазерный станок для резки металла')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (9, N'Гибочный станок ВА34')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (10, N'Фрезерный станок 124')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (11, N'Фрезерный станок 45')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (12, N'Фрезерный станок ВА44')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (13, N'Фрезерный станок 766')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (14, N'Шлифовальный станок')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (15, N'Шлифовальный станок 66')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (16, N'Гибочный станок СМ44')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (17, N'Расточный станок СМИ56')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (18, N'Гибочный станок ВА35')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (19, N'Токарный станок ЛОР')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (20, N'Токарный станок')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (21, N'Плазменный станок ПС567')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (22, N'Шлифовальный станок РП77')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (23, N'Фрезерный станок 77')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (24, N'Токарный станок ФЫ567')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (25, N'Лазерный станок для резки металла ПА56')
INSERT [dbo].[Equipment] ([id], [name]) VALUES (26, N'Фрезерный станок РП77')
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Priority] ON 

INSERT [dbo].[Priority] ([id], [name]) VALUES (1, N'Низкий    ')
INSERT [dbo].[Priority] ([id], [name]) VALUES (2, N'Высокий   ')
INSERT [dbo].[Priority] ([id], [name]) VALUES (3, N'Средний   ')
SET IDENTITY_INSERT [dbo].[Priority] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (1, CAST(N'2023-03-12' AS Date), 1, 1, 125, N'Износ элементов конструкции', 1, 105, 0, 1, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (2, CAST(N'2023-03-13' AS Date), 2, 5, 126, N'Нарушение в электрических цепях', 2, 110, 0, 1, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (3, CAST(N'2023-03-14' AS Date), 3, 3, 127, N'Износ деталей', 3, 105, 120, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (4, CAST(N'2023-03-15' AS Date), 4, 4, 128, N'Ошибки в работе управляещего ПО', 3, 105, 600, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (5, CAST(N'2023-03-16' AS Date), 5, 1, 129, N'Внешние признаки неработоспособности', 3, 119, 320, 1, 1, N'Ремонт полность выполнен без дополниетльных запчастей')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (6, CAST(N'2023-03-17' AS Date), 5, 1, 131, N'Появление дыма при работе', 1, 106, 0, 2, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (7, CAST(N'2023-03-18' AS Date), 6, 1, 131, N'Поломка механических деталей конструкции', 3, 137, 240, 2, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (8, CAST(N'2023-03-19' AS Date), 7, 1, 101, N'Посторонние шумы', 3, 105, 360, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (9, CAST(N'2023-03-20' AS Date), 8, 5, 101, N'Нарушения в электрических компонентах', 3, 137, 720, 1, 3, N'Отсутствуют необходимые инностранные запчасти')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (10, CAST(N'2023-03-21' AS Date), 9, 3, 102, N'Ошибки монтажа', 3, 146, 120, 3, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (11, CAST(N'2023-03-22' AS Date), 10, 1, 102, N'Попадание грязи и влаги', 3, 119, 600, 2, 1, N'Потребовались дополнительные запчасти')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (12, CAST(N'2023-03-23' AS Date), 11, 5, 102, N'Нарушения в электрических соединениях', 2, 115, 0, 1, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (13, CAST(N'2023-03-24' AS Date), 9, 5, 107, N'Нарушения в электрических соединениях', 3, 119, 600, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (14, CAST(N'2023-03-25' AS Date), 8, 4, 107, N'Ошибки в работе прошивок', 3, 106, 320, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (15, CAST(N'2023-03-26' AS Date), 12, 4, 131, N'Ошибки в работе управляещего ПО', 3, 106, 480, 2, 3, N'Отсутствуют необходимые инностранные запчасти')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (16, CAST(N'2023-03-27' AS Date), 13, 1, 107, N'Попадание грязи и влаги', 1, 137, 0, 1, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (17, CAST(N'2023-03-28' AS Date), 9, 1, 116, N'Износ элементов конструкции', 2, 110, 0, 3, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (18, CAST(N'2023-03-29' AS Date), 14, 1, 101, N'Износ элементов конструкции', 2, 110, 0, 3, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (19, CAST(N'2023-03-30' AS Date), 5, 3, 117, N'Износ деталей', 1, 146, 0, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (20, CAST(N'2023-03-31' AS Date), 15, 1, 116, N'Поломка механических деталей конструкции', 1, 137, 0, 1, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (21, CAST(N'2023-04-01' AS Date), 16, 3, 134, N'Ошибки монтажа', 3, 106, 120, 1, 1, N'Ремонт полность выполнен без дополниетльных запчастей')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (22, CAST(N'2023-04-02' AS Date), 17, 3, 118, N'Воздействие вредных факторов среды', 3, 137, 600, 2, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (23, CAST(N'2023-04-03' AS Date), 18, 5, 111, N'Нарушения в электрических компонентах', 3, 137, 320, 1, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (24, CAST(N'2023-04-04' AS Date), 18, 1, 145, N'Ошибки проектирования', 3, 105, 480, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (25, CAST(N'2023-04-05' AS Date), 19, 1, 116, N'Внешние признаки неработоспособности', 2, 137, 0, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (26, CAST(N'2023-04-06' AS Date), 5, 1, 145, N'Воздействие вредных факторов среды', 2, 146, 0, 3, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (27, CAST(N'2023-04-07' AS Date), 16, 5, 150, N'Нарушение в электрических цепях', 3, 105, 720, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (28, CAST(N'2023-04-08' AS Date), 18, 1, 134, N'Появление дыма при работе', 3, 105, 120, 3, 3, N'Отсутствуют необходимые инностранные запчасти')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (29, CAST(N'2023-04-09' AS Date), 15, 1, 116, N'Поломка механических деталей конструкции', 3, 146, 600, 2, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (30, CAST(N'2023-04-10' AS Date), 20, 1, 117, N'Поломка механических деталей конструкции', 2, 105, 0, 3, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (31, CAST(N'2023-04-11' AS Date), 21, 1, 117, N'Загрязнение деталей', 3, 119, 600, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (32, CAST(N'2023-04-12' AS Date), 18, 4, 111, N'Ошибки в работе управляещего ПО', 1, 115, 0, 3, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (33, CAST(N'2023-04-13' AS Date), 22, 4, 134, N'Ошибки в работе прошивок', 3, 115, 480, 2, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (34, CAST(N'2023-04-14' AS Date), 7, 1, 117, N'Загрязнение деталей', 1, 137, 0, 3, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (35, CAST(N'2023-04-15' AS Date), 18, 1, 117, N'Загрязнение деталей', 2, 106, 0, 3, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (36, CAST(N'2023-04-02' AS Date), 23, 5, 145, N'Нарушение в электрических цепях', 2, 137, 0, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (37, CAST(N'2023-04-03' AS Date), 18, 5, 118, N'Нарушение в электрических цепях', 2, 110, 0, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (38, CAST(N'2023-04-04' AS Date), 21, 1, 134, N'Износ элементов конструкции', 3, 137, 600, 2, 3, N'Отсутствуют необходимые инностранные запчасти')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (39, CAST(N'2023-04-05' AS Date), 15, 1, 145, N'Износ элементов конструкции', 2, 137, 0, 1, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (40, CAST(N'2023-04-06' AS Date), 15, 1, 118, N'Посторонние шумы', 1, 105, 0, 2, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (41, CAST(N'2023-04-07' AS Date), 24, 1, 145, N'Появление дыма при работе', 3, 146, 320, 1, 3, N'Отсутствуют необходимые инностранные запчасти')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (42, CAST(N'2023-04-08' AS Date), 21, 3, 145, N'Износ деталей', 2, 115, 0, 1, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (43, CAST(N'2023-04-09' AS Date), 16, 5, 117, N'Нарушения в электрических соединениях', 3, 105, 1260, 1, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (44, CAST(N'2023-04-01' AS Date), 5, 1, 145, N'Поломка механических деталей конструкции', 2, 105, 0, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (45, CAST(N'2023-04-02' AS Date), 16, 1, 117, N'Загрязнение деталей', 3, 137, 720, 1, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (46, CAST(N'2023-04-03' AS Date), 25, 5, 145, N'Нарушения в электрических компонентах', 3, 110, 480, 2, 2, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (47, CAST(N'2023-04-04' AS Date), 21, 5, 111, N'Нарушение в электрических цепях', 3, 106, 320, 3, 1, N'Потребовались дополнительные запчасти')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (48, CAST(N'2023-04-05' AS Date), 26, 1, 134, N'Загрязнение деталей', 1, 137, 0, 2, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (49, CAST(N'2023-04-06' AS Date), 25, 4, 145, N'Ошибки в работе управляещего ПО', 3, 115, 240, 3, 1, N'')
INSERT [dbo].[Request] ([id], [dateOfCreation], [equipment], [typeOfFault], [client], [description], [status], [master], [timeOfWork], [priority], [step], [comment]) VALUES (50, CAST(N'2023-04-07' AS Date), 5, 1, 118, N'Посторонние шумы', 3, 105, 360, 2, 1, N'')
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [name]) VALUES (1, N'Заказчик  ')
INSERT [dbo].[Roles] ([id], [name]) VALUES (2, N'Мастер    ')
INSERT [dbo].[Roles] ([id], [name]) VALUES (3, N'Оператор  ')
INSERT [dbo].[Roles] ([id], [name]) VALUES (4, N'Менеджер  ')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id], [name]) VALUES (1, N'В ожидании')
INSERT [dbo].[Status] ([id], [name]) VALUES (2, N'В работе  ')
INSERT [dbo].[Status] ([id], [name]) VALUES (3, N'Выполнено ')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Step] ON 

INSERT [dbo].[Step] ([id], [name]) VALUES (1, N'Выполнено   ')
INSERT [dbo].[Step] ([id], [name]) VALUES (2, N'В работе    ')
INSERT [dbo].[Step] ([id], [name]) VALUES (3, N'Не выполнено')
SET IDENTITY_INSERT [dbo].[Step] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfFault] ON 

INSERT [dbo].[TypeOfFault] ([id], [name]) VALUES (1, N'Механическая')
INSERT [dbo].[TypeOfFault] ([id], [name]) VALUES (2, N'Электрическая')
INSERT [dbo].[TypeOfFault] ([id], [name]) VALUES (3, N'Ошибки эксплуатации')
INSERT [dbo].[TypeOfFault] ([id], [name]) VALUES (4, N'Программная')
INSERT [dbo].[TypeOfFault] ([id], [name]) VALUES (5, N'Ненадлежащее обслуживание')
SET IDENTITY_INSERT [dbo].[TypeOfFault] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (101, N'Ефремов Сергей Пантелеймонович', N'loginDEppn2018', N'6}i+FD', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (102, N'Родионова Тамара Валентиновна', N'loginDElqb2018', N'RNynil', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (103, N'Миронова Галина Улебовна', N'loginDEydn2018', N'34I}X9', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (104, N'Сидоров Роман Иринеевич', N'loginDEijg2018', N'4QlKJW', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (105, N'Ситников Парфений Всеволодович', N'loginDEdpy2018', N'MJ0W|f', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (106, N'Никонов Роман Геласьевич', N'loginDEwdm2018', N'&PynqU', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (107, N'Щербаков Владимир Матвеевич', N'loginDEdup2018', N'JM+2{s', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (108, N'Кулаков Мартын Михаилович', N'loginDEhbm2018', N'9aObu4', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (109, N'Сазонова Оксана Лаврентьевна', N'loginDExvq2018', N'hX0wJz', 3)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (110, N'Архипов Варлам Мэлорович', N'loginDErks2018', N'LQNSjo', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (111, N'Устинова Ираида Мэлоровна', N'loginDErvb2018', N'ceAf&R', 3)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (112, N'Лукин Георгий Альбертович', N'loginDEulo2018', N'fg56DRgh', 3)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (113, N'Кононов Эдуард Валентинович', N'loginDEgfw2018', N'3c2Ic1', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (114, N'Орехова Клавдия Альбертовна', N'loginDEmxb2018', N'ZPXcRS', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (115, N'Яковлев Яков Эдуардович', N'loginDEgeq2018', N'&&Eim0', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (116, N'Воронов Мэлс Семёнович', N'loginDEkhj2018', N'Pbc0t{', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (117, N'Вишнякова Ия Данииловна', N'loginDEliu2018', N'32FyTl', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (118, N'Третьяков Фёдор Вадимович', N'loginDEsmf2018', N'{{O2QG', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (119, N'Макаров Максим Ильяович', N'loginDEutd2018', N'GbcJvC', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (120, N'Шубина Маргарита Анатольевна', N'loginDEpgh2018', N'YV2lvh', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (121, N'Блинова Ангелина Владленовна', N'loginDEvop2018', N'pBP8rO', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (122, N'Воробьёв Владлен Фролович', N'loginDEwjo2018', N'EQaD|d', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (123, N'Сорокина Прасковья Фёдоровна', N'loginDEbur2018', N'aZKGeI', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (124, N'Давыдов Яков Антонович', N'loginDEszw2018', N'EGU{YE', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (125, N'Рыбакова Евдокия Анатольевна', N'loginDExsu2018', N'*2RMsp', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (126, N'Маслов Геннадий Фролович', N'loginDEztn2018', N'nJBZpU', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (127, N'Цветкова Элеонора Аристарховна', N'loginDEtmn2018', N'UObB}N', 4)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (128, N'Евдокимов Ростислав Александрович', N'loginDEhep2018', N'SwRicr', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (129, N'Никонова Венера Станиславовна', N'loginDEevr2018', N'zO5l}l', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (130, N'Громов Егор Антонович', N'loginDEnpa2018', N'M*QLjf', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (131, N'Суворова Валерия Борисовна', N'loginDEgyt2018', N'Pav+GP', 3)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (132, N'Мишина Елизавета Романовна', N'loginDEbrr2018', N'Z7L|+i', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (133, N'Зимина Ольга Аркадьевна', N'loginDEyoo2018', N'UG1BjP', 3)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (134, N'Игнатьев Игнатий Антонинович', N'loginDEaob2018', N'3fy+3I', 3)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (135, N'Пахомова Зинаида Витальевна', N'loginDEwtz2018', N'&GxSST', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (136, N'Устинов Владимир Федосеевич', N'loginDEctf2018', N'sjt*3N', 3)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (137, N'Кулаков Мэлор Вячеславович', N'loginDEipm2018', N'MAZl6|', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (138, N'Сазонов Авксентий Брониславович', N'loginDEjoi2018', N'o}C4jv', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (139, N'Бурова Наина Брониславовна', N'loginDEwap2018', N'4hny7k', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (140, N'Фадеев Демьян Федосеевич', N'loginDEaxm2018', N'BEc3xq', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (141, N'Бобылёва Дарья Якуновна', N'loginDEsmq2018', N'ATVmM7', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (142, N'Виноградов Созон Арсеньевич', N'loginDEeur2018', N'n4V{wP', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (143, N'Гордеев Владлен Ефимович', N'loginDEvke2018', N'WQLXSl', 4)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (144, N'Иванова Зинаида Валерьевна', N'loginDEvod2018', N'0EW93v', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (145, N'Гусев Руслан Дамирович', N'loginDEjaw2018', N'h6z&Ky', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (146, N'Маслов Дмитрий Иванович', N'loginDEpdp2018', N'8NvRfC', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (147, N'Антонова Ульяна Семёновна', N'loginDEjpp2018', N'oMOQq3', 1)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (148, N'Орехова Людмила Владимировна', N'loginDEkiy2018', N'BQzsts', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (149, N'Авдеева Жанна Куприяновна', N'loginDEhmn2018', N'a|Iz|7', 2)
INSERT [dbo].[Users] ([id], [FIO], [login], [password], [role]) VALUES (150, N'Кузнецов Фрол Варламович', N'loginDEfmn2018', N'cw3|03', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Equipment] FOREIGN KEY([equipment])
REFERENCES [dbo].[Equipment] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Equipment]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Priority] FOREIGN KEY([priority])
REFERENCES [dbo].[Priority] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Priority]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Status] FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Status]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Step] FOREIGN KEY([step])
REFERENCES [dbo].[Step] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Step]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_TypeOfFault] FOREIGN KEY([typeOfFault])
REFERENCES [dbo].[TypeOfFault] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_TypeOfFault]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Users] FOREIGN KEY([client])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Users]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Users1] FOREIGN KEY([master])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[GetRequestMasterName]    Script Date: 23.09.2024 12:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRequestMasterName]
	@MasterName NVARCHAR(150)=NULL
AS
BEGIN

	SELECT *
	FROM Request INNER JOIN
	Users ON Request.master = Users.id
	WHERE Users.FIO = @MasterName and Request.status=3
END
GO
/****** Object:  StoredProcedure [dbo].[GetRequestMasterShortName]    Script Date: 23.09.2024 12:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRequestMasterShortName]
	@MasterName NVARCHAR(150)=NULL
AS
BEGIN

	SELECT *
	FROM Request INNER JOIN
	Users ON Request.master = Users.id
	WHERE Users.FIO Like ('%' + @MasterName + '%')
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[28] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Equipment"
            Begin Extent = 
               Top = 0
               Left = 53
               Bottom = 119
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Request"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 356
               Right = 729
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Status"
            Begin Extent = 
               Top = 7
               Left = 1019
               Bottom = 126
               Right = 1213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Step"
            Begin Extent = 
               Top = 7
               Left = 1261
               Bottom = 126
               Right = 1455
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TypeOfFault"
            Begin Extent = 
               Top = 148
               Left = 11
               Bottom = 267
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Client"
            Begin Extent = 
               Top = 173
               Left = 891
               Bottom = 401
               Right = 1085
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Master"
            Begin Extent = 
               Top = 7
               Left = 777
               Bottom = 170
               Right = 971
            End
            DisplayFlags = 280
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
            TopColumn = 0
         End
         Begin Table = "Priority"
            Begin Extent = 
               Top = 237
               Left = 225
               Bottom = 356
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1320
         Width = 2808
         Width = 2676
         Width = 1140
         Width = 2808
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
