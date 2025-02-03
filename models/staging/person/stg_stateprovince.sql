with
    fonte_stateprovince as (
        select
        *
        from {{source("erp_person", "stateprovince")}}
    )
 
    , renomeado as (
        select
            cast(stateprovinceid as int) as pk_estado,
            cast(stateprovincecode as string) as codigo_estado,
            cast(countryregioncode as string) as fk_codigo_pais,
            cast(isonlystateprovinceflag as boolean) as ind_unico_estato,
            cast(name as string) as nome,
            cast(territoryid as int) as fk_territorio,
            cast(rowguid as string) as identificador_linha,
            cast(modifieddate as string) as data_modificacao
        from fonte_stateprovince
    )
 
select * from renomeado