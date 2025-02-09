with
    produto as (
        select *
        from {{ ref("stg_product") }}
    )
select * 
from produto