SELECT 
   CENTROID_ID as number_cluster,
   sk_customers,
   product_name,
   total_value
FROM ML.PREDICT(MODEL {{ref ('stg_predict_cluster') }},
    (SELECT 
      sk_customers,
      product_name,
      sum(unit_price*quantity) as total_value
FROM {{ref('stg_fact')}}
group by 
sk_customers,
product_name
))