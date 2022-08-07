drop trigger if exists payments_after_insert; -- 新增记录
@DELIMITER $$
create trigger payments_after_insert
	after insert on payments
    for each row
begin
	update invoices
    set payment_total = payment_total + NEW.amount
	where invoice_id = NEW.invoice_id;
    
    insert into payments_audit
    values (NEW.client_id,NEW.date,NEW.amount,'Insert',NOW());
end$$
@DELIMITER ;

drop trigger if exists payments_after_delete; -- 删除记录

@DELIMITER $$

create trigger payments_after_delete
	after delete on payments
    for each row
begin
	update invoices
    set payment_total = payment_total - OLD.amount
	where invoice_id = OLD.invoice_id;
    
    insert into payments_audit
    values (OLD.client_id,OLD.date,OLD.amount,'Insert',NOW());
end$$
@DELIMITER ;
-- 操作语句
insert into payments
value (default,5,3,'2019-01-01',10,1);

delete
from payments
where payment_id = 10