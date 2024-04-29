
  
    

    create or replace table `data-fellowship12-421606`.`raw`.`monthly_trip_distance_rate_code`
      
    
    

    OPTIONS()
    as (
      

SELECT 
    EXTRACT(YEAR FROM lpep_pickup_datetime) AS Year,
    EXTRACT(MONTH FROM lpep_pickup_datetime) AS Month,
    RatecodeID,
    SUM(trip_distance) AS MonthlyTripDistance
FROM 
    `data-fellowship12-421606`.`raw`.`taxi_tripdata`
GROUP BY 
    EXTRACT(YEAR FROM lpep_pickup_datetime),
    EXTRACT(MONTH FROM lpep_pickup_datetime),
    RatecodeID
ORDER BY 
    Year, Month, RatecodeID
    );
  