with
    fonte_countryregion as (
        select
        *
        from {{source("erp_person", "countryregion")}}
    )
 
    , renomeado as (
        select
            cast(countryregioncode as string) as pk_codigo_pais,
            cast(name as string) as nome,
            cast(modifieddate as string) as data_modificacao
        from fonte_countryregion
    )
 
select * from renomeado