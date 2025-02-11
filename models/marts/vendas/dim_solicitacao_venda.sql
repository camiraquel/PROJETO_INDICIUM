with
    dim_solicitacao_venda as (
        select *
        from {{ ref("int_sales__prep_vendas") }}
    )
select * 
from dim_solicitacao_venda
