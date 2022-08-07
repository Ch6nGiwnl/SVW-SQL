show triggers like'payments%'; -- 只查看与payments table相关的triggers

-- table_after_insert

drop trigger if exists payments_after_insert; -- 删除triggers
@DELIMITER $$
create trigger payments_after_insert
	after insert on payments
    for each row
begin
	update invoices
    set payment_total = payment_total + NEW.amount
	where invoice_id = NEW.invoice_id;
end$$
@DELIMITER ;