with
    source_data as (
        select
            order_id
            , employee_id
            , customer_id
            , ship_via as shipper_id
            , order_date
            , ship_region
            , shipped_date
            , ship_country
            , ship_name
            , ship_postal_code
            , ship_city
            , freight
            , ship_address
            , required_date
            
        from {{source('northwind_erp','base_prod_orders')}}
    )

select *
from source_data
