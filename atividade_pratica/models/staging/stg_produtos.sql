with 
    produtos as (
        select * from
        {{source('saque_e_voleio_erp','produtos') }}
    ),
    categorias as (
        select * from
        {{source('saque_e_voleio_erp','produto_categorias') }}
    ),
    dados_transformados as (
        select
        produtos.id_produto,
        produtos.nome as nome_produto,
        produtos.marca,
        produtos.id_categoria,
        categorias.nome as nome_categoria,
        produtos.preco_tabela,
        produtos.peso,
        produtos.cor,
        produtos.dt_atualizacao
        from produtos 
        left join categorias
        on produtos.id_categoria = categorias.id_categoria
    )

select * from dados_transformados