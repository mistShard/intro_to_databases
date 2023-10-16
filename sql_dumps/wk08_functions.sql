USE magazine;

-- 1
SELECT magazineName, ROUND(magazinePrice * .97, 2) AS '3% off'
FROM magazine;

-- 2
SELECT subscriberKey, ROUND(DATEDIFF('2020-12-20', subscriptionStartDate)/365) AS 'Years since subscription'
FROM subscription;

-- 3
SELECT subscriptionStartDate, subscriptionLength, 
DATE_FORMAT(DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength MONTH), '%M %e, %Y') AS 'Subscription end'
FROM subscription;

-- 4
USE bike;

SELECT LEFT(product_name, LOCATE(' - ', product_name) - 1) AS 'Product Name without Year'
FROM product
ORDER BY product_id
LIMIT 14;

-- 5
SELECT product_name, CONCAT('$', FORMAT(list_price / 3, 2)) AS 'One of 3 payments'
FROM product
WHERE model_year = 2019;
