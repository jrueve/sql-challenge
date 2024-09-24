/*List the employee number, last name, first name, sex, and salary of each employee.*/
SELECT e.emp_no, e.last_name, e.first_name, e.sex, salary
FROM employees as e
LEFT JOIN salaries
ON e.emp_no = salaries.emp_no
ORDER BY emp_no;

/*List the first name, last name, and hire date for the employees who were hired in 1986.*/
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

/*List the manager of each department along with their department number, department name, employee number, last name, and first name.*/
SELECT	d.dept_no, dep.dept_name, d.emp_no, e.last_name, e.first_name
FROM dept_manager as d
LEFT JOIN departments as dep ON d.dept_no = dep.dept_no
LEFT JOIN employees as e ON d.emp_no = e.emp_no
ORDER BY emp_no;

/*List the department number for each employee along with that employee’s employee number, last name, first name, and department name.*/
SELECT de.emp_no, de.dept_no, e.last_name, e.first_name, dep.dept_name
FROM dept_emp as de
LEFT JOIN departments as dep ON de.dept_no = dep.dept_no
LEFT JOIN employees as e ON de.emp_no = e.emp_no
ORDER BY emp_no;

/*List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.*/
SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE first_name = 'Hercules'
AND last_name Like 'B%';

/*List each employee in the Sales department, including their employee number, last name, and first name.*/
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no
FROM employees as e
LEFT JOIN dept_emp as de ON e.emp_no = de.emp_no
RIGHT JOIN departments as dep ON dep.dept_no = de.dept_no
WHERE dep.dept_name='Sales';

/*List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.*/
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, dep.dept_name
FROM employees as e
LEFT JOIN dept_emp as de ON e.emp_no = de.emp_no
RIGHT JOIN departments as dep ON dep.dept_no = de.dept_no
WHERE dep.dept_name='Sales'
OR dep.dept_name = 'Development';

/*List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).*/
SELECT last_name, 
COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

