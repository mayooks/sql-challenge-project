--1. Making a query of employees hired in 1986 by selecting date range between 1986-12-31 and 1986-01-10
select * from employees
where hire_date <= '19861231'
and >= '19860101'
Order by hire_date DESC;
;
--2. Making a query of employees hired in 1986 by selecting date range between 1986-12-31 and 1986-01-10
select first_name, last_name, hire_date
from employees
where hire_date 
between '19860101' and '19861231'
Order by hire_date DESC;

-- 3. List the manager of each department with the following information: department number,
--    department name, the manager's employee number, last name, first name.


select d.dept_no, d.dept_name, g.emp_no, e.last_name, e.first_name
from departments as d
Right join dept_manager as g
on d.dept_no = g.dept_no
inner join employees as e 
on g.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name. As a new table is created

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
	
