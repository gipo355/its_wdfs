# assignment

create a program that connects to db, inserts a product, and then prints all
products.

on exit, close the connection

using <https://learn.microsoft.com/en-us/azure/postgresql/single-server/connect-csharp>

and <https://medium.com/@RobertKhou/getting-started-with-entity-framework-core-postgresql-c6fa09681624>

<https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/sql/linq/>

<https://learn.microsoft.com/en-us/ef/core/dbcontext-configuration/>

<https://github.com/bolorundurowb/dotenv.net>

<https://www.npgsql.org/efcore/index.html>

<https://learn.microsoft.com/en-us/ef/core/providers/?tabs=dotnet-core-cli>

<https://learn.microsoft.com/en-us/ef/core/get-started/overview/first-app?tabs=netcore-cli>

singletons

## steps

console should accept commands with readline numbers

1. add item to db
2. delete item from db
3. list all items
4. get single item

5. add start script with make? to launch docker too

## how to run

create .env , refer to .env.default

run docker compose up --build --detach inside ./docker/psql
