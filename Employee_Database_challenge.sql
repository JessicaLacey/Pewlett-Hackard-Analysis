SELECT * FROM employees;
SELECT * FROM titles

-- Retrieve data
SELECT emp_no, first_name, last_name, birth_date
FROM employees

SELECT title, from_date, to_date
FROM titles

-- Create new table for retirement titles
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date,
	employees.birth_date
INTO retirement_titles
FROM titles
INNER JOIN employees
ON titles.emp_no = employees.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(unique_titles.title)
FROM unique_titles

SELECT COUNT(unique_titles.title), unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY count DESC;

SELECT * FROM retiring_titles;