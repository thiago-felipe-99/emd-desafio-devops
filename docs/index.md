# Resolução Dos Desafios

Resolução do [Desafio DevOps Engineer - EMD](https://github.com/prefeitura-rio/emd-desafio-devops)

O projeto era composto por 9 desafios, irei descrever o que eu fiz para solucionar
todos eles

## Desafio 1
___Modificar a aplicação para consumir uma variável de ambiente chamada `NAME` e, no lugar de "World", exibir o valor dessa variável.___

O primeiro desafio tinha como adicionar um variável de ambiente no projeto Flask,
seguindo a documentação do [Flask](https://flask.palletsprojects.com/en/2.0.x/config/)
eu criei um arquivo `settings.py` par apode configurar todas as varipaveis de ambiente do
projeto e uso o próprio Flask, com o dotenv, para poder inicializar e distribuir
as variáveis pelo projeto.

#### Issues
- [#3](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/3)

## Desafio 2
___Modificar o arquivo `.gitignore` para que seja adequado a uma aplicação Python.___

Ao longo do desafio eu fui adicionando no `.gitignore` arquivos de caches e de builds
onde sujaria a o diretório do git e ficaria pesado o projeto, também adicionei os
arquivos que configura as variáveis de ambiente tanto da aplicação quanto do Flask
e por último os arquivos que mostra a cobertura dos testes do projeto.

#### Issues
- [#1](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/1)

## Desafio 3
___Elaborar, implementar e reforçar o fluxo de desenvolvimento do repositório.___

O fluxo que eu elaborei é um ciclo rápido e com foco de sempre entregar as últimas
alterações para o usuário, ele não é recomendado para todos os tipos de projetos,
principalmente para grande projetos ou/e que tenha uma alta taxa de alteração.
Porém para o nosso projeto de teste ele serve é perfeitamente para termos as últimas
alterações em produção

#### Issues
- [#9](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/9)

### Ciclo
1. Desenvolvedor irá abrir uma issue descrevendo o que será feito
1. Desenvolvedor criar uma branch com as seguintes características:
    - `<nome_usuario>/<tipo_pr>/<ação>`
    - exemplo: `joao/feature/verificacao_usuario`
    - O João ira adicionar uma nova funcionalidade no projeto para fazer verificação de usuário
1. A cada commit irá ser executado o hook de `pre-commit`
1. Desenvolvedor irá criar um novo Pull Request(PR) apontado para fechar automaticamente a issue criada
1. Através do Github Actions irá fazer as seguintes verificações do PR:
    - Verificar o lint
    - Verificar os testes
    - Rodar os testes
1. Através do Github Actions irá subir um deploy exclusivo para o último commit
1. Desenvolvedor irá fazer testes próprios nesse novo deploy
1. Depois que todas as ações do Github Actions estiverem Okay poderá fazer merge na branch main
1. Através do Github Actions irá subit um deploy em modo de produção
1. Semanalmente irá rodar um Github Actions para criar a tag da semana
1. Caso seja detectado algum bug/problema na branch principal deverá rodar manualmente
a Action de deploy na última tag okay

#### Issues
- [#7](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/7)
- [#12](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/12)
- [#19](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/19)
- [#20](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/20)

## Desafio 4
___Consolidar boas práticas no repositório através de ferramentas de análise estática, hooks de pré-commit, etc. a seu critério.___

Adicionei várias Github Actions para fazer verificar testes, lint do projeto e o [semgrep](https://semgrep.dev/)
em todo PR e push, também criei um `precommit` para rodas essas ações em cada commit
assim aliviando o Github Actions.

### Lints usados
- [black](https://black.readthedocs.io/en/stable/)
- [flake8](https://flake8.pycqa.org/en/latest/)
- [isort](https://pycqa.github.io/isort/)

### Teste
Usei a biblioteca [pytest](https://docs.pytest.org/en/7.4.x/) para fazer testes unitários
e fazer relatórios de cobertura.

#### Issues
- [#5](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/5)
- [#7](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/7)
- [#9](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/9)
- [#12](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/12)
- [#19](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/19)

## Desafio 5
___Preparar a aplicação para que seja production-ready.___

Usando o `Makefile` eu criei uma task para fazer o deploy da aplicação usando [gunicorn](https://gunicorn.org/),
além de rodar Github Actions em cada PR e lints/semgrep/testes em cada `precommit`.
Para rodar o deploy basta rodar:
```shell
make deploy
```
Com isso irá instalar todas as dependências e iniciar a aplicação em modo produção na porta `8080`

#### Issues
- [#21](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/21)
- [#22](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/22)
- [#23](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/23)

## Desafio 6
___Criar arquivos e scripts para que a aplicação possa ser executada em um container.___

Eu usei o `make` para realizar todos os scripts do proejto, o motivo de utilização
é pela fácil implementação de scripts e de está disponível em quase todas as aplicações
linux por padrão. Com a criação do `Makefile` foi de fácil implementação do Dockerfile e docker-compose.
Para iniciar o containeir basta rodar:
```shell
make docker
```
Com isso irá instalar todas as dependências e iniciar a aplicação em modo produção na porta `8080`

#### Issues
- [#9](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/9)
- [#22](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/22)
- [#23](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/23)

## Desafio 7
___Elaborar um modelo de desenvolvimento que permita a execução da aplicação em um ambiente de desenvolvimento local.___

Usando os próprio `make` podemos roda a aplicação em desenvolvimento com:
```shell
make run
```
Com isso irá instalar todas as dependências e iniciar a aplicação em modo desenvolvimento na porta `8080`

#### Issues
- [#1](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/1)

## Desafio 8
___Construir pipelines de CI/CD para a aplicação utilizando GitHub Actions. Esse item possui forte relação com o fluxo de desenvolvimento, pois deve compreender o deployment em dois ambientes diferentes: homologação e produção. O deployment da aplicação deve ser realizado em um serviço serverless da Google Cloud Platform.___

Eu criei 2 Github Actions para subir um deploy exclusivo para cada commit no PR
com sua URL sendo disponibilizado com um comentário no PR e um deploy para cada
vez que a branch main é atualizada. A aplicação de produção pode ser acessado em
[https://production-t3kr3ajj2q-uc.a.run.app](https://production-t3kr3ajj2q-uc.a.run.app).

#### Issues
- [#9](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/9)
- [#22](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/22)
- [#23](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/23)

## Desafio 9
___Documentar todo o processo, as pipelines e o fluxo de desenvolvimento do repositório, além de hospedar essa documentação em uma página do GitHub Pages.___

Usando [mkdocs](https://www.mkdocs.org/) criei a documentção de todo o proejto, além
de utilizar as ferramentas de Issues e Pull Requests do Github.

### Issues
- [#27](https://github.com/thiago-felipe-99/emd-desafio-devops/issues/27)

## Observações
No desafio pede para usar um fork do projeto, porém eu fiz um fork sem usar a
interface do github assim o meu projeto, no github, não aparece que é originalmente
um fork de [https://github.com/prefeitura-rio/emd-desafio-devops](https://github.com/prefeitura-rio/emd-desafio-devops)
porém eu não apaguei nenhum commit. Eu poderia refazer o projeto utilizando a
interface do github porém isso iria apagar o meu histórico de Issues, Pull Requests
e Actions por isso não fiz isso.

Comando usados para fazer fork:
```shell
git clone https://github.com/prefeitura-rio/emd-desafio-devops
cd emd-desafio-devops
git remote add fork https://github.com/prefeitura-rio/emd-desafio-devops
git remote set-url origin git@github.com:thiago-felipe-99/emd-desafio-devops.git
git branch -M main
git push -u origin main
```
