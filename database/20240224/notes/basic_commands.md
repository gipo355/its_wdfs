<https://stackoverflow.com/questions/40731995/how-to-auto-generate-uniqueidentifier-on-insert-query-in-sql-server>

```SQL
CREATE TABLE AUDITS
(
Audit_ID uniqueidentifier not null DEFAULT newid(),
LocationID char(10) FOREIGN KEY REFERENCES LOCATIONS (LocationID) not null,
DateChangement date not null,
NomColonneChangé varchar (20) not null,
AncienneValeur  varchar (20)  not null,
NouvelleValeur  varchar (20) not null,
constraint pk_AUDIT primary key(Audit_ID)
)
```

<https://www.mssqltips.com/sqlservertip/1600/auto-generated-sql-server-keys-with-the-uniqueidentifier-or-identity/>

<https://learn.microsoft.com/en-us/sql/relational-databases/databases/create-a-database?view=sql-server-ver16>

<https://learn.microsoft.com/en-us/sql/relational-databases/databases/create-a-database?view=sql-server-ver16>

<https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16>

<https://www.mssqltips.com/sqlservertip/4924/execute-sql-server-script-files-with-the-sqlcmd-utility/>
