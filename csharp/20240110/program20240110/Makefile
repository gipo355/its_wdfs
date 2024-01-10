docker:
	docker-compose up -d --build --force-recreate --remove-orphans -f ./docker/psql/docker-compose.yml

build:
	dotnet build

run: build
	dotnet run

dev:
	${MAKE} docker
	dotnet watch
