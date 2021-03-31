with 
    employees as(select * from {{ref('stg_employees')}}),
    customers as(select * from {{ref('stg_customers')}}),
    shippers as(select * from {{ref('stg_shippers')}}),
    categories as (select * from {{ ref('stg_categories') }}),
    suppliers as ( select * from {{ ref('stg_suppliers') }}),
    products as (
        select
            products.product_id               			
            ,products.product_name 	            	
            ,products.is_discontinued
            ,categories.category_name 	 	 	 		
            ,categories.description
            ,suppliers.company_name
            ,suppliers.region     		
        from {{ ref('stg_products') }} as products
        left join categories on categories.category_id = products.category_id
        left join suppliers on suppliers.supplier_id = products.supplier_id 
    ),
    stg_fact as (
        select
            ordem.order_id
            ,{{ dbt_utils.surrogate_key('employees.employee_id', 'employees.first_name', 
            'employees.last_name','employees.title') }} as sk_employees        
            , employees.employee_id
            , employees.first_name
            , employees.last_name
            , employees.title
            ,{{ dbt_utils.surrogate_key('customers.customer_id', 'customers.company_name',
            'customers.contact_name') }} as sk_customers
            , customers.customer_id
            , customers.company_name as company_name_customers
            , customers.contact_name
            ,{{ dbt_utils.surrogate_key('shippers.shipper_id',
                'shippers.company_name') }} as sk_shippers
            , shippers.shipper_id
            , shippers.company_name
            , ordem.ship_region
            , ordem.shipped_date
            , ordem.ship_country
            , ordem.ship_name
            , ordem.ship_postal_code
            , ordem.ship_city
            , ordem.ship_address
            ,{{ dbt_utils.surrogate_key('products.product_id', 'products.product_name') }} as sk_products
            , products.product_id
            , products.product_name 
            ,{{ dbt_utils.surrogate_key('ordem.order_date') }} as sk_calendar            
            , ordem.order_date
            , ordem.freight
            , ordem.required_date            
            , stg_order_detail.discount
            , stg_order_detail.unit_price
            , stg_order_detail.quantity
        from {{ ref('stg_orders') }} as ordem
        inner join {{ ref('stg_order_detail') }} 
        on ordem.order_id = stg_order_detail.order_id
        left join employees on employees.employee_id = ordem.employee_id
        left join customers on customers.customer_id = ordem.customer_id
        left join shippers on shippers.shipper_id = ordem.shipper_id
        left join products on products.product_id = stg_order_detail.product_id
    )

select * from stg_fact