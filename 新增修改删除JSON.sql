use sql_store;
update products
set properties = '
{
	"dimensions": [1,2,3],
    "weight":10,
    "manufacturer":{"name":"sony"}
}
'
where product_id = 1;

-- another way
update products
set properties = JSON_OBJECT(
			'weight',10,
			'dimensions', json_array(1,2,3),
			'manufacturer',json_object('name','sony')
)
where product_id = 1;

-- 修改json
update products
set properties = JSON_set(
			properties,
			'$.weight', 20, -- 修改
			'$.age',10 -- 新增
)
where product_id = 1;
-- 删除json
update products
set properties = JSON_remove(
			properties,
			'$.age'
)
where product_id = 1;