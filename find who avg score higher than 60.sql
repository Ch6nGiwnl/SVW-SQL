use test;

select s_id, s_name, avg(s_score)
from score
join student using (s_id)
group by s_id
having avg(s_score) >= 60;

select a.s_id, a.s_name, avg(s_score) as avg_score
from student as a inner join score as b on a.s_id = b.s_id
group by a.s_id,a.s_name
having avg(b.s_score) >= 60