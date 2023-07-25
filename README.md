# Desafio de DevOps Engineer - EMD

Repositório de instrução para o desafio técnico para a vaga de Pessoa Engenheira DevOps no [Escritório de Dados do Rio de Janeiro](https://dados.rio)

## Descrição do desafio

Neste repositório, você encontrará uma aplicação web desenvolvida em [Flask](https://flask.palletsprojects.com/). Sua tarefa consiste nos seguintes passos (realizá-los na ordem que julgar adequada e ir marcando os itens completos):

- [ ] Modificar a aplicação para consumir uma variável de ambiente chamada `NAME` e, no lugar de "World", exibir o valor dessa variável.
- [x] Modificar o arquivo `.gitignore` para que seja adequado a uma aplicação Python.
- [ ] Elaborar, implementar e reforçar o fluxo de desenvolvimento do repositório.
- [ ] Consolidar boas práticas no repositório através de ferramentas de análise estática, hooks de pré-commit, etc. a seu critério.
- [ ] Preparar a aplicação para que seja production-ready.
- [ ] Criar arquivos e scripts para que a aplicação possa ser executada em um container.
- [ ] Elaborar um modelo de desenvolvimento que permita a execução da aplicação em um ambiente de desenvolvimento local.
- [ ] Construir pipelines de CI/CD para a aplicação utilizando GitHub Actions. Esse item possui forte relação com o fluxo de desenvolvimento, pois deve compreender o deployment em dois ambientes diferentes: homologação e produção. O deployment da aplicação deve ser realizado em um serviço serverless da Google Cloud Platform.
- [ ] Documentar todo o processo, as pipelines e o fluxo de desenvolvimento do repositório, além de hospedar essa documentação em uma página do GitHub Pages.

## Rodar Aplicação
## Localmente
Para rodar a aplicação localmente basta executar o comando:
```shell
make run
```
