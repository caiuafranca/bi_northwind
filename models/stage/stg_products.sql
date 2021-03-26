with 
    products as (
        select
            product_id
            ,category_id
            ,supplier_id           
            ,units_in_stock 			    	
            ,unit_price 	   			
            ,product_name 	    	
            ,quantity_per_unit 					    	
            ,units_on_order 		
            ,
            case
                when discontinued = 1 then True
                else False
            end as is_discontinued
            ,reorder_level
            ,_sdc_table_version 
            ,_sdc_sequence 	     	
            ,_sdc_received_at  	    	
            ,_sdc_batched_at 		
            ,_sdc_extracted_at as last_etl_run
        from {{ source('northwind_erp','base_prod_products') }}
    )

select * from products