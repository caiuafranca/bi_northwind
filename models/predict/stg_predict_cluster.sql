{{
    config(
        materialized = 'model',
        ml_config = {
            'model_type' : 'kmeans',
            'num_clusters': 5  
        }
    )
}}
with predict_recomendation as (
    SELECT 
        sk_customers,
        product_name,
        sum(unit_price*quantity) as value
    FROM {{ref('stg_fact')}}
    group by 
    sk_customers,
    product_name
)
SELECT * FROM predict_recomendation