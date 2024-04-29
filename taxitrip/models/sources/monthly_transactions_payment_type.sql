{{ 
    config (
        materialized = "table"
        ) 
}}

SELECT 
    EXTRACT(YEAR FROM lpep_pickup_datetime) AS Year,
    EXTRACT(MONTH FROM lpep_pickup_datetime) AS Month,
    payment_type,
    COUNT(*) AS MonthlyTransactions
FROM 
    {{ ref('taxi_tripdata') }}
GROUP BY 
    EXTRACT(YEAR FROM lpep_pickup_datetime),
    EXTRACT(MONTH FROM lpep_pickup_datetime),
    payment_type
ORDER BY 
    Year, Month, payment_type
