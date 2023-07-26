# Desafio de DevOps Engineer - EMD

## Items do desafio

- [x] Modificar a aplicação para consumir uma variável de ambiente chamada `NAME` e, no lugar de "World", exibir o valor dessa variável.
- [x] Modificar o arquivo `.gitignore` para que seja adequado a uma aplicação Python.
- [x] Elaborar, implementar e reforçar o fluxo de desenvolvimento do repositório.
- [x] Consolidar boas práticas no repositório através de ferramentas de análise estática, hooks de pré-commit, etc. a seu critério.
- [x] Preparar a aplicação para que seja production-ready.
- [x] Criar arquivos e scripts para que a aplicação possa ser executada em um container.
- [x] Elaborar um modelo de desenvolvimento que permita a execução da aplicação em um ambiente de desenvolvimento local.
- [x] Construir pipelines de CI/CD para a aplicação utilizando GitHub Actions. Esse item possui forte relação com o fluxo de desenvolvimento, pois deve compreender o deployment em dois ambientes diferentes: homologação e produção. O deployment da aplicação deve ser realizado em um serviço serverless da Google Cloud Platform.
- [ ] Documentar todo o processo, as pipelines e o fluxo de desenvolvimento do repositório, além de hospedar essa documentação em uma página do GitHub Pages.

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
Para rodar a aplicação em modo de produção execute:
```shell
make deploy
```
Para rodar o container da aplicação em modo de produção execute:
```shell
make docker
```
Para fazer build e publicar o container execute:
```shell
make push
```
