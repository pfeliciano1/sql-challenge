DROP TABLE dept_manager;

-- Create table for departments
CREATE TABLE departments (
	dept_no VARCHAR(10),
	dept_name VARCHAR(30),
	PRIMARY KEY (dept_no)
);

-- Query all fields from the table
SELECT * FROM departments;

-- Create table for dept_emp
CREATE TABLE dept_emp (
	emp_no VARCHAR(10),
	dept_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Query all fields from the table
SELECT * FROM dept_emp;

-- Create table for dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR(10),
	emp_no VARCHAR(10),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

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
	hire_date DATE,
	PRIMARY KEY (emp_no)
);

-- Query all fields from the table
SELECT * FROM employees;

-- Create table for salaries
CREATE TABLE salaries (
	emp_no VARCHAR(10),
	salary INT,
	PRIMARY KEY (emp_no)
);

-- Query all fields from the table
SELECT * FROM salaries;

-- Create table for titles
CREATE TABLE titles (
	title_id VARCHAR(10),
	title VARCHAR(30),
	PRIMARY KEY (title_id)
);

-- Query all fields from the table
SELECT * FROM titles;

