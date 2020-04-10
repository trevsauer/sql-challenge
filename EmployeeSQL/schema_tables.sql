--DROP TABLE employees;
--DROP TABLE departments;
--DROP TABLE dept_emp;
--DROP TABLE dept_manager;
--DROP TABLE salaries;
--DROP TABLE titles;

-------------------------------------------------
CREATE TABLE employees (
	emp_no int,
	birth_date date,
	first_name varchar(24),
	last_name varchar(24),
	gender varchar(8),
	hire_date date,
PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_emp (
	emp_no int,
	dept_no varchar(10),
	from_date date,
	to_date date,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_manager (
	dept_no varchar(10),
	emp_no int,
	from_date date,
	to_date date,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE titles (
	emp_no int,
	title varchar(30),
	from_date date,
	to_date date,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE departments (
	dept_no varchar(10),
	dept_name varchar(20),
PRIMARY KEY (dept_no)
);
