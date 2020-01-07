select de.emp_no, em.last_name, em.first_name, de.dept_no, dp.dept_name
from emp.department dp, emp.dept_emp de, emp.employees em
where de.dept_no = dp.dept_no
and de.emp_no = em.emp_no
and em.last_name='Maliniak'
and de.from_date =
(select max(de1.from_date) from emp.dept_emp de1 where de1.emp_no= de.emp_no and de1.dept_no = de.dept_no)
order by de.emp_no limit 10;
