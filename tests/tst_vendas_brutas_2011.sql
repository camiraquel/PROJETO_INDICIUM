/* Este teste garante que as vendas brutas de 2011 foram de $12.646.112,16. */

with
    vendas_brutas_2011 as (
        select ROUND(sum(preco_unitario * quantidade_pedido), 2) as soma_total_bruto
        from {{ref("int_sales__prep_vendas")}}
        where CAST(data_compra AS DATE) BETWEEN '2011-01-01' AND '2011-12-31'
    )
select soma_total_bruto
from vendas_brutas_2011
where soma_total_bruto not between 12646111.00 and 12646113.00