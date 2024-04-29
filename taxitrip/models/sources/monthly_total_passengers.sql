{{ 
    config (
        materialized = "table"
        ) 
}}

SELECT 
    EXTRACT(YEAR FROM lpep_pickup_datetime) AS Year,
    EXTRACT(MONTH FROM lpep_pickup_datetime) AS Month,
    SUM(passenger_count) AS TotalPassengers
FROM  
    {{ ref('taxi_tripdata') }}
GROUP BY 
    EXTRACT(YEAR FROM lpep_pickup_datetime), EXTRACT(MONTH FROM lpep_pickup_datetime)
ORDER BY 
    Year, Month

