-- 查询"李"姓老师的数量
use test;
select t_id, t_name
from teacher
where t_name REGEXP '^李'