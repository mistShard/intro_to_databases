USE bike;

-- Query 01
SELECT ROUND(AVG(quantity))
FROM stock;

-- Query 02
SELECT product_name
FROM product p
	JOIN stock s
	ON p.product_id = s.product_id
GROUP BY product_name, quantity
HAVING quantity = 0
ORDER BY product_name;

-- Query 03
SELECT category_name, COUNT(DISTINCT product_name) instock
FROM category c
	JOIN product p
		ON c.category_id = p.category_id
	JOIN stock sk
		ON p.product_id = sk.product_id
	JOIN store s
		ON sk.store_id = s.store_id
WHERE store_name = "Baldwin Bikes"
GROUP BY category_name
ORDER BY instock;

-- Query 04
USE employees;

SELECT COUNT(emp_no) 'Number of Employees'
FROM employees;

-- Query 05
SELECT dept_name, CONCAT('$', FORMAT(AVG(salary), 2)) average_salary
FROM salaries s
	JOIN dept_emp de
		ON s.emp_no = de.emp_no
	JOIN departments d
		ON de.dept_no = d.dept_no
GROUP BY dept_name
HAVING AVG(salary) < 60000;

-- Query 06
SELECT dept_name, COUNT(gender) 'Number of Females'
FROM employees e
	JOIN dept_emp de
		ON e.emp_no = de.emp_no
	JOIN departments d
		ON de.dept_no = d.dept_no
WHERE gender REGEXP 'f'
GROUP BY dept_name
ORDER BY dept_name;