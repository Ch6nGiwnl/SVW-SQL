use sql_invoicing;
drop procedure if exists get_clients_by_state;
@DELIMITER $$
-- -- 修改‘$$’替代‘;’为结尾分隔符
create procedure get_clients_by_state
(
para_state CHAR(2)
)-- recall CHAR(2)代表2位的字符，VARCHAR自动识别长度的CHAR
begin

		select * from clients c
        where c.state = IFNULL(para_state,c.state); -- para_state位null 返回c.state c.state=c.state

end$$

@DELIMITER ; 
-- 修改回‘;’为结尾分隔符
