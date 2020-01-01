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