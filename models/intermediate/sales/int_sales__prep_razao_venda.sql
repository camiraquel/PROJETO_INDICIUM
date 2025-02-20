with
    razao_venda as (
        select *
        from {{ ref("stg_salesorderheadersalesreason") }}
    ),
    razao as (
        select *
        from {{ ref("stg_salesreason") }}
    ),
    razao_venda_incremendado as (
        select
            razao_venda.pk_fk_razao_venda,
            razao_venda.pk_fk_ordem_venda,
            razao.nome,
            razao.tipo_razao,
            razao.data_modificacao as data_modificacao_razao
        from razao_venda
        left join razao
            on razao_venda.pk_fk_razao_venda = razao.pk_razao_venda
    )
select distinct * 
from razao_venda_incremendado
