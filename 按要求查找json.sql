-- 提取json数据

use sql_store;
select product_id, JSON_EXTRACT(properties,'$.weight') as weight
from products
where product_id = 1;
-- another way
use sql_store;
select product_id, properties -> '$.dimensions[1]' as dimensions
from products
where product_id = 1;
-- find json in json
use sql_store;
select product_id, properties ->> '$.manufacturer.name' as manufacturer
from products
where properties ->> '$.manufacturer.name' = 'sony';