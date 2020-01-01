-- department table
create table emp.department (
	dept_no varchar(30) not null CONSTRAINT deptkey PRIMARY KEY,
	dept_name varchar (30)
);

--sample dept select
select * from emp.department;

--employees table
create table emp.employees (
	emp_no numeric not null CONSTRAINT empkey PRIMARY KEY,
    birth_date date not null,
    first_name varchar (100) not null,
    last_name varchar (100) not null,
    gender char(1) not null,
    hire_date date not null
);

--sample employees select
select * from emp.employees;

-- dept manager table
create table emp.dept_manager (
	dept_no varchar(30) not null references emp.department(dept_no),
	emp_no numeric not null references emp.employees(emp_no),
    from_date date not null,
    to_date date not null
);

--sample dept_manager select
select * from emp.dept_manager;

-- dept employee table
create table emp.dept_emp (
	emp_no numeric not null references emp.employees(emp_no),
    dept_no varchar(30) not null references emp.department(dept_no),
	from_date date not null,
    to_date date not null
);

--sample dept_manager select
select * from emp.dept_emp;

-- salaries table
create table emp.salaries (
	emp_no numeric not null references emp.employees(emp_no),
    salary numeric not null,
    from_date date not null,
    to_date date not null
);


-- titles table
create table emp.titles (
	emp_no numeric not null references emp.employees(emp_no),
    title varchar (60) not null,
    from_date date not null,
    to_date date not null
);
