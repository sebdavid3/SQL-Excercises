-- Find the name and role of all employees who have not been assigned to a building
SELECT name, role, building FROM employees e Where building is NULL;

-- Find the names of the buildings that hold no employees
SELECT b.building_name
FROM buildings b
LEFT JOIN Employees e ON b.building_id = e.building_id
WHERE e.building_id IS NULL;