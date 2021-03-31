with 
    model as (
        select distinct
            sk_customers
            , customer_id
            , company_name_customers
            , contact_name
        from {{ ref('stg_fact') }}
        where sk_customers  is not null
    )

select * from model