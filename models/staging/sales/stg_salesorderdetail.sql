with
    font_salesorderdetail as (
        select
        *
        from {{source("erp_sales", "salesorderdetail")}}
    )
 
    , renomeado as (
        select
        cast(salesorderid as int) as pk_pedido_venda,
        cast(salesorderdetailid as int) as fk_detalhe_pedido_venda,
        cast(carriertrackingnumber as int) as numero_rastreamento,
        cast(orderqty as int) as quantidade_pedido,
        cast(productid as int) as fk_produto,
        cast(specialofferid as int) as fk_oferta_especial,
        cast(unitprice as int) as preco_unitario,
        cast(unitpricediscount as int) as desconto_preco_unitario,
        cast(rowguid as int) as identificador_linha,
        cast(modifieddate as string) as data_modificacao
        from font_salesorderdetail
    )
 
    select * from renomeado