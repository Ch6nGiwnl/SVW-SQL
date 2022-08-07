-- 查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩
use test;
select s_id, s_name, count(c_id) as '选课总数', sum(s_score) as '总成绩'
from score sc
join student st using(s_id)
group by sc.s_id;

select a.s_id, a.s_name, count(b.c_id), sum(b.s_score)
from student as a inner join score as b on a.s_id = b.s_id
group by a.s_id,a.s_name;