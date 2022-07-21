# Processos ELT em MAS

Este repositório contém material adicional para o curso Processos ELT em MAS desenvolvido para a Universidade Cruzeiro do Sul.

Importante: os exemplos aqui apresentados foram construídos no Sistema Operacional Linux (Pop_os 21_04). No entanto, na documentação de cada ferramenta você pode encontrar orientações para instalação nos ambientes Windows e Mac.

Se você não possui conhecimento em `docker` ou configuração de ambientes locais, recomendamos utilizar o [Google BigQuery](https://cloud.google.com/bigquery?hl=pt-br). Para isso você precisará de uma conta no [Google Cloud Platform](https://console.developers.google.com/?hl=pt-Br). Embora paga, ela permite utilizar muitos recursos de forma gratuita e você não deverá ter custos durante a realização dos exemplos desse repositório. Lembre-se de cancelar a conta futuramente se não desejar mais utilizá-la.

[Como adicionar os dados no Google BigQuery?]

## Exemplo Local

A seguir apresentamos exemplos utilizando um ambiente local. Para um exemplo na nuvem veaja a seção [Exemplo Nuvem]()
### Iniciando o Banco de Dados de Exemplo (PostgreSQL)

Os dados de exemplo do ERP da Saque Voleio estão disponíveis na pasta `db`. As instruções para iniciar um banco de dados PostgreSQL com os dados estão abaixo (você vai precisar do `docker-compose` instalado em seu computador):

```bash
docker-compose up
```

### Configurando a ferramenta de integração (Airbyte)

O Airbyte é uma aplicação de integração de dados de código-aberto que pode ser instalada localmente utilizando o `docker-compose. Você também pode testar a aplicação gerenciada criando uma conta em [Airbyte Cloud]()

```bash
git clone https://github.com/airbytehq/airbyte.git
cd airbyte
docker-compose up
```

Você deve conseguir acessar o Airbyte através do [http://localhost:8000](http://localhost:8000).

### Criando um Data Warehouse

Antes de iniciar as extrações de dados, precisamos configurar um destino para eles. Para isso vamos criar um novo `database` chamado `data-warehouse`  através da aplicação `createdb`:

```bash
createdb -U postgres -h localhost data-warehouse
```

### Iniciando o projeto dbt

Para transformar os dados no data warehouse usamos a ferramenta dbt. Ela pode ser instalada através dos comandos abaixo (você precisará do `>python 3.7` instalado em seu computador):

```bash
python3 -m venv venv
source venv/bin/activate
pip install dbt-postgres
```

Para começar um novo projeto utilize:

```bash
dbt init saque_e_voleio_dbt
```

Em seguida você deve adicionar um profile no arquivo `~/.dbt/profiles.yml` com as seguintes configurações:

```
saque_e_voleio_dbt: # this needs to match the profile in your dbt_project.yml file
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: postgres
      password: postgres
      port: 5432
      dbname: data-warehouse
      schema: marts
```

## Exemplo Nuvem (Google BigQuery)

Em desenvolvimento.

## Copyright

Prof. Msc. Daniel Paulon Avancini

## Licença

[Creative Commons Attribution SA 4.0](LICENSE)