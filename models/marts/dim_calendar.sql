with 
    model as (
        select distinct
            sk_calendar
            ,date(order_date) as date	
        from {{ ref('stg_fact') }}
        where sk_calendar is not null
    )

select * from model