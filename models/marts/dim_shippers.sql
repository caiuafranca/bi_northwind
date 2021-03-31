with 
    model as (
        select distinct
            sk_shippers
            , shipper_id
            , company_name
        from {{ ref('stg_fact') }}
        where sk_shippers is not null
    )

select * from model