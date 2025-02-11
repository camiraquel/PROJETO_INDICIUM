with
    dim_cartao_credito as (
        select *
        from {{ ref("int_sales__prep_cartao_credito") }}
    )
select * 
from dim_cartao_credito

