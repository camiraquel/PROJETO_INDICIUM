with
    endereco as (
        select *
        from {{ ref("stg_address") }}
    ),
    estado as (
        select *
        from {{ ref("stg_stateprovince") }}
    ),
    pais as (
        select *
        from {{ ref("stg_countryregion") }}
    ),
    endereco_incrementado as (
        select
            endereco.pk_endereco,
            endereco.linha1_endereco,
            endereco.linha2_endereco,
            endereco.cidade,
            endereco.codigo_postal,
            endereco.localizacao,
            endereco.data_modificacao as data_modificacao_endereco,
            estado.pk_estado,
            estado.codigo_estado,
            estado.ind_unico_estato,
            estado.nome as nome_estado,
            estado.fk_territorio,            
            estado.data_modificacao as data_modificacao_estado,
            pais.pk_codigo_pais,
            pais.nome as nome_pais,
            pais.data_modificacao as data_modificacao_pais
        from endereco
        left join estado
            on endereco.fk_estado = estado.pk_estado
        left join pais
            on estado.fk_codigo_pais = pais.pk_codigo_pais
    )
select * 
from endereco_incrementado
