with cte as (
  select customer_number, count(*) as num_of_orders
  from Orders
  group by customer_number
  order by num_of_orders desc
  limit 1
)
select customer_number
from cte
