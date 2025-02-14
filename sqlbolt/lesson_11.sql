-- Find the number of Artists in the studio (without a HAVING clause) ✓
SELECT role,
       Count(NAME)
FROM   employees
WHERE  role LIKE 'Artist'
GROUP  BY role;

--Find the number of Employees of each role in the studio ✓
SELECT role,
       Count(NAME)
FROM   employees
GROUP  BY role;

--Find the total number of years employed by all Engineers ✓
SELECT role,
       Sum(years_employed)
FROM   employees
GROUP  BY role
HAVING role = "engineer"; 