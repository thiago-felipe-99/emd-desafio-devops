# Desafio de DevOps Engineer - EMD
[![Coverage Status](https://coveralls.io/repos/github/thiago-felipe-99/emd-desafio-devops/badge.svg?branch=main)](https://coveralls.io/github/thiago-felipe-99/emd-desafio-devops?branch=main)

## Documentação do desafio
A documentação do desafio pode ser vista em [https://thiago-felipe-99.github.io/emd-desafio-devops/](https://thiago-felipe-99.github.io/emd-desafio-devops/).

## Rodar Aplicação
## Ambiente Desenvolvimento
Caso não tenha o poetry instalado execute:
```shell
make install_poetry
```
Para rodar a aplicação localmente execute:
```shell
make run
```
Também é possível rodar localmente com o docker:
```shell
make docker
```
## Ambiente Produção
A aplicação de produção pode ser acessado em [https://production-t3kr3ajj2q-uc.a.run.app](https://production-t3kr3ajj2q-uc.a.run.app).

Para rodar a aplicação em modo de produção execute:
```shell
make deploy
```
Para rodar o container da aplicação em modo de produção execute:
```shell
make docker
```
