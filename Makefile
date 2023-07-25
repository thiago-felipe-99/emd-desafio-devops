.PHONY: install_poetry
install_poetry:
	curl -sSL https://install.python-poetry.org | python3 -

.PHONY: check_poetry
check_poetry:
 ifeq (, $(shell which poetry))
	 $(error "No poetry in $$PATH, consider doing make install_poetry")
 endif

.PHONY: install_dependecies
install_dependecies: check_poetry
	poetry install

.PHONY: lint
lint:
	poetry run black .

.PHONY: run
run: install_dependecies lint
	poetry run flask run --debug

