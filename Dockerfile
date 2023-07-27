FROM python:3.9-alpine

ENV PYTHONUNBUFFERED True

ENV APP_HOME /app

WORKDIR $APP_HOME

RUN apk add make curl

COPY pyproject.toml Makefile ./

ENV POETRY_HOME=/etc/poetry

ENV PATH=/etc/poetry/bin:$PATH

RUN make install_poetry

RUN make install_deploy_dependecies

COPY src ./src

RUN adduser docker --gecos "" --home /home/docker --disabled-password

USER docker

ENTRYPOINT make deploy

EXPOSE 8080
