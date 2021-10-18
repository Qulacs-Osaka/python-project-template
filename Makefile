PYSEN := poetry run pysen
PYTEST := poetry run pytest

# Idiom found at https://www.gnu.org/software/make/manual/html_node/Force-Targets.html
FORCE:

.PHONY: test
test:
	$(PYTEST) -v

tests/%.py: FORCE
	$(PYTEST) $@

.PHONY: lint
lint:
	$(PYSEN) run lint

.PHONY: format
format:
	$(PYSEN) run format

.PHONY: check
check: format lint

.PHONY: api
api:
	sphinx-apidoc -f -e -o doc/source project_name

.PHONY: doc
doc: api
	$(MAKE) -C doc html
