# assignment

<!--toc:start-->

- [assignment](#assignment)
  - [description](#description)
  - [example](#example)
  - [todo](#todo)
  - [how to deliver](#how-to-deliver)
  <!--toc:end-->

## description

Un’azienda di servizi di trasporto organizza viaggi di turismo fornendo il mezzo
di trasporto comprensivo di autista. Disegnare un DB che possa tenere traccia
dei viaggi pianificati, gestisca l’utilizzo dei mezzi e degli autisti impegnati.
Si consideri come esempio la seguente pianificazione di viaggi:

## example

| Destinazione | Partenza | Arrivo   | Mezzo                     | Autista          |
| ------------ | -------- | -------- | ------------------------- | ---------------- |
| Venezia      | 10/01/00 | 11/01/00 | Pulmino 9 posti           | Lorenzi Martino  |
| Parigi       | 10/01/20 | 15/01/20 | Mercedes Azzurro 54 posti | Rossi Andrea     |
| Roma         | 12/01/20 | 18/01/20 | Mercedes Giallo 54 posti  | DeMarchi Filippo |
| Padova       | 16/01/20 | 18/01/20 | Pulmino 9 posti           | Rossi Andrea     |
| Firenze      | 17/01/20 | 23/01/20 | Mercedes Azzurro 54 posti | Lorenzi Martino  |
| Amalfi       | 21/01/20 | 26/01/20 | Mercedes Giallo 54 posti  | Rossi Andrea     |
| Venezia      | 24/01/20 | 25/01/20 | Pulmino 9 posti           | DeMarchi Filippo |
| Madrid       | 26/01/20 | 30/01/20 | Mercedes Azzurro 54 posti | Lorenzi Martino  |
| Parigi       | 28/01/20 | 31/01/20 | Mercedes Giallo 54        |

## todo

Design the table

Determinare quanto segue:

1. Il numero di viaggi pianificati per ogni singolo autista
2. Il numero di viaggi e il totale di giorni di impegno per ogni mezzo
3. La percentuale di giorni di utilizzo di ogni pulman (su totale viaggi)
4. L’elenco dei viaggi più richiesti con la media di numero di giorni per
   viaggio
5. Determinare il periodo con maggior numero di viaggi pianificati
6. Creare una funzione che dato il periodo (Partenza/Arrivo) mi determini
   l’eventuale disponibilità di organizzare il viaggio ( Autista + Mezzo )

## how to deliver

ISTRUZIONI PER LA CONSEGNA:

1. Fornire script .SQL della creazione del DB con relativi dati a.
   ManagementStudio b. Dx Mouse su Database c. TASKS d. GENERATE SCRIPT e.
   Selezionare tutti gli oggetti f. Su ADVANCED -> Types of Data -> Schema and
   Data g. Selezionare “SAVE AS SCRIPT FILE”

2. Fornire file di testo .TXT o .SQL con le relative query
3. I file dovranno essere a. COGNOME_NOME_script.SQL ( o ZIP ) b.
   COGNOME_NOME_query.ZIP
