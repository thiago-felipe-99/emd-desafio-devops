FROM python:3.9-alpine

ENV PYTHONUNBUFFERED True

ENV APP_HOME /app
WORKDIR $APP_HOME

RUN apk add make curl

COPY pyproject.toml Makefile ./

RUN make install_poetry

ENV PATH=/root/.local/bin:$PATH

RUN make install_deploy_dependecies

COPY *.py ./

ENTRYPOINT make deploy

