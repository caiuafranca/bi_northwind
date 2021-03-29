with 
    employees as (
        select
            employee_id
            ,country 	             	
            ,city 	             	
            ,postal_code 	     	
            ,hire_date 	      	 	
            ,extension 	         	
            ,address 	         	
            ,birth_date 	         	
            ,region 	             	
            ,photo_path 	         	
            ,last_name 	 	     	
            ,first_name 	         	
            ,title 	             		
            ,title_of_courtesy 	 	
            ,notes  	
            ,home_phone 	         	
            ,reports_to 	         		 	
            ,_sdc_table_version 
            ,_sdc_sequence 	     	
            ,_sdc_received_at  	    	
            ,_sdc_batched_at 		
            ,_sdc_extracted_at as last_etl_run
        from {{ source('northwind_erp','base_prod_employees') }}
    )

select * from employees