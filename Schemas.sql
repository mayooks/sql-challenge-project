---Creating table for tiltles and inserting data 

Create table titles
					 
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
--