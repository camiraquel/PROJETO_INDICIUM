with
    fonte_address as (
        select
        *
        from {{source("erp_person", "address")}}
    )
 
    , renomeado as (
        select
            cast(addressid as int) as pk_endereco,
            cast(addressline1 as string) as linha1_endereco,
            cast(addressline2 as string) as linha2_endereco,
            cast(city as string) as cidade,
            cast(stateprovinceid as int) as fk_estado,
            cast(postalcode as string) as codigo_postal,
            cast(spatiallocation as string) as localizacao,
            cast(rowguid as string) as identificador_linha,
            cast(modifieddate as string) as data_modificacao
        from fonte_address
    )
 
select * from renomeado