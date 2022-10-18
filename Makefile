.PHONY: homework-i-run
# Run homework.
homework-i-run:
	@python main.py

.PHONY: homework-i-purge
# Delete all created artifacts, related with homework execution
homework-i-purge:
	@echo Goodbye

.PHONY: init-dev
# Init environment for development
init-dev:
	@pip install --upgrade pip && \
	pip install --requirement requirements.txt && \
	pre-commit install


.PHONY: pre-commit-run
# Run tools for files from commit.
pre-commit-run:
	@pre-commit run

.PHONY: pre-commit-run-all
# Run tools for all files.
pre-commit-run-all:
	@pre-commit run --all-files




.PHONY: d-homework-i-run
# Make all actions needed for run project.
d-homework-i-run:
	@make doc-run

.PHONY: d-homework-i-purge
# Make all actions needed for purge project and related data.
d-homework-i-purge:
	@make doc-purge


.PHONY: doc-run
# Run docker
doc-run:
		@COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker-compose \
			up --build

.PHONY: doc-purge
# Stop docker
doc-purge:
		@COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker-compose \
			down --remove-orphans --rmi local --timeout 0

