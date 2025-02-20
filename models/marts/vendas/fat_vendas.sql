with
    dim_solicitacao_venda as (
        select *
        from {{ ref("dim_solicitacao_venda") }}
    ),
    dim_razao_venda as (
        select *
        from {{ ref("dim_razao_venda") }}
    ),
    dim_cartao_credito as (
        select *
        from {{ ref("dim_cartao_credito") }}
    ),
    dim_pessoa as (
        select *
        from {{ ref("dim_pessoa") }}
    ),
    dim_endereco as (
        select *
        from {{ ref("dim_endereco") }}
    ),
    fat_vendas as (
        select
            dim_solicitacao_venda.pk_ordem_venda,
            dim_solicitacao_venda.quantidade_pedido,
            dim_solicitacao_venda.fk_produto,
            dim_solicitacao_venda.preco_unitario, 
            dim_solicitacao_venda.desconto_preco_unitario,
            dim_solicitacao_venda.fk_cartao_credito,
            dim_razao_venda.pk_fk_razao_venda,
            dim_solicitacao_venda.data_compra,
            dim_pessoa.pk_fk_entidade_negocio,
            dim_solicitacao_venda.status,
            dim_solicitacao_venda.fk_endereco_envio,
            dim_endereco.pk_estado,
            dim_endereco.pk_codigo_pais,
            dim_solicitacao_venda.subtotal
        from dim_solicitacao_venda
        left join dim_razao_venda
            on dim_solicitacao_venda.pk_ordem_venda = dim_razao_venda.pk_fk_ordem_venda
        left join dim_cartao_credito
            on dim_solicitacao_venda.fk_cartao_credito = dim_cartao_credito.pk_cartao_credito
        left join dim_pessoa
            on dim_cartao_credito.pk_entidade_negocio = dim_pessoa.pk_fk_entidade_negocio
        left join dim_endereco
            on dim_solicitacao_venda.fk_endereco_envio = dim_endereco.pk_endereco
    )
select * 
from fat_vendas
