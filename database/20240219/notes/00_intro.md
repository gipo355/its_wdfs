# init

ASC, DESC must be on every prop

distinct duplicate fields get skipped

```SQL
SELECT
    DISTINCT (name, surname)
FROM
    users
where
```

questions

- virtual fields

```SQL
SELECT
    id,
    name,
    age,
    age * 2 AS age2
```

- pagination

for psql

```SQL
SELECT
    id,
    name,
    age
FROM
    users
LIMIT 10 OFFSET 10
```

for mssql

```SQL
SELECT
    id,
    name,
    age
FROM
    (SELECT
        id,
        name,
        age,
        ROW_NUMBER() OVER (ORDER BY id) AS rownum
    FROM
        users) AS t
WHERE
    rownum BETWEEN 10 AND 20
```

count rows

```SQL
SELECT
    COUNT(*)
FROM
    users
```

mssql

```SQL
SELECT
    COUNT(*)
```

orderby

can use GETDATE() for current date

# aggregations (aggregation pipeline)

<https://www.postgresql.org/docs/9.5/functions-aggregate.html>

COUNT() is an aggregation

```SQL
SELECT * from (SELECT * from table_name group by field_name1) group by field_name2;
```

min max sum avg count etc.

```SQL
SELECT
    AVG(age)
```

calcola media per ogni idAllievi

```SQL
SELECT
    idAllievo, idCorso, AVG(result) AS avg, COUNT(*) AS count
FROM
    Result
GROUP BY
    idAllievi
```

# group by

<https://learn.microsoft.com/it-it/sql/t-sql/queries/select-group-by-transact-sql?view=sql-server-ver16>

# substitute id field with name JOIN

```SQL
SELECT
    surname, name, allievo_id, corso_id, AVG(result) AS avg, COUNT(*) AS count
FROM
    Result
INNER JOIN
    Allievo ON Result.allievo_id = Allievo.id
GROUP BY
    idAllievi
```
