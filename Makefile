PROJECT = python-tdd-playground

.PHONY: test
test: .venv
	pipenv run mypy .
	pipenv run pytest

.PHONY: test-docker
test-docker: docker-build
	docker run --rm -v $(PWD):/app $(PROJECT) mypy .
	docker run --rm -v $(PWD):/app $(PROJECT) pytest --color yes

.PHONY: docker-build
docker-build: Pipfile.lock
	docker build -t $(PROJECT) .

Pipfile.lock: Pipfile
	pipenv lock
	
.venv: Pipfile.lock
	PIPENV_VENV_IN_PROJECT=1 pipenv install --dev

.PHONY: clean
clean:
	pipenv --rm
