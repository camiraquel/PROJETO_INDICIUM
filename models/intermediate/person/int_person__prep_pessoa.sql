with
    pessoa as (
        select *
        from {{ ref("stg_person") }}
    )
select * 
from pessoa