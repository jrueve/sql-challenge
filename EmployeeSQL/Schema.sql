-- Create employees table
CREATE TABLE employees (
	emp_no INTEGER primary key NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex CHAR(2) NOT NULL,
    hire_date DATE NOT NULL
	);

-- Create departments table
CREATE TABLE departments (
	dept_no VARCHAR(10) primary key NOT NULL,
	dept_name VARCHAR(50) NOT NULL
	);

-- Create titles table
CREATE TABLE titles (
	title_id VARCHAR primary key NOT NULL,
    title VARCHAR NOT NULL
	);

-- Create department employee table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

-- Create salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
	);

-- Create Department manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);
