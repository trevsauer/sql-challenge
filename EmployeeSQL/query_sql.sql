DROP TABLE employees;
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE titles;

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

SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM titles;
SELECT * FROM departments;


--List the following details of each employee: 
	--employee number, 
	--last name, 
	--first name, 
	--gender, 
	--and salary.
SELECT 
employ.emp_no, 
employ.first_name, 
employ.last_name, 
employ.gender, 
sal.salary
FROM salaries AS sal
INNER JOIN employees AS employ ON
employ.emp_no = sal.emp_no
--
--List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date  < '1986-12-31';

--List the manager of each department with the following information:
--department number, 
--department name, 
--the manager's employee number, 
--last name, 
--first name, 
--and start and end employment dates.

SELECT 
mang.dept_no, 
dept.dept_name, 
mang.emp_no, 
employ.first_name, 
employ.last_name, 
mang.from_date, 
mang.to_date
from departments dept
inner join dept_manager mang
on dept.dept_no = mang.dept_no
inner join employees employ 
on employ.emp_no = mang.emp_no;

--List the department of each employee with the following information: 
--employee number, 
--last name, 
--first name, 
--and department name.

SELECT 
d_emp.emp_no,
employ.first_name,
employ.last_name,
dept.dept_name
from departments dept
inner join dept_emp d_emp
on dept.dept_no = d_emp.dept_no
inner join employees employ
on employ.emp_no = d_emp.emp_no

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, 
last_name
FROM employees
WHERE first_name = 'Hercules' AND  last_name like 'B%';

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT 
d_emp.emp_no, 
employ.first_name, 
employ.last_name, 
dept.dept_name
from departments dept 
inner join dept_emp d_emp
on dept.dept_no = d_emp.dept_no
inner join employees employ
on employ.emp_no = d_emp.emp_no
where dept.dept_name = 'Sales'

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT 
d_emp.emp_no, 
employ.first_name, 
employ.last_name, 
dept.dept_name
from departments dept 
inner join dept_emp d_emp
on dept.dept_no = d_emp.dept_no
inner join employees employ
on employ.emp_no = d_emp.emp_no
where dept.dept_name in ('Sales', 'Development')

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

