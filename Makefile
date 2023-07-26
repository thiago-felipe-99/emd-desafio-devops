REPO := thiago-felipe-99/emd-desafio-devops
GITHUB_REPO := https://github.com/$(REPO)
DOCKER_REPO := ghcr.io/$(REPO)
DOCKER_VERSION := latest

.PHONY: install_poetry
install_poetry:
	curl -sSL https://install.python-poetry.org | python3 -

.PHONY: check_poetry
check_poetry:
 ifeq (, $(shell which poetry))
	 $(error "No poetry in $$PATH, consider doing make install_poetry")
 endif

.PHONY: install_all_dependecies
install_all_dependecies: check_poetry
	poetry install

.PHONY: install_deploy_dependecies
install_deploy_dependecies: check_poetry
	poetry install --only main

.PHONY: lint
lint: install_all_dependecies
	poetry run black .
	poetry run flake8 .
	poetry run isort .

.PHONY: check_lint
check_lint: install_all_dependecies
	poetry run black . --check --diff
	poetry run flake8 .
	poetry run isort . --check-only

.PHONY: run
run: install_all_dependecies lint
	poetry run flask --app src run --debug --port 8080

.PHONY: deploy
deploy: install_deploy_dependecies
	poetry run gunicorn --chdir src --bind 0.0.0.0:8080 --workers 1 --threads 8 --timeout 0 'src:create_app()'

.PHONY: build
build:
	docker build -t $(DOCKER_REPO):$(DOCKER_VERSION) . \
		--label org.opencontainers.image.source=$(GITHUB_REPO)

.PHONY: push
push: build
	docker push $(DOCKER_REPO):$(DOCKER_VERSION)

.PHONY: docker
docker: build
	docker compose up -d --build

.PHONY: test
test: install_all_dependecies
	poetry run pytest

.PHONY: coverage
coverage: install_all_dependecies
	poetry run coverage run -m pytest
	poetry run coverage report
