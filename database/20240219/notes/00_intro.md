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
