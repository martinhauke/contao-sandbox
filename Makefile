# HELP
# This will output the help for each task
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
# Build the project and the containers
build: ## Build the project with composer and set up the docker containers
	composer install -d ./src
	docker-compose build

# Start the containers
up: ## Bring the docker environment up
	docker-compose up -d

# Start the containers
down: ## Bring the docker environment down
	docker-compose down
