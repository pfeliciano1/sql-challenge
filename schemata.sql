-- Create table for departments
CREATE TABLE departments (
	dept_no VARCHAR(10),
	dept_name VARCHAR(30)
)

-- Query all fields from the table
SELECT * FROM departments;

-- Create table for dept_emp
CREATE TABLE dept_emp (
	emp_no VARCHAR(10),
	dept_no VARCHAR(10)
)

-- Query all fields from the table
SELECT * FROM dept_emp;

-- Create table for dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR(10),
	emp_no VARCHAR(10)
)

-- Query all fields from the table
SELECT * FROM dept_manager;

-- Create table for employees
CREATE TABLE employees (
	emp_no VARCHAR(10),
	emp_title_id VARCHAR(30),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(10),
	hire_date DATE
)

-- Query all fields from the table
SELECT * FROM employees;

-- Create table for salaries
CREATE TABLE salaries (
	emp_no VARCHAR(10),
	salary INT
)

-- Query all fields from the table
SELECT * FROM salaries;

-- Create table for titles
CREATE TABLE titles (
	title_id VARCHAR(10),
	title VARCHAR(30)
)

-- Query all fields from the table
SELECT * FROM titles;

-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
-- Perform an INNER JOIN on the two tables
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name,
employees.last_name,
employees.hire_date
FROM employees
WHERE employees.hire_date > '1985-12-31'
AND employees.hire_date < '1987-01-01'
ORDER BY emp_no;

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no,
departments.dept_name,
dept_manager.emp_no,
employees.last_name,
employees.first_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no;

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- Select count of employees last names in descending order
SELECT last_name, COUNT(last_name) AS "Employee count"
FROM employees
GROUP BY last_name
ORDER BY "Employee count" DESC;

