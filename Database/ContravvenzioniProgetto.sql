USE [master]
GO
/****** Object:  Database [ContravvenzioniProgetto]    Script Date: 09/02/2024 15:03:27 ******/
CREATE DATABASE [ContravvenzioniProgetto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContravvenzioniProgetto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ContravvenzioniProgetto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ContravvenzioniProgetto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ContravvenzioniProgetto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ContravvenzioniProgetto] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContravvenzioniProgetto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContravvenzioniProgetto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET  MULTI_USER 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContravvenzioniProgetto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ContravvenzioniProgetto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ContravvenzioniProgetto] SET QUERY_STORE = ON
GO
ALTER DATABASE [ContravvenzioniProgetto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ContravvenzioniProgetto]
GO
/****** Object:  Table [dbo].[Anagrafica]    Script Date: 09/02/2024 15:03:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anagrafica](
	[idAnagrafica] [int] IDENTITY(1,1) NOT NULL,
	[Cognome] [nvarchar](20) NULL,
	[Nome] [nvarchar](20) NULL,
	[Indirizzo] [nvarchar](max) NULL,
	[Citta] [nvarchar](max) NULL,
	[CAP] [nvarchar](5) NULL,
	[Cod_Fisc] [nvarchar](16) NULL,
 CONSTRAINT [PK_Anagrafica] PRIMARY KEY CLUSTERED 
(
	[idAnagrafica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoViolazione]    Script Date: 09/02/2024 15:03:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoViolazione](
	[idViolazione] [int] IDENTITY(1,1) NOT NULL,
	[Descrizione] [nvarchar](max) NULL,
 CONSTRAINT [PK_TipoViolazione] PRIMARY KEY CLUSTERED 
(
	[idViolazione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Verbale]    Script Date: 09/02/2024 15:03:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Verbale](
	[idVerbale] [int] IDENTITY(1,1) NOT NULL,
	[idViolazione] [int] NOT NULL,
	[idPersonaMultata] [int] NOT NULL,
	[DataViolazione] [date] NULL,
	[IndirizzoViolazione] [nvarchar](255) NULL,
	[Nominativo_Agente] [nvarchar](50) NULL,
	[DataTrascrizioneVerbale] [date] NULL,
	[Importo] [money] NULL,
	[DecurtamentoPunti] [int] NULL,
 CONSTRAINT [PK_Verbale] PRIMARY KEY CLUSTERED 
(
	[idVerbale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Anagrafica] ON 

INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (1, N'Dallara', N'Costantino', N'Strada Monicelli 573', N'Melissa veneto', N'61673', N'ESENRJ9243R11PDR')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (2, N'Iannelli', N'Nicola', N'Incrocio Valentina 21 Appartamento 87', N'Borgo Dante lido', N'09348', N'YEVUZC4096D95P4L')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (3, N'Delle', N'Ansaldo', N'Vicolo Umberto 873 Appartamento 00', N'Quarto Gloria', N'78699', N'VVZXEG8997A32U75')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (4, N'Lupo', N'Vanessa', N'Incrocio Falier 699 Appartamento 76', N'Quarto Enrico', N'11087', N'GCMGQY9494C04VBC')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (5, N'Gritti', N'Antonia', N'Via Gradenigo 029 Piano 0', N'Lattuada del friuli', N'03185', N'GRBZPM1993E12PS5')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (6, N'Nicolini', N'Laura', N'Contrada Panatta 187 Piano 7', N'Palermo', N'88111', N'YDFHTE2169B59ALN')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (7, N'Treves', N'Gian', N'Contrada Modigliani 12 Piano 8', N'Settimo terme', N'39253', N'OBPFHG9475P924FE')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (8, N'Toscani', N'Roberta', N'Via Lopresti 1 Piano 1', N'Palermo', N'64723', N'WKNVUK8564S45EZ1')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (9, N'Ubaldi', N'Ezio', N'Strada Gioffre 3 Appartamento 04', N'San Costantino veneto', N'42982', N'HOXBOR6121T11UMI')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (10, N'Leone', N'Cirillo', N'Canale Rosaria 61', N'Palermo', N'80356', N'WOFPUL6155E73HFL')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (11, N'Capone', N'Loredana', N'Incrocio Iannuzzi 66 Appartamento 07', N'Trentin calabro', N'91525', N'GRYVNV5688A63VL3')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (12, N'Scarfoglio', N'Gioffre', N'Via Morrocco 472', N'Settimo Salvatore', N'22923', N'QYMXLJ0468E81P24')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (13, N'Broggini', N'Clelia', N'Stretto Panfilo 18 Piano 6', N'Foà del friuli', N'07402', N'OQRUPA5420C70D72')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (14, N'Antonetti', N'Ignazio', N'Viale Massimo 708 Piano 8', N'Sgalambro umbro', N'94822', N'KRMQMI7473D06UO4')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (15, N'Caccioppoli', N'Alina', N'Strada Mario 4', N'Sesto Fiorenzo lido', N'09050', N'IDMJAP7379A39CUN')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (16, N'Tarantino', N'Mario', N'Incrocio Cremonesi 540 Appartamento 58', N'Palermo', N'49835', N'HTKGPI6908T285HR')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (17, N'Grossi', N'Paola', N'Viale Mogherini 22', N'Quarto Michelangelo', N'38838', N'NEKFNW6229D555PK')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (18, N'Draghi', N'Marta', N'Piazza Damiano 944', N'Quarto Valeria laziale', N'55868', N'KRAXLM6423B87EAY')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (19, N'Rizzoli', N'Renzo', N'Via Alfredo 0', N'Verdi lido', N'31071', N'MMPFZA8753D18AMS')
INSERT [dbo].[Anagrafica] ([idAnagrafica], [Cognome], [Nome], [Indirizzo], [Citta], [CAP], [Cod_Fisc]) VALUES (20, N'Badoglio', N'Martina', N'Piazza Romagnoli 7', N'Settimo Paloma del friuli', N'93775', N'BIVTEM1924E60VBQ')
SET IDENTITY_INSERT [dbo].[Anagrafica] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoViolazione] ON 

INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (1, N'Eccesso di velocità rispetto ai limiti imposti')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (2, N'Guida in stato di ebbrezza o sotto l''effetto di sostanze stupefacenti')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (3, N'Uso del telefono cellulare senza dispositivi hands-free durante la guida')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (4, N'Mancato uso delle cinture di sicurezza da parte del conducente e dei passeggeri')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (5, N'Guida contromano o in direzione vietata')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (6, N'Mancata precedenza ai pedoni sulle strisce pedonali')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (7, N'Sosta o parcheggio in aree vietate o riservate ai disabili senza autorizzazione')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (8, N'Attraversamento con il semaforo rosso')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (9, N'Mancato rispetto dei segnali di stop o dare precedenza')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (10, N'Circolazione su corsie riservate (es. corsie bus, piste ciclabili) senza autorizzazione')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (11, N'Mancata revisione periodica del veicolo entro le scadenze previste')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (12, N'Guida senza patente o con patente non valida per la categoria di veicolo condotto')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (13, N'Omessa assicurazione del veicolo o circolazione con assicurazione scaduta')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (14, N'Modifiche non autorizzate al veicolo che ne alterano le caratteristiche omologate')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (15, N'Mancata segnalazione di incidente stradale alle autorità competenti quando richiesto')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (16, N'Abbandono di rifiuti dalla vettura sulla pubblica via')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (17, N'Trasporto di passeggeri o carichi in modo non sicuro o oltre i limiti consentiti')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (18, N'Uso di dispositivi di illuminazione non conformi o guasto ai sistemi di illuminazione e segnalazione')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (19, N'Non rispetto delle distanze di sicurezza tra veicoli')
INSERT [dbo].[TipoViolazione] ([idViolazione], [Descrizione]) VALUES (20, N'Emissione di rumori eccessivi o uso improprio del clacson in aree urbane')
SET IDENTITY_INSERT [dbo].[TipoViolazione] OFF
GO
SET IDENTITY_INSERT [dbo].[Verbale] ON 

INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (2, 16, 12, CAST(N'2023-12-27' AS Date), N'Rotonda Cardano 1 Appartamento 63, Mariana calabro, 09388 Livorno (CO)', N'Lilla Galiazzo', CAST(N'2024-02-16' AS Date), 92.4700, 5)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (3, 16, 4, CAST(N'2022-08-25' AS Date), N'Via Corrado 9 Appartamento 14, Lucia umbro, 15834 Latina (FR)', N'Barbara Broschi', CAST(N'2022-10-09' AS Date), 889.3500, 2)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (5, 7, 15, CAST(N'2023-11-12' AS Date), N'Rotonda Veltroni 611 Piano 4, Scalera ligure, 17310 L''Aquila (VS)', N'Emilio Pizzo', CAST(N'2023-11-18' AS Date), 327.2100, 5)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (6, 9, 13, CAST(N'2023-11-28' AS Date), N'Via Fiorucci 3, Tommaseo ligure, 39392 Frosinone (RI)', N'Romina Scalera', CAST(N'2023-12-15' AS Date), 1250.7500, 8)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (7, 7, 20, CAST(N'2009-02-10' AS Date), N'Rotonda Gibilisco 4 Piano 9, Settimo Ninetta, 41836 Viterbo (TE)', N'Lilla Galiazzo', CAST(N'2009-02-15' AS Date), 1050.2000, 7)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (8, 7, 20, CAST(N'2023-08-14' AS Date), N'Canale Donatello 602, Marcella umbro, 80925 Aosta (PN)', N'Romina Scalera', CAST(N'2023-08-17' AS Date), 2250.3200, 8)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (9, 1, 3, CAST(N'2023-08-05' AS Date), N'Incrocio Annunziata 29 Piano 7, Antonello laziale, 83397 Parma (VI)', N'Ramona Rienzo', CAST(N'2023-09-05' AS Date), 82.3700, 3)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (10, 2, 18, CAST(N'2023-08-29' AS Date), N'Stretto Conte 585 Piano 6, Trapani lido, 65212 Fermo (TS)', N'Ramona Rienzo', CAST(N'2023-08-30' AS Date), 162.7500, 1)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (11, 9, 3, CAST(N'2023-06-16' AS Date), N'Stretto Augusto 1 Appartamento 72, Pasolini nell''emilia, 75983 Palermo (AT)', N'Ramona Rienzo', CAST(N'2023-08-12' AS Date), 2700.2500, 7)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (12, 4, 4, CAST(N'2022-10-07' AS Date), N'Strada Bellocchio 793 Piano 1, Romano veneto, 11127 Reggio Emilia (VT)', N'Romina Scalera', CAST(N'2022-11-06' AS Date), 524.6500, 3)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (13, 16, 3, CAST(N'2023-03-19' AS Date), N'Viale Berenice 33, Borgo Gian, 84234 Chieti (AR)', N'Emilio Pizzo', CAST(N'2023-04-30' AS Date), 162.5200, 1)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (15, 20, 4, CAST(N'2009-07-20' AS Date), N'Vicolo Campano 7 Appartamento 90, Quarto Mirco calabro, 42080 Ancona (FG)', N'Emilio Pizzo', CAST(N'2009-08-04' AS Date), 200.3300, 2)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (16, 3, 17, CAST(N'2023-06-30' AS Date), N'Strada Roman 29 Piano 0, Alfieri ligure, 78111 Varese (BR)', N'Barbara Broschi', CAST(N'2023-07-31' AS Date), 757.3200, 6)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (17, 10, 18, CAST(N'2023-07-10' AS Date), N'Contrada Torricelli 77 Piano 7, San Gioachino sardo, 49823 Ravenna (PG)', N'Lilla Galiazzo', CAST(N'2023-09-04' AS Date), 520.3000, 4)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (19, 20, 16, CAST(N'2009-03-06' AS Date), N'Vicolo Barracco 052, Monteverdi ligure, 21212 Vibo Valentia (GR)', N'Romina Scalera', CAST(N'2009-04-05' AS Date), 6250.3200, 7)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (20, 2, 4, CAST(N'2023-04-20' AS Date), N'Canale Marina 7, Solari salentino, 88323 Arezzo (PN)', N'Romina Scalera', CAST(N'2023-05-07' AS Date), 207.6200, 4)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (21, 11, 1, CAST(N'2022-09-09' AS Date), N'Piazza Michele 7 Piano 5, Sesto Gianfrancesco, 67379 Como (PN)', N'Lilla Galiazzo', CAST(N'2022-10-16' AS Date), 307.3200, 5)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (22, 13, 19, CAST(N'2024-01-19' AS Date), N'Incrocio Garibaldi 65, Tozzi veneto, 30048 Lecco (VT)', N'Barbara Broschi', NULL, 456.5600, 4)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (23, 18, 12, CAST(N'2024-01-16' AS Date), N'Rotonda Nadia 11 Piano 6, Mirco lido, 72881 Catanzaro (TO)', N'Romina Scalera', NULL, 321.3200, 3)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (25, 8, 20, CAST(N'2023-12-29' AS Date), N'Stretto Ferrara 98, Toscanini veneto, 76728 Imperia (MI)', N'Ramona Rienzo', NULL, 32.2500, 0)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (26, 7, 7, CAST(N'2023-10-24' AS Date), N'Contrada Stucchi 52 Appartamento 99, Borgo Gianfrancesco terme, 58007 Napoli (BT)', N'Emilio Pizzo', CAST(N'2023-11-23' AS Date), 27.1500, 0)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (27, 16, 6, CAST(N'2023-12-14' AS Date), N'Stretto Paride 64 Appartamento 45, Gabriele nell''emilia, 16865 Salerno (MT)', N'Romina Scalera', NULL, 162.1400, 3)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (28, 14, 18, CAST(N'2024-01-09' AS Date), N'Canale Pedersoli 94 Piano 8, San Agnolo, 43146 Modena (CO)', N'Lilla Galiazzo', NULL, 102.2300, 1)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (29, 16, 6, CAST(N'2023-07-04' AS Date), N'Strada Leoncavallo 63, San Baldassare umbro, 30709 Ravenna (PR)', N'Emilio Pizzo', CAST(N'2023-10-12' AS Date), 272.5000, 3)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (30, 3, 4, CAST(N'2009-05-21' AS Date), N'Contrada Fedele 05 Appartamento 76, Settimo Stefani calabro, 68991 Avellino (LI)', N'Romina Scalera', CAST(N'2009-05-28' AS Date), 272.3200, 3)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (31, 6, 8, CAST(N'2023-12-22' AS Date), N'Vicolo Trombetta 7 Appartamento 74, Schiavone del friuli, 92921 Olbia-Tempio (BN)', N'Romina Scalera', NULL, 1520.7200, 8)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (32, 7, 13, CAST(N'2023-12-27' AS Date), N'Viale Pelli 4, Borgo Stefania veneto, 64711 Savona (BN)', N'Ramona Rienzo', CAST(N'2024-01-27' AS Date), 757.3200, 5)
INSERT [dbo].[Verbale] ([idVerbale], [idViolazione], [idPersonaMultata], [DataViolazione], [IndirizzoViolazione], [Nominativo_Agente], [DataTrascrizioneVerbale], [Importo], [DecurtamentoPunti]) VALUES (33, 11, 13, CAST(N'2023-08-04' AS Date), N'Incrocio Fortunata 3 Appartamento 31, Settimo Baldassare a mare, 31700 Brescia (SA)', N'Emilio Pizzo', CAST(N'2023-09-13' AS Date), 2157.6000, 9)
SET IDENTITY_INSERT [dbo].[Verbale] OFF
GO
ALTER TABLE [dbo].[Verbale]  WITH CHECK ADD  CONSTRAINT [FK_ID_Persona_Multata] FOREIGN KEY([idPersonaMultata])
REFERENCES [dbo].[Anagrafica] ([idAnagrafica])
GO
ALTER TABLE [dbo].[Verbale] CHECK CONSTRAINT [FK_ID_Persona_Multata]
GO
ALTER TABLE [dbo].[Verbale]  WITH CHECK ADD  CONSTRAINT [FK_IDViolazione] FOREIGN KEY([idViolazione])
REFERENCES [dbo].[TipoViolazione] ([idViolazione])
GO
ALTER TABLE [dbo].[Verbale] CHECK CONSTRAINT [FK_IDViolazione]
GO
/****** Object:  StoredProcedure [dbo].[DeleteVerbale]    Script Date: 09/02/2024 15:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteVerbale] @IdVerbale INT
AS
BEGIN
    DELETE FROM Verbale
    WHERE idVerbale = @IdVerbale
END
GO
/****** Object:  StoredProcedure [dbo].[DisplayByYear]    Script Date: 09/02/2024 15:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SELECT *
-- FROM Verbale

-- EX 1
CREATE PROCEDURE [dbo].[DisplayByYear] @Year NVARCHAR(4)
AS
BEGIN
    SELECT *
    FROM Verbale
    WHERE YEAR(DataViolazione) = @Year
    ORDER BY DataViolazione
END
GO
/****** Object:  StoredProcedure [dbo].[DisplayPuntiDecurtati]    Script Date: 09/02/2024 15:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SELECT *
-- FROM Verbale

-- EX 2
CREATE PROCEDURE [dbo].[DisplayPuntiDecurtati] @Date NVARCHAR(10)
AS
BEGIN
    SELECT DataViolazione, sum(DecurtamentoPunti) as TotalePuntiDecurtati
    FROM Verbale
    WHERE DataViolazione = @Date
    GROUP BY DataViolazione
END
GO
USE [master]
GO
ALTER DATABASE [ContravvenzioniProgetto] SET  READ_WRITE 
GO
