with
    dim_endereco as (
        select *
        from {{ ref("int_person__prep_endereco") }}
    )
select * 
from dim_endereco
