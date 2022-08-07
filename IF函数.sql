use sql_store;

select 
	p.product_id,
    p.name,
    COUNT(oi.product_id) as orders,
    IF(COUNT(oi.product_id) > 1, 'Many times', 'Once') AS frequency
from products p
join order_items oi using (product_id)
group by product_id, name -- GROUP BY是为了在count时做分类

     