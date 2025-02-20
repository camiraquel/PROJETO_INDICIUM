with
    dim_razao_venda as (
        select *
        from {{ ref("int_sales__prep_razao_venda") }}
    )
select * 
from dim_razao_venda
