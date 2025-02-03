with
    fonte_person as (
        select
        *
        from {{source("erp_person", "person")}}
    )
 
    , renomeado as (
        select
            cast(businessentityid as int) as pk_fk_entidade_negocio,
            cast(persontype as string) as tipo_pessoa,
            cast(namestyle as boolean) as estilo_nome,
            cast(title as string) as titulo,
            cast(firstname as string) as primeiro_nome,
            cast(middlename as string) as nome_meio,
            cast(lastname as string) as ultimo_nome,
            cast(suffix as string) as sufixo,
            cast(emailpromotion as int) as promocao_email,
            cast(additionalcontactinfo as string) as info_adicional_contato,
            cast(demographics as string) as demografia,
            cast(rowguid as string) as identificador_linha,
            cast(modifieddate as string) as data_modificacao
        from fonte_person
    )
 
select * from renomeado