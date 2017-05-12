SELECT * FROM test.student;
set character_set_server=utf8;
set character_set_DATABASE=utf8;
set names utf8;

#3-1.把peoples表中school不是GDUFS的人全部找出来？（包括school为NULL的人）写出MySQL语句。
SELECT * from peoples where school not in (select * from peoples where school='GDUFS');
#3-2查找计算机系每次考试学生的平均成绩(最终显示学生姓名, 考试名称, 平均分)
SELECT avg(grade),exam_name,name
from exam,student
where exam.student_ID=student.ID
group by exam_name,name;
#3-3.查找女学霸（考试平均分达到80分或80分以上的女生的姓名, 分数）。

select name,avg(grade)
from exam,student
where exam.student_ID=student.ID
group by name
having avg(grade)>=80;

#3-4.找出人数最少的院系以及其年度预算。
select budget,department.dept_name as department_name
from department,student
where student.dept_name=department.dept_name
group by department_name having count(ID) <= all(select count(ID) from student group by dept_name);

#3-5.计算机系改名了，改成计算机科学系（comp. sci.），写出mysql语句。
update department set dept_name='comp. sci.' where dept_name='computer'; 
#update department set dept_name='computer' where dept_name='comp. sci.'; 
#3-6.修改每个系的年度预算，给该系的每个学生发2000元奖金。（修改每个系的年度预算为 原预算+该系人数*2000）。
update department inner join (select count(ID)as num,dept_name from student group by dept_name)b set budget=budget+b.num*200 where department.dept_name=b.dept_name ;
#3-7.向department表中插入一条数据, dept_name属性的值为avg_budget, building为空, 年度预算为所有院系的年度预算平均值.

insert into department SELECT 'avg_budget','',avg(budget) as num from department;

#3-8. 删除计算机系中考试成绩平均分低于70的学生.
delete from student
where dept_name='computer' and ID in(select a.ID 
									 from(select ID 
										  from student,exam 
                                          where student.ID=exam.student_ID and student.dept_name='computer'
                                          group by ID 
                                          having avg(grade)<70
                                          )a);


#3-9.找出所有正在谈恋爱,但是学习成绩不佳(考试平均分低于75)的学生,强制将其情感状态改为单身.
update student set emotion_state='single' 
where ID in(select a.ID from
			(select ID,avg(grade)from 
			student,exam
            where student.ID=exam.student_ID
            group by ID
            having avg(grade)<75)a);
#update student set emotion_state='single' where ID in(select a.ID from(select ID,avg(grade)from student,exam where student.ID=exam.student_ID group by ID having avg(grade)<75)a);

#3-10(选做). 对每个学生, 往exam表格中插入名为Avg_Exam的考试, 考试分数为之前学生参加过考试的平均分.
insert into exam select a.ID,'Avg_Exam',a.avg_grade from(select ID,avg(grade) as avg_grade from student,exam where exam.student_ID=student.ID group by ID )a;
