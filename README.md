# Processos ELT em MAS

Este repositório contém material adicional para o curso Processos ELT em MAS desenvolvido para a Universidade Cruzeiro do Sul

Importante: os exemplos aqui apresentados foram construídos no Sistema Operacional Linux (Pop_os 21_04). No entanto, na documentação de cada ferramenta você pode encontrar orientações para instalação nos ambientes Windows e Mac.

## Iniciando o Banco de Dados de Exemplo (PostgreSQL)

Os dados de exemplo do ERP da Saque Voleio estão disponíveis na pasta `db`. As instruções para iniciar um banco de dados PostgreSQL com os dados estão abaixo (você vai precisar do `docker-compose` instalado em seu computador):

```bash
docker-compose up
```

## Configurando a ferramenta de integração (Airbyte)

O Airbyte é uma aplicação de integração de dados de código-aberto que pode ser instalada localmente utilizando o `docker-compose. Você também pode testar a aplicação gerenciada por eles [Airbyte Cloud]()

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

## Iniciando um projeto dbt


## Copyright

Prof. Msc. Daniel Paulon Avancini

## Licença

[Creative Commons Attribution SA 4.0](LICENSE)