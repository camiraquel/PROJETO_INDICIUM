with
    fonte_creditcard as (
        select
        *
        from {{source("erp_sales", "creditcard")}}
    )
 
    , renomeado as (
        select
            cast(creditcardid as int) as pk_cartao_credito,
            cast(cardtype as string) as tipo_cartao,
            cast(cardnumber as int) as numero_cartao,
            cast(expmonth as int) as mes_expiracao,
            cast(expyear as int) as ano_expiracao,
            cast(modifieddate as string) as data_modificacao
        from fonte_creditcard
    )
 
select * from renomeado