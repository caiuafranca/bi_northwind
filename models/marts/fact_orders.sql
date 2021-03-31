with 
model as (
    select
        order_id
        , sk_customers
        , sk_shippers
        , sk_products
        , sk_calendar       
        , sum(freight) as  freight           
        , sum(discount) as discount
        , sum(unit_price) as unit_price
        , sum(quantity) as quantity
    from {{ref('stg_fact')}}
    group by 
        order_id
        , sk_customers
        , sk_shippers
        , sk_products
        , sk_calendar  
)

select * from model