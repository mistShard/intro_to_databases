USE datawinter;

SELECT * FROM student
ORDER BY lname;

SELECT lname, fname, major FROM student
WHERE major = 'CIT' and worry_category = 'family'
ORDER BY lname;