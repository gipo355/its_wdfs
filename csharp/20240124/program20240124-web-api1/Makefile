db-migrate:
	@echo "Migrating database..."
	@dotnet ef migrations add $(name)
	@echo "Done."

db-update:
	@echo "Updating database..."
	@dotnet ef database update
	@echo "Done."

db-drop:
	@echo "Dropping database..."
	@dotnet ef database drop
	@echo "Done."

db-reset: db-drop db-update

dev:
	@echo "Running development server..."
	@dotnet watch run
