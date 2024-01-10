```
version: '3.4'
services:
  sqlserver:
    image: mcr.microsoft.com/mssql/server
    container_name: MsSqlServer
    environment:
     - ACCEPT_EULA=Y
     - SA_PASSWORD=Password_01
    ports:
     - "1433:1433"
    volumes:
     - <YOUR_PATH>:/var/opt/mssql/data
```

if you want to change password for SA user.

make operation as stop and remove docker container.

Open folder and remove all files except custom databases.

Changes password in docker run command or in docker-compose.yml file.

Excute command again to create your container.

to check files or do some changes inside of docker container use command docker

exec -it containerName bash

## default username

sa

## volume doesn't work?
