with 
    model as (
        select distinct
            sk_employees        
            , employee_id
            , first_name
            , last_name
            , title
        from {{ ref('stg_fact') }}
        where sk_employees is not null
    )

select * from model