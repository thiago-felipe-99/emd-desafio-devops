VENV_BIN := .venv/bin
PYTHON := $(VENV_BIN)/python
PIP := $(VENV_BIN)/pip
FLASK := $(VENV_BIN)/flask

.PHONY: prepare
prepare:
	python3 -m venv .venv
	$(PIP) install Flask

.PHONY: run
run: prepare
	$(FLASK) run

