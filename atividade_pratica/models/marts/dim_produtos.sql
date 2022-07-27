/* Define o tipo de materialização física (tabela)*/
{{ config(
    materialized="table",
) }}

/* Lê o modelo intermediário*/
with
    stg_produtos as (
        select *
        from {{ ref('stg_produtos') }}
    )

/* Detalha quais colunas serão disponibilizadas na tabela final. */
select
    id_produto,
    nome_produto,
    marca,
    id_categoria,
    nome_categoria,
    preco_tabela,
    peso,
    cor,
    dt_atualizacao
from stg_produtos