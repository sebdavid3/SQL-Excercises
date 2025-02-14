-- Find the list of all buildings that have employees
SELECT DISTINCT b.* FROM employees e join buildings b on b.building_name = building;

--Find the list of all buildings and their capacity
SELECT * FROM buildings;

--List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT b.building_name, e.role
FROM buildings b
LEFT JOIN Employees e ON b.building_name = e.building;
