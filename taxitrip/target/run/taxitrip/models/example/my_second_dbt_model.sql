

  create or replace view `data-fellowship12-421606`.`raw`.`my_second_dbt_model`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `data-fellowship12-421606`.`raw`.`my_first_dbt_model`
where id = 1;

