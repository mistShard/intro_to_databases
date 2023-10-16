USE world;

SELECT Name, Population FROM country
WHERE population < 5000000
ORDER BY population DESC;

SELECT DISTINCT Language
FROM countrylanguage
ORDER BY Language ASC;

SELECT Continent, COUNT(Name) Total_Countries
FROM Country
GROUP BY continent;

SELECT co.Name, AVG(ci.Population) Avg_Population_of_Cities, SUM(ci.Population), COUNT(ci.Name)
FROM Country co
JOIN city ci
	ON co.Code = ci.CountryCode
GROUP BY co.Name
ORDER BY Avg_Population_of_Cities DESC;