with
    dim_produtos as (
        select *
        from {{ ref("int_product__prep_produto") }}
    )
select * 
from dim_produtos
