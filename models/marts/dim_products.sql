with 
    categories as (
        select * from {{ ref('stg_categories') }}
    ),
    suppliers as (
        select * from {{ ref('stg_suppliers') }} 
    ),
    dim_products as (
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
    )

select * from dim_products