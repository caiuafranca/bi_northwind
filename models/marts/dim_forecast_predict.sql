with predict as (

    SELECT
    *
    FROM
        ML.FORECAST(MODEL {{ref('stg_predict_forecast')}},
        STRUCT(180 AS horizon, 0.8 AS confidence_level))
)

Select * from predict