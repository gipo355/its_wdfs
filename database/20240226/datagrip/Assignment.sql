/*
gestione biblioteca
negozio solo punto vendita, futuro possibilmente piu
pensa funzionalit future e scalability
presta libri a magazzino
tenere traccia entrate uscite

struttura dati

Tabella Libri
id libro
titolo
anno
isbn
fk lingua
fk genere
fk editore
tot copie

Tabella Autori
id autore
nome
cognome

tabella di join
Tabella Libri_Autori
id libro fk
id autore fk
1+2 pk

Tabella Lingue
id
desc

Tabella Genere
id
desc

Tabella Editore
id
desc

----- Utenti
Tabella Utenti
id
nome
cognome
indirizzo
telefono
email

Tabella Prestiti
id
fk utente
fk libro
data prestito
data restituzione
durata

non metto info che posso ricreare

*/


