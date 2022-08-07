use sql_store;
select
c.customer_id,
c.first_name,
c.last_name,
sum(oi.quantity*oi.unit_price) as total_sales,
count(*) as order_times
from orders o
join customers c using (customer_id)
join order_items oi using (order_id)
where c.state = 'VA'
group by c.customer_id, first_name, last_name
having total_sales > 100