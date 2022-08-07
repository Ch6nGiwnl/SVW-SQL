use sql_invoicing;
select 
max(invoice_total) as highest,
min(invoice_total) as lowest, 
avg(invoice_total) as average,
sum(invoice_total) as total,
count(invoice_total) as number_of_invoices,
count(payment_date) as count_of_payments,
count(*)as total_records
from invoices
where invoice_date > '2019-07-01';

use sql_invoicing;
select  'First half of 2019' as date_range,
		sum(invoice_total) as total_sales,
		sum(payment_total) as total_payments,
        sum(invoice_total)-sum(payment_total) as what_we_expect
from invoices
where invoice_date between '2019-01-01' AND '2019-06-30'
union
select  'Second half of 2019' as date_range,
		sum(invoice_total) as total_sales,
		sum(payment_total) as total_payments,
        sum(invoice_total)-sum(payment_total) as what_we_expect
from invoices
where invoice_date between '2019-06-30' AND '2019-12-31'
union
select  'Total' as date_range,
		sum(invoice_total) as total_sales,
		sum(payment_total) as total_payments,
        sum(invoice_total)-sum(payment_total) as what_we_expect
from invoices
where invoice_date between '2019-01-01' AND '2019-12-31'