
-- SCRIPT PER CREAZIONE DATABASE e DATI

USE [master]
GO
/****** Object:  Database [dbBiblioteca2024]    Script Date: 04/03/2024 11:01:00 ******/
CREATE DATABASE [dbBiblioteca2024]
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'dbBiblioteca2024', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbBiblioteca2024.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
( NAME = N'dbBiblioteca2024_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbBiblioteca2024_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbBiblioteca2024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbBiblioteca2024] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET ANSI_NULLS OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET ANSI_PADDING OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET ARITHABORT OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [dbBiblioteca2024] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [dbBiblioteca2024] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET  DISABLE_BROKER
GO
ALTER DATABASE [dbBiblioteca2024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [dbBiblioteca2024] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET RECOVERY SIMPLE
GO
ALTER DATABASE [dbBiblioteca2024] SET  MULTI_USER
GO
ALTER DATABASE [dbBiblioteca2024] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [dbBiblioteca2024] SET DB_CHAINING OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [dbBiblioteca2024] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [dbBiblioteca2024] SET DELAYED_DURABILITY = DISABLED
GO
ALTER DATABASE [dbBiblioteca2024] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO
ALTER DATABASE [dbBiblioteca2024] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbBiblioteca2024] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbBiblioteca2024]
GO
/****** Object:  Table [dbo].[tblLingue]    Script Date: 04/03/2024 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLingue](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [Descrizione] [nchar](10) NULL,
 CONSTRAINT [PK_tblLingue] PRIMARY KEY CLUSTERED
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGeneri]    Script Date: 04/03/2024 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGeneri](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [Descrizione] [varchar](50) NULL,
 CONSTRAINT [PK_tblGeneri] PRIMARY KEY CLUSTERED
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCasaEditrice]    Script Date: 04/03/2024 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCasaEditrice](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [Descrizione] [varchar](50) NULL,
 CONSTRAINT [PK_tblCasaEditrice] PRIMARY KEY CLUSTERED
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLibri]    Script Date: 04/03/2024 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLibri](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [Titolo] [varchar](50) NULL,
    [AnnoEdizione] [int] NULL,
    [ISBN] [varchar](50) NULL,
    [idLingua] [int] NULL,
    [idGenere] [int] NULL,
    [idCasaEditrice] [int] NULL,
    [NrCopie] [int] NULL,
 CONSTRAINT [PK_tblLibri] PRIMARY KEY CLUSTERED
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewLibri]    Script Date: 04/03/2024 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewLibri] AS
SELECT LI.id,Titolo,AnnoEdizione,ISBN,
    idLingua,LN.Descrizione AS Lingua,
    idGenere,GE.Descrizione AS Genere,
    idCasaEditrice,CE.Descrizione AS CasaEditrice,
    NrCopie
    FROM tblLibri LI
    INNER JOIN tblLingue LN ON LI.idLingua=LN.id
    INNER JOIN tblCasaEditrice CE ON LI.idCasaEditrice=CE.id
    INNER JOIN tblGeneri GE ON LI.idGenere=GE.id
GO
/****** Object:  Table [dbo].[tblUtente]    Script Date: 04/03/2024 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUtente](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [Cognome] [varchar](50) NULL,
    [Nome] [varchar](50) NULL,
 CONSTRAINT [PK_tblUtente] PRIMARY KEY CLUSTERED
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMovimenti]    Script Date: 04/03/2024 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMovimenti](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [idUtente] [int] NULL,
    [idLibro] [int] NULL,
    [DataMovimento] [datetime] NULL,
    [Durata] [int] NULL,
    [DataRientro] [datetime] NULL,
 CONSTRAINT [PK_tblMovimenti] PRIMARY KEY CLUSTERED
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewMovimenti]    Script Date: 04/03/2024 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewMovimenti] AS
SELECT        MO.id AS idMovimento, MO.DataMovimento, MO.Durata, MO.DataRientro, UT.id AS idUtente, UT.Cognome, UT.Nome, VL.id AS idLibro, VL.Titolo, VL.AnnoEdizione, VL.ISBN, VL.idLingua, VL.Lingua, VL.idGenere, VL.Genere,
                         VL.idCasaEditrice, VL.CasaEditrice, VL.NrCopie
FROM            tblMovimenti AS MO INNER JOIN
                         tblUtente AS UT ON UT.id = MO.idUtente INNER JOIN
                         viewLibri AS VL ON VL.id = MO.idLibro
GO
/****** Object:  Table [dbo].[tblAutori]    Script Date: 04/03/2024 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAutori](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [Cognome] [varchar](50) NULL,
    [Nome] [varchar](50) NULL,
 CONSTRAINT [PK_tblAutori] PRIMARY KEY CLUSTERED
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAutoriLibri]    Script Date: 04/03/2024 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAutoriLibri](
    [idAutore] [int] NOT NULL,
    [idLibro] [int] NOT NULL
) ON [PRIMARY]
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
SET IDENTITY_INSERT [dbo].[tblMovimenti] ON
GO
INSERT [dbo].[tblMovimenti] ([id], [idUtente], [idLibro], [DataMovimento], [Durata], [DataRientro]) VALUES (1, 1, 2, CAST(N'2024-04-03T00:00:00.000' AS DateTime), 30, NULL)
GO
INSERT [dbo].[tblMovimenti] ([id], [idUtente], [idLibro], [DataMovimento], [Durata], [DataRientro]) VALUES (2, 2, 2, CAST(N'2024-03-04T00:00:00.000' AS DateTime), 20, NULL)
GO
INSERT [dbo].[tblMovimenti] ([id], [idUtente], [idLibro], [DataMovimento], [Durata], [DataRientro]) VALUES (3, 2, 2, CAST(N'2024-02-24T00:00:00.000' AS DateTime), 10, CAST(N'2024-03-02T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblMovimenti] OFF
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
ALTER TABLE [dbo].[tblAutoriLibri]  WITH CHECK ADD  CONSTRAINT [FK_tblAutoriLibri_tblAutori] FOREIGN KEY([idAutore])
REFERENCES [dbo].[tblAutori] ([id])
GO
ALTER TABLE [dbo].[tblAutoriLibri] CHECK CONSTRAINT [FK_tblAutoriLibri_tblAutori]
GO
ALTER TABLE [dbo].[tblAutoriLibri]  WITH CHECK ADD  CONSTRAINT [FK_tblAutoriLibri_tblLibri] FOREIGN KEY([idLibro])
REFERENCES [dbo].[tblLibri] ([id])
GO
ALTER TABLE [dbo].[tblAutoriLibri] CHECK CONSTRAINT [FK_tblAutoriLibri_tblLibri]
GO
ALTER TABLE [dbo].[tblLibri]  WITH CHECK ADD  CONSTRAINT [FK_tblLibri_tblCasaEditrice] FOREIGN KEY([idGenere])
REFERENCES [dbo].[tblCasaEditrice] ([id])
GO
ALTER TABLE [dbo].[tblLibri] CHECK CONSTRAINT [FK_tblLibri_tblCasaEditrice]
GO
ALTER TABLE [dbo].[tblLibri]  WITH CHECK ADD  CONSTRAINT [FK_tblLibri_tblGeneri] FOREIGN KEY([idGenere])
REFERENCES [dbo].[tblGeneri] ([id])
GO
ALTER TABLE [dbo].[tblLibri] CHECK CONSTRAINT [FK_tblLibri_tblGeneri]
GO
ALTER TABLE [dbo].[tblLibri]  WITH CHECK ADD  CONSTRAINT [FK_tblLibri_tblLingue] FOREIGN KEY([idLingua])
REFERENCES [dbo].[tblLingue] ([id])
GO
ALTER TABLE [dbo].[tblLibri] CHECK CONSTRAINT [FK_tblLibri_tblLingue]
GO
ALTER TABLE [dbo].[tblMovimenti]  WITH CHECK ADD  CONSTRAINT [FK_tblMovimenti_tblLibri] FOREIGN KEY([idLibro])
REFERENCES [dbo].[tblLibri] ([id])
GO
ALTER TABLE [dbo].[tblMovimenti] CHECK CONSTRAINT [FK_tblMovimenti_tblLibri]
GO
ALTER TABLE [dbo].[tblMovimenti]  WITH CHECK ADD  CONSTRAINT [FK_tblMovimenti_tblUtente] FOREIGN KEY([idUtente])
REFERENCES [dbo].[tblUtente] ([id])
GO
ALTER TABLE [dbo].[tblMovimenti] CHECK CONSTRAINT [FK_tblMovimenti_tblUtente]
GO
USE [master]
GO
ALTER DATABASE [dbBiblioteca2024] SET  READ_WRITE
GO
