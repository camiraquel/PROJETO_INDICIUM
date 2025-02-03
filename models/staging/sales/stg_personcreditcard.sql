with
    fonte_personcreditcard as (
        select
        *
        from {{source("erp_sales", "personcreditcard")}}
    )
 
    , renomeado as (
        select
            cast(businessentityid as int) as pk_entidade_negocio,
            cast(creditcardid as int) as fk_cartao_credito,
            cast(modifieddate as string) as data_modificacao
        from fonte_personcreditcard
    )
 
select * from renomeado