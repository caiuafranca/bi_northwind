with 
    model as (
        select distinct
            sk_products              			
            ,product_name 	            	
            ,product_id  		
        from {{ ref('stg_fact') }}
        where sk_products is not null
    )

select * from model