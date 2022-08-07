CREATE DEFINER=`root`@`localhost` PROCEDURE `make_payment`(
invoice_id int,
payment_amount decimal(9,2), -- 第一个参数代表位数，第二个参数代表小数点后的位数
payment_date date
)
BEGIN
	if payment_amount <= 0 then
		signal SQLSTATE '22003'set message_text = 'Invalid_payment_amount';
	end if;
	update invoices i
	set
		i.payment_total = payment_amount,
        i.payment_date = payment_date
	where i.invoice_id = invoice_id;

END