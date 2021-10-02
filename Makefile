PYSEN := poetry run pysen
PYTEST := poetry run pytest

.PHONY: test
test:
	$(PYTEST) -v

.PHONY: lint
lint:
	$(PYSEN) run lint

.PHONY: format
format:
	$(PYSEN) run format

.PHONY: check
check: format lint
