use sql_store;

select distinct customer_id, first_name, last_name
from customers
where customer_id in (select customer_id
from orders
where order_id in (select order_id
from order_items
where product_id=3)
);

select distinct customer_id, first_name, last_name
from customers
where customer_id in (
select o.customer_id
from orders o
left join order_items oi using (order_id)
where product_id=3);

select distinct customer_id, first_name, last_name
from customers c
join orders o using(customer_id)
join order_items oi using(order_id)
where oi.product_id = 3