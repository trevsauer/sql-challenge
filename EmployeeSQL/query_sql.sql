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
--Select and groupby last name column, run count on each last name
SELECT last_name,
COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY employees.count DESC;
