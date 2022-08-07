use sql_store;
-- SELECT
 -- name,
--  unit_price,
 -- unit_price*1.1 AS 'new price'
--  FROM sql_store.products;

SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3