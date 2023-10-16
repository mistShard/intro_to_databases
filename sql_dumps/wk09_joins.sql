USE v_art;

-- Query 01
SELECT artfile FROM artwork
WHERE period = "Impressionism";

-- Query 02
SELECT artfile FROM artwork a
	JOIN artwork_keyword ak
    ON a.artwork_id = ak.artwork_id
    JOIN keyword k
    ON ak.keyword_id = k.keyword_id
WHERE keyword = "flowers";

-- Query 03
SELECT fname, lname, title
FROM artist a
	LEFT JOIN artwork aw
    ON a.artist_id = aw.artist_id;
    
-- Query 04
USE magazine;

SELECT magazineName mn, subscriberLastName, subscriberFirstName
FROM subscription sn
	JOIN magazine m
    ON sn.magazineKey = m.magazineKey
    JOIN subscriber s
    ON sn.subscriberKey = s.subscriberKey
    ORDER BY mn;
    
-- Query 05
SELECT magazineName
FROM subscription sn
	JOIN magazine m
    ON sn.magazineKey = m.magazineKey
    JOIN subscriber s
    ON sn.subscriberKey = s.subscriberKey
    WHERE subscriberFirstName = "Samantha" AND subscriberLastName = "Sanders";
    
-- Query 06
USE employees;

SELECT first_name, last_name ln
FROM employees e
	JOIN dept_emp de
    ON e.emp_no = de.emp_no
    JOIN departments d
    ON de.dept_no = d.dept_no
WHERE dept_name LIKE "Customer Service%"
ORDER BY ln
LIMIT 5;

-- Query 07
SELECT first_name, last_name, dept_name, CONCAT("$", FORMAT(salary, 0)) salary, s.from_date
FROM employees e
	JOIN dept_emp de
    ON e.emp_no = de.emp_no
    JOIN departments d
    ON de.dept_no = d.dept_no
    JOIN salaries s
    ON e.emp_no = s.emp_no
WHERE first_name = "Berni" AND last_name = "Genin"
ORDER BY s.from_date DESC
LIMIT 1;