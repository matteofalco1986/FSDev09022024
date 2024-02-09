-- EX 1
-- SELECT COUNT(*)
-- FROM Verbale
-- WHERE DataTrascrizioneVerbale IS NOT NULL

-- EX 2
-- SELECT idPersonaMultata, Cognome, Anagrafica.Nome, Anagrafica.Cod_Fisc, Anagrafica.Indirizzo, Anagrafica.Citta, Anagrafica.CAP, COUNT(*) as VerbaliTrascritti
-- FROM Verbale as Verbale
-- JOIN Anagrafica AS Anagrafica ON
-- Verbale.idPersonaMultata = Anagrafica.idAnagrafica
-- WHERE DataTrascrizioneVerbale IS NOT NULL
-- GROUP BY idPersonaMultata, Anagrafica.Cognome, Anagrafica.Nome, Anagrafica.Cod_Fisc, Anagrafica.Indirizzo, Anagrafica.Citta, Anagrafica.CAP

-- EX 3
-- SELECT TipoViolazione.Descrizione, COUNT(*) AS VerbaliTrascritti
-- FROM Verbale AS Verbale
-- JOIN TipoViolazione AS TipoViolazione ON
-- Verbale.idViolazione = TipoViolazione.idViolazione
-- WHERE DataTrascrizioneVerbale IS NOT NULL
-- GROUP BY TipoViolazione.Descrizione

-- EX 4
-- SELECT idPersonaMultata, Anagrafica.Cognome, Anagrafica.Nome, Anagrafica.Cod_Fisc, Anagrafica.Indirizzo, Anagrafica.Citta, Anagrafica.CAP, sum(DecurtamentoPunti) as TotalePuntiDecurtati
-- FROM Verbale AS Verbale
-- JOIN Anagrafica AS Anagrafica ON
-- Verbale.idPersonaMultata = Anagrafica.idAnagrafica
-- GROUP BY idPersonaMultata, Anagrafica.Cognome, Anagrafica.Nome, Anagrafica.Cod_Fisc, Anagrafica.Indirizzo, Anagrafica.Citta, Anagrafica.CAP

-- EX 5
-- SELECT Anagrafica.Cognome, Anagrafica.Nome, DataViolazione, IndirizzoViolazione, Importo, DecurtamentoPunti
-- FROM Verbale as Verbale
-- JOIN Anagrafica as Anagrafica ON
-- Verbale.idPersonaMultata = Anagrafica.idAnagrafica
-- WHERE Anagrafica.Citta = 'Palermo'

-- EX 6
-- SELECT Anagrafica.Cognome, Anagrafica.Nome, Anagrafica.Indirizzo, DataViolazione, Importo, DecurtamentoPunti
-- FROM Verbale as Verbale
-- JOIN Anagrafica as Anagrafica ON
-- Verbale.idPersonaMultata = Anagrafica.idAnagrafica
-- WHERE DataViolazione BETWEEN '2009-02-01' AND '2009-07-31'

-- EX 7
-- SELECT idPersonaMultata, Anagrafica.Cognome, Anagrafica.Nome, Anagrafica.Cod_Fisc, Anagrafica.Indirizzo, Anagrafica.Citta, Anagrafica.CAP, sum(importo) as TotaleImporto
-- FROM Verbale as Verbale
-- JOIN Anagrafica AS Anagrafica ON
-- Verbale.idPersonaMultata = Anagrafica.idAnagrafica
-- GROUP BY idPersonaMultata, Anagrafica.Cognome, Anagrafica.Nome, Anagrafica.Cod_Fisc, Anagrafica.Indirizzo, Anagrafica.Citta, Anagrafica.CAP

-- EX 8
-- SELECT *
-- FROM Anagrafica
-- WHERE Citta = 'Palermo'

-- EX 9
-- DECLARE @Date DATE = '2023-12-27'
-- SELECT DataViolazione, Importo, DecurtamentoPunti 
-- FROM Verbale
-- WHERE DataViolazione = @Date

-- EX 10
-- SELECT Nominativo_Agente, COUNT(*) as ViolazioniContestate
-- FROM Verbale
-- GROUP BY Nominativo_Agente

-- EX 11
-- SELECT Anagrafica.Cognome,  Anagrafica.Nome, Anagrafica.Indirizzo, DataViolazione, Importo, DecurtamentoPunti
-- FROM Verbale AS Verbale
-- JOIN Anagrafica AS Anagrafica ON
-- Verbale.idPersonaMultata = Anagrafica.idAnagrafica
-- WHERE DecurtamentoPunti > 5

-- EX 12
-- SELECT Anagrafica.Cognome, Anagrafica.Nome, Anagrafica.Indirizzo, DataViolazione, Importo, DecurtamentoPunti
-- FROM Verbale AS Verbale
-- JOIN Anagrafica AS Anagrafica ON
-- Verbale.idPersonaMultata = Anagrafica.idAnagrafica
-- WHERE Importo > 400