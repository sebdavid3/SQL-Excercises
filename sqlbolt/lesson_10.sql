--Find the longest time that an employee has been at the studio ✓
SELECT Max(years_employed)
FROM   employees;

--For each role, find the average number of years employed by employees in that role ✓
SELECT role,
       Avg(years_employed) AS avarageYearsEmployed
FROM   employees
GROUP  BY role;

-- Find the total number of employee years worked in each building ✓
SELECT building,
       Sum(years_employed) AS avarageYearsEmployed
FROM   employees
GROUP  BY building; 