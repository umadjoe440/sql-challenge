-- 1.  List the following details of each employee:
-- employee number, last name, first name, gender, and salary.
select emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
from emp.employees emp, emp.salaries sal
where emp.emp_no = sal.emp_no
limit 100;

-- 2.  List employees who were hired in 1986
select emp.emp_no, emp.last_name, emp.first_name, emp.hire_date
from emp.employees emp
where date_part('year', hire_date) = 1986
order by hire_date;

-- 3. List the manager of each department with the following information:
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

-- 4.  List the department of each employee with the following information:
-- employee number, last name, first name, and department name.


-- 5.  List all employees whose first name is "Hercules" and last names begin with "B."
select * from emp.employees
where first_name='Hercules'
and last_name like 'B%';

-- 6.  List all employees in the Sales department,
-- including their employee number, last name, first name, and department name.
select em.emp_no, em.last_name, em.first_name, dp.dept_name
from emp.department dp, emp.dept_manager dm, emp.employees em
where dm.dept_no = dp.dept_no
and dm.emp_no = em.emp_no
and dp.dept_name = 'Sales';

-- 7.  List all employees in the Sales and Development departments,
--     including their employee number, last name, first name,
--     and department name.
select em.emp_no, em.last_name, em.first_name, dp.dept_name
from emp.department dp, emp.dept_manager dm, emp.employees em
where dm.dept_no = dp.dept_no
and dm.emp_no = em.emp_no
and dp.dept_name in ('Sales', 'Development');


-- 8.  In descending order, list the frequency count of employee last names,
--     i.e., how many employees share each last name.
select em.last_name, count(*) from emp.employees em
group by em.last_name
order by 2 desc;
