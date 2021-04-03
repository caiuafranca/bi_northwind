{{
    config(
        materialized = 'model',
        ml_config = {
            'model_type' : 'ARIMA',
            'time_series_timestamp_col' : 'month',
            'time_series_data_col' : 'valor_vendas',
            'auto_arima' : True,
            'data_frequency' : 'AUTO_FREQUENCY'
        }
    )
}}
with 
    predict_forecast as (
        SELECT 
            order_date as month,
            sum(unit_price*quantity) valor_vendas
        FROM {{ ref('stg_fact') }}
        group by month
        order by month desc
    )
SELECT * FROM predict_forecast

