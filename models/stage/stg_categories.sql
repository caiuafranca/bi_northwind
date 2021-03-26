with 
    categories as (
        select
            category_id
            ,category_name 	 	 	 		
            ,description 	 	
            ,_sdc_table_version 
            ,_sdc_sequence 	     	
            ,_sdc_received_at  	    	
            ,_sdc_batched_at 		
            ,_sdc_extracted_at as last_etl_run
        from {{ source('northwind_erp','base_prod_categories') }}
    )

select * from categories