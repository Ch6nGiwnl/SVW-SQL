use sql_invoicing;
drop procedure if exists get_payments;
@DELIMITER $$
-- -- 修改‘$$’替代‘;’为结尾分隔符
create procedure get_payments
(
para_client_id int,
para_payment_method_id tinyint -- recall int,占用4个字节 大数字，TINYINT占用1个字节的INT 数字0-255 
)
begin

		select * from payments p
        where p.client_id = IFNULL(para_client_id,p.client_id)
        AND p.payment_method=IFNULL(para_payment_method_id,p.payment_method);
        

end$$

@DELIMITER ; 
-- 修改回‘;’为结尾分隔符
