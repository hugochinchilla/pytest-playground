PROJECT = python-tdd-playground

.PHONY: test
test: .venv
	pipenv run pytest

.PHONY: test-docker
test-docker: build
	docker run --rm $(PROJECT) pytest --color yes

.PHONY: docker-build
docker-build: Pipfile.lock
	docker build -t $(PROJECT) .

Pipfile.lock: Pipfile
	pipenv lock
	
.venv:
	PIPENV_VENV_IN_PROJECT=1 pipenv install --dev

.PHONY: clean
clean:
	pipenv --rm