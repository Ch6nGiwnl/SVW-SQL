use sql_invoicing;

@DELIMITER $$
-- -- 修改‘$$’替代‘;’为结尾分隔符
create procedure get_clients()
begin
	select *
	from clients;
end$$

@DELIMITER ; 
-- 修改回‘;’为结尾分隔符
