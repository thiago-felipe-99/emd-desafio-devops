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

.PHONY: docker
docker:
	docker compose up -d --build

.PHONY: test
test: install_all_dependecies
	poetry run pytest --cov=. --cov-report xml

.PHONY: coverage
coverage: install_all_dependecies
	poetry run coverage run -m pytest
	poetry run coverage report

.PHONY: pre-commit
pre-commit: install_all_dependecies
	poetry run pre-commit run --all-files

.PHONY: semgrep
semgrep:
	poetry run semgrep scan --error --verbose --config auto

.PHONY: all
all: deploy

.PHONY: clean
clean:
	rm -rf .mypy_cache src/__pycache__ test/__pycache__ .pytest_cache
