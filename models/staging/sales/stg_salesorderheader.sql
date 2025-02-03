with
    fonte_salesorderheader as (
        select
        *
        from {{source("erp_sales", "salesorderheader")}}
    )
 
    , renomeado as (
        select
            cast(salesorderid as int) as pk_ordem_venda,
            cast(revisionnumber as int) as numero_revisao,
            cast(orderdate as string) as data_compra,
            cast(duedate as string) as data_vencimento,
            cast(shipdate as string) as data_envio,
            cast(status as int) as status,
            cast(onlineorderflag as boolean) as ind_ordem_online,
            cast(purchaseordernumber as string) as numero_ordem_compra,
            cast(accountnumber as string) as numero_conta,
            cast(customerid as int) as fk_cliente,
            cast(salespersonid as int) as fk_vendedor,
            cast(territoryid as int) as fk_territorio,
            cast(billtoaddressid as int) as fk_endereco_cobranca,
            cast(shiptoaddressid as int) as fk_endereco_envio,
            cast(shipmethodid as int) as fk_metodo_envio,
            cast(creditcardid as int) as fk_cartao_credito,
            cast(creditcardapprovalcode as string) as codigo_aprovacao_cartao_credito,
            cast(currencyrateid as int) as fk_taxa_cambio,
            cast(subtotal as float) as subtotal,
            cast(taxamt as float) as taxamt,
            cast(freight as float) as frete,
            cast(totaldue as float) as total_devido,
            cast(comment as int) as comentario,
            cast(rowguid as string) as identificador_linha,
            cast(modifieddate as string) as data_modificacao
        from fonte_salesorderheader
    )
 
select * from renomeado