USE magazine;

SELECT subscriberLastname Last_Name, subscriberFirstName First_Name,
subscriptionStartDate Sub_Began, DATE_FORMAT(NOW(), "%Y-%m-%d") Today,
magazineName Magazine_Name 
FROM subscriber sr
	JOIN subscription sn
		ON sr.subscriberKey = sn.subscriberKey
			JOIN magazine m
				ON sn.magazineKey = m.magazineKey
WHERE magazineName REGEXP 'ng in t'
ORDER BY Last_Name ;

USE v_art;
SELECT * FROM artist;
SELECT lname "Last Name", fname "First Name", title Title, keyword Keyword
FROM artist a
	JOIN artwork awk
	ON a.artist_id = awk.artist_id
		JOIN artwork_keyword a_k
		ON awk.artwork_id = a_k.artwork_id
			JOIN keyword kw
			ON a_k.keyword_id = kw.keyword_id
WHERE keyword = "water"
ORDER BY Title;






USE bike;

SELECT product_name, brand_name, category_name, list_price
FROM product 
	JOIN category
    USING(category_id)
		JOIN brand
        USING(brand_id);
        
SELECT first_name, last_name
FROM staff sf
	JOIN store st
    ON sf.store_id = st.store_id
WHERE store_name LIKE 'row%';


USE employees;
SELECT first_name, last_name, dept_name, CONCAT('$', FORMAT(salary, 0)) salary
FROM employees e
	JOIN dept_emp de
    ON e.emp_no = de.emp_no
    JOIN departments d
    ON de.dept_no = d.dept_no
    JOIN salaries s
    ON e.emp_no = s.emp_no;
    
USE bike;
SELECT product_name, order_date
FROM customer c
	JOIN cust_order co
    ON c.customer_id = co.customer_id
    JOIN cust_order_item coi
    ON co.cust_order_id = coi.cust_order_id
    JOIN product p
    ON coi.product_id = p.product_id
WHERE first_name OR last_name LIKE '%ald%';