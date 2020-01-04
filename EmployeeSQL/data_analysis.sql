-- List the following details of each employee:
-- employee number, last name, first name, gender, and salary.
select emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
from emp.employees emp, emp.salaries sal
where emp.emp_no = sal.emp_no
limit 100;

--List employees who were hired in 1986
select emp.emp_no, emp.last_name, emp.first_name, emp.hire_date
from emp.employees emp
where date_part('year', hire_date) = 1986
order by hire_date;

--List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name,
--and start and end employment dates.
select dm.deptno, dp.dept_name, dm.emp_no
from emp.department dp, emp.dept_manager dm
where dm.dept_no = dp.dept_no
order by dp.dept_no;
--v2
select dm.dept_no, dp.dept_name, dm.emp_no, em.last_name, em.first_name
from emp.department dp, emp.dept_manager dm, emp.employees em
where dm.dept_no = dp.dept_no
and dp.emp_no = em.emp_no
and dm.from_date =
(select max(from_date) from emp.dept_manager dm1 where dm.dept_no = dm1.dept_no)
order by dp.dept_no;  
--v3
select dm.dept_no, dp.dept_name, dm.emp_no, em.last_name, em.first_name, dm.from_date, dm.to_date
from emp.department dp, emp.dept_manager dm, emp.employees em
where dm.dept_no = dp.dept_no
and dm.emp_no = em.emp_no
and dm.from_date =
(select max(from_date) from emp.dept_manager dm1 where dm.dept_no = dm1.dept_no)
order by dp.dept_no;  
