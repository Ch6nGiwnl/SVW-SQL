use sql_hr;

select *
from employees
where salary > (select avg(salary)
from employees
)