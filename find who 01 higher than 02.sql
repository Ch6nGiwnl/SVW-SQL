use test;

-- 查询"01"课程比"02"课程成绩高的学生的信息及课程分数
select s1.s_id,st.s_name,st.s_birth,st.s_sex,s1.s_score as '01',s2.s_score as '02'
from score s1
join score s2 using (s_id)
join student st using(s_id)
where s1.c_id='01' and s2.c_id='02' and s1.s_score > s2.s_score
order by s1.s_id;

select a.*, b.s_score as 01_score, c.s_score as 02_score
from Student as a inner join Score as b on a.s_id = b.s_id and b.c_id = '01'
inner join Score as c on a.s_id = c.s_id and c.c_id = '02' 
where b.s_score > c.s_score;