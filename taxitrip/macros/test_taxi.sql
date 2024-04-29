{% macro test_taxi(distance_in_miles, rate_per_mile, additional_charges) %}
    {{ distance_in_miles * rate_per_mile + additional_charges }}
{% endmacro %}

{{ 
    config (
        materialized = "table"
        ) 
}}

SELECT 
    EXTRACT(YEAR FROM lpep_pickup_datetime) AS Year,
    EXTRACT(MONTH FROM lpep_pickup_datetime) AS Month,
    SUM(passenger_count) AS TotalPassengers,
    {% test_taxi(distance_in_miles, rate_per_mile, additional_charges) %} AS TotalFare
FROM  
    {{ ref('taxi_tripdata') }}
GROUP BY 
    EXTRACT(YEAR FROM lpep_pickup_datetime), EXTRACT(MONTH FROM lpep_pickup_datetime)
ORDER BY 
    Year, Month
