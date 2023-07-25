.PHONY: install_poetry
install_poetry:
	curl -sSL https://install.python-poetry.org | python3 -

.PHONY: check_poetry
check_poetry:
 ifeq (, $(shell which poetry))
	 $(error "No poetry in $$PATH, consider doing make install_poetry")
 endif

.PHONY: prepare
prepare: check_poetry
	poetry install

.PHONY: run
run: prepare
	poetry run flask run --debug

