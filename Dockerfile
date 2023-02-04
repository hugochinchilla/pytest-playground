FROM python:3.10-slim

RUN pip3 install pipenv

WORKDIR /app

ADD Pipfile Pipfile.lock ./
RUN pipenv sync --dev --system
