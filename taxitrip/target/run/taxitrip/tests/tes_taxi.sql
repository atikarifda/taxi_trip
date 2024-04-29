select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      SELECT
  lpep_pickup_datetime, 
 COUNT (1) AS total_pickup
FROM
  `data-fellowship12-421606`.`raw`.`taxi_tripdata`
group by lpep_pickup_datetime
HAVING COUNT (1) > 3
      
    ) dbt_internal_test