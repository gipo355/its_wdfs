# assignment

create a program that connects to db, inserts a product, and then prints all
products.

on exit, close the connection

using <https://learn.microsoft.com/en-us/azure/postgresql/single-server/connect-csharp>

## steps

console should accept commands with readline numbers

1. add item to db
2. delete item from db
3. list all items
4. get single item

## how to run

create .env , refer to .env.default

run docker compose up --build --detach inside ./docker/psql
