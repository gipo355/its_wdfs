USE [dbBiblioteca2024]
GO
SET IDENTITY_INSERT [dbo].[tblLingue] ON
GO
INSERT [dbo].[tblLingue] ([id], [Descrizione]) VALUES (1, N'Italiano  ')
GO
INSERT [dbo].[tblLingue] ([id], [Descrizione]) VALUES (2, N'Inglese   ')
GO
INSERT [dbo].[tblLingue] ([id], [Descrizione]) VALUES (3, N'Francese  ')
GO
INSERT [dbo].[tblLingue] ([id], [Descrizione]) VALUES (4, N'Spagnolo  ')
GO
SET IDENTITY_INSERT [dbo].[tblLingue] OFF
GO
SET IDENTITY_INSERT [dbo].[tblGeneri] ON
GO
INSERT [dbo].[tblGeneri] ([id], [Descrizione]) VALUES (1, N'Narrativa')
GO
INSERT [dbo].[tblGeneri] ([id], [Descrizione]) VALUES (2, N'Storico')
GO
INSERT [dbo].[tblGeneri] ([id], [Descrizione]) VALUES (3, N'Giallo')
GO
INSERT [dbo].[tblGeneri] ([id], [Descrizione]) VALUES (4, N'Fantasy')
GO
SET IDENTITY_INSERT [dbo].[tblGeneri] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCasaEditrice] ON
GO
INSERT [dbo].[tblCasaEditrice] ([id], [Descrizione]) VALUES (1, N'DeAgostini')
GO
INSERT [dbo].[tblCasaEditrice] ([id], [Descrizione]) VALUES (2, N'HOEPLI    ')
GO
INSERT [dbo].[tblCasaEditrice] ([id], [Descrizione]) VALUES (3, N'Garzanti  ')
GO
INSERT [dbo].[tblCasaEditrice] ([id], [Descrizione]) VALUES (4, N'Feltrinelli')
GO
SET IDENTITY_INSERT [dbo].[tblCasaEditrice] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLibri] ON
GO
INSERT [dbo].[tblLibri] ([id], [Titolo], [AnnoEdizione], [ISBN], [idLingua], [idGenere], [idCasaEditrice], [NrCopie]) VALUES (1, N'Il nome della rosa', 2000, N'AAA123BBB', 1, 4, 2, 10)
GO
INSERT [dbo].[tblLibri] ([id], [Titolo], [AnnoEdizione], [ISBN], [idLingua], [idGenere], [idCasaEditrice], [NrCopie]) VALUES (2, N'La Divina Commedia', 2010, N'BBB223CCC', 1, 1, 3, 5)
GO
INSERT [dbo].[tblLibri] ([id], [Titolo], [AnnoEdizione], [ISBN], [idLingua], [idGenere], [idCasaEditrice], [NrCopie]) VALUES (3, N'Il mio libro ', 2020, N'CCC3434CCC', 4, 2, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[tblLibri] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUtente] ON
GO
INSERT [dbo].[tblUtente] ([id], [Cognome], [Nome]) VALUES (1, N'Verdi', N'Luigi')
GO
INSERT [dbo].[tblUtente] ([id], [Cognome], [Nome]) VALUES (2, N'Bianchi', N'Stefania')
GO
INSERT [dbo].[tblUtente] ([id], [Cognome], [Nome]) VALUES (3, N'Gialli', N'Antonio')
GO
SET IDENTITY_INSERT [dbo].[tblUtente] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMovimenti] ON
GO
INSERT [dbo].[tblMovimenti] ([id], [idUtente], [idLibro], [DataMovimento], [Durata], [DataRientro]) VALUES (1, 1, 2, CAST(N'2024-04-03T00:00:00.000' AS DateTime), 30, NULL)
GO
INSERT [dbo].[tblMovimenti] ([id], [idUtente], [idLibro], [DataMovimento], [Durata], [DataRientro]) VALUES (2, 2, 2, CAST(N'2024-03-04T00:00:00.000' AS DateTime), 20, NULL)
GO
INSERT [dbo].[tblMovimenti] ([id], [idUtente], [idLibro], [DataMovimento], [Durata], [DataRientro]) VALUES (3, 2, 2, CAST(N'2024-02-24T00:00:00.000' AS DateTime), 10, CAST(N'2024-03-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblMovimenti] ([id], [idUtente], [idLibro], [DataMovimento], [Durata], [DataRientro]) VALUES (4, 1, 2, CAST(N'2024-01-03T00:00:00.000' AS DateTime), 10, CAST(N'2024-01-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblMovimenti] ([id], [idUtente], [idLibro], [DataMovimento], [Durata], [DataRientro]) VALUES (5, 3, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime), 20, NULL)
GO
INSERT [dbo].[tblMovimenti] ([id], [idUtente], [idLibro], [DataMovimento], [Durata], [DataRientro]) VALUES (6, 3, 2, CAST(N'2024-02-02T00:00:00.000' AS DateTime), 25, CAST(N'2024-03-02T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblMovimenti] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAutori] ON
GO
INSERT [dbo].[tblAutori] ([id], [Cognome], [Nome]) VALUES (1, N'Alighieri', N'Dante')
GO
INSERT [dbo].[tblAutori] ([id], [Cognome], [Nome]) VALUES (2, N'Brown', N'Dan')
GO
INSERT [dbo].[tblAutori] ([id], [Cognome], [Nome]) VALUES (3, N'Rossi', N'Mario')
GO
INSERT [dbo].[tblAutori] ([id], [Cognome], [Nome]) VALUES (4, N'Eco', N'Umberto')
GO
SET IDENTITY_INSERT [dbo].[tblAutori] OFF
GO
INSERT [dbo].[tblAutoriLibri] ([idAutore], [idLibro]) VALUES (4, 1)
GO
INSERT [dbo].[tblAutoriLibri] ([idAutore], [idLibro]) VALUES (1, 2)
GO
INSERT [dbo].[tblAutoriLibri] ([idAutore], [idLibro]) VALUES (3, 3)
GO
INSERT [dbo].[tblAutoriLibri] ([idAutore], [idLibro]) VALUES (1, 3)
GO
