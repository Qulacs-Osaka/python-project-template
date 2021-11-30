PYTEST := poetry run pytest
FORMATTER := poetry run black
LINTER := poetry run flake8
IMPORT_SORTER := poetry run isort
TYPE_CHECKER := poetry run mypy
SPHINX_APIDOC := poetry run sphinx-apidoc

PROJECT_DIR := project_name
CHECK_DIR := $(PROJECT_DIR) tests
PORT := 8000

# Idiom found at https://www.gnu.org/software/make/manual/html_node/Force-Targets.html
FORCE:

.PHONY: test
test:
	$(PYTEST) -v

tests/%.py: FORCE
	$(PYTEST) $@

.PHONY: lint
lint:
	$(FORMATTER) $(CHECK_DIR) --check --diff
	$(LINTER) $(CHECK_DIR)
	$(IMPORT_SORTER) $(CHECK_DIR) --check --diff

.PHONY: fix
fix:
	$(FORMATTER) $(CHECK_DIR)
	$(IMPORT_SORTER) $(CHECK_DIR)

# Splitted from `check` because not all projects are ready to pass mypy.
.PHONY: type
type:
	$(TYPE_CHECKER) $(PROJECT_DIR)

.PHONY: api
api:
	$(SPHINX_APIDOC) -f -e -o doc/source $(PROJECT_DIR)

.PHONY: doc
html: api
	poetry run $(MAKE) -C doc html

.PHONY: serve
serve: html
	poetry run python -m http.server --directory doc/build/html $(PORT)