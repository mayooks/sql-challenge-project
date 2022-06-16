---Creating table for tiltles and inserting data 

Create table titles ( title_id varchar (30) primary key, 
					title varchar (30) unique
					 
ALTER TABLE titles
ALTER COLUMN title_id TYPE VARCHAR (200);

ALTER TABLE titles
ALTER COLUMN TITLE TYPE VARCHAR (200);

SELECT * FROM TITLES
);
insert into titles (title_id, title) values

('s0001','Staff'),
('s0002','Senior Staff'),
('e0001','Assistant Engineer'),
('e0002','Engineer'),
('e0003','Senior Engineer'),
('e0004','Technique Leader'),
('m0001','Manager');

Create table titles_practice ( title_id varchar (200) primary key, 
					title varchar (200) unique
);
select * from titles


-- creating table for employees that is linked to titles label


Create Table employees(emp_no INTEGER PRIMARY KEY, 
					   emp_title_id varchar(200) REFERENCES titles(title_id),
					   birth_date date not null,
					   first_name varchar(200),
					   last_name  varchar(200),
			           sex        VARCHAR(10) NOT NULL,
					   hire_date  date NOT NULL
);
select * from employees;

-- creating table for employee salaries that is linked to employees table

Create Table salaries(emp_no INTEGER PRIMARY KEY REFERENCES employees(emp_no),
					  salary integer not null);
select * from salaries;
					  
-- creating table for departments					  
					  
Create Table departments(dep_no VARCHAR (200) Primary Key,
						 dept_name VARCHAR (200) Unique
);

ALTER TABLE departments
RENAME COLUMN dep_no TO dept_no;

select * from departments;

-- creating table for department employess that is linked to departments	
Create Table dept_empt(
					  emp_no integer Not Null REFERENCES employees(emp_no),
					 dept_no VARCHAR (200) Not Null References departments(dept_no)
);
 --Altering dept_empt table inorder to insert primary key 
ALTER TABLE dept_empt
  ADD CONSTRAINT dept_empt_pk
    PRIMARY KEY (emp_no, dept_no);

-- Creating table of dept managers that managers that has a composite primary key that links to
-- departments and employees table


Create Table dept_manager(
	dept_no VARCHAR (200) Not Null References departments(dept_no),
	emp_no integer primary key Not Null REFERENCES employees(emp_no)
);


-- Making an inner join on the employees and salaries table
select * 
from employees
left join salaries  
ON employees.emp_no = salaries.emp_no
;
-- Making a query of employees hired in 1986 by selecting date range between 1986-12-31 and 1986-01-10
select * from employees
where hire_date <= '19861231'
and >= '19860101'
Order by hire_date DESC;
;
-- Making a query of employees hired in 1986 by selecting date range between 1986-12-31 and 1986-01-10
select first_name, last_name, hire_date
from employees
where hire_date 
between '19860101' and '19861231'
Order by hire_date DESC;

-- 3. List the manager of each department with the following information: department number,
--    department name, the manager's employee number, last name, first name.

select *
from departments
Right join dept_manager
on departments.dept_no = dept_manager.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no;


select d.dept_no, d.dept_name, g.emp_no, e.last_name, e.first_name
from departments as d
Right join dept_manager as g
on d.dept_no = g.dept_no
inner join employees as e 
on g.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name. As a new table (depart_employee_names) 
--	  is created

CREATE TABLE depart_employee_names as
select e.emp_no, e.last_name, e.first_name, dp.dept_name
from
employees as e
Inner Join
dept_empt  as dt
On
e.emp_no = dt.emp_no
right join
departments as dp
on dp.dept_no = dp.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and 
--   last names begin with "B."
select first_name, last_name, sex
from employees 
where First_name = 'Hercules' 
and last_name like 'B%'
;
-- 6. List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name.

select * from depart_employee_names
where dept_name = 'Sales' 
;
-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

select * from depart_employee_names
where dept_name = 'Sales' 
and dept_name = 'Development';

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) 
-- in descending order.
Select 
	last_name,
	Count(last_name) as employee_last_name
From 
	employees
Group By (last_name)

Order by employee_last_name Desc;
	
-- 10 
Select * from depart_employee_names;



select * from depart_employee_names;
select * from titles;
select * from dept_empt;

select * from departments;
select * from employees
where hire_date >= '19860101'
AND <= '19861231';
between 
Create Table dept_empp(
					  emp_no integer Not Null REFERENCES employees(emp_no) On Delete Cascade,
					 dept_no VARCHAR (200) Not Null References departments(dept_no) On Delete Cascade,
					 Constraint dept_emp Primary Key (emp_no, dept_no)
);

select * from dept_empp;





select * from dept_empt;;
select * from titles;
select * from employees;

Drop Table titles_practice;
ALTER TABLE dept_empt
  ADD CONSTRAINT dept_empt_pk
    PRIMARY KEY (emp_no, dept_no);
	
 select * from dept_empt;
 select * from employees;
select e.emp_no, e.emp_title_id, e.birth_date,e.sex
from employees as e
right join salaries as s  
ON e.emp_no = s.emp_no

CREATE TABLE employees_and_title_id as
select *
from employees
Right join titles
on employees.emp_title_id = titles.title_id;


select * From employees_and_title_id;