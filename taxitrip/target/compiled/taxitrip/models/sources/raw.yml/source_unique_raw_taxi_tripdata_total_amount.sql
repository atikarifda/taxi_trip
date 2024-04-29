
    
    

with dbt_test__target as (

  select total_amount as unique_field
  from `data-fellowship12-421606`.`raw`.`taxi_tripdata`
  where total_amount is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


