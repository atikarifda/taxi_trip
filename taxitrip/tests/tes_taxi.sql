SELECT
  lpep_pickup_datetime, 
 COUNT (1) AS total_pickup
FROM
  {{ ref('taxi_tripdata') }}
group by lpep_pickup_datetime
HAVING COUNT (1) > 3