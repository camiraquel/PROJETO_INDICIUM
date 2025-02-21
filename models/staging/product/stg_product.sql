with
    fonte_product as (
        select
        *
        from {{source("erp_product", "product")}}
    ) 
    , renomeado as (
        select
        cast(productid as int) as pk_produto,
        cast(name as string) as nome_produto,
        cast(productnumber as string) as numero_produto,
        cast(makeflag as boolean) as flag,
        cast(finishedgoodsflag as boolean) as flag_finalizado,
        cast(color as string) as cor,
        cast(safetystocklevel as int) as nivel_estoque_seguro,
        cast(reorderpoint as int) as ponto_reordenacao,
        cast(standardcost as float) as custo_padrao,
        cast(listprice as float) as lista_preco,
        cast(size as string) as tamanho,
        cast(sizeunitmeasurecode as string) as tamanho_unitario_codigo_medida,
        cast(weightunitmeasurecode as string) as peso_unitario_codigo_medida,
        cast(weight as float) as peso,
        cast(daystomanufacture as int) as dias_pra_producao,
        cast(productline as string) as linha_produto,
        cast(class as string) as classe,
        cast(style as string) as estilo,
        cast(productsubcategoryid as int) as fk_subcategoria_produto,
        cast(productmodelid as int) as modelo_produto,
        cast(sellstartdate as string) as data_inicio_venda,
        cast(sellenddate as timestamp) as data_fim_venda,
        cast(discontinueddate as timestamp) as data_descontinuacao,
        cast(rowguid as string) as identificador_linha,
        cast(modifieddate as timestamp) as data_modificacao
        from fonte_product
    )
 
select * from renomeado