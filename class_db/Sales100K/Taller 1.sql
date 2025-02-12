-- 1. Count the number of DISTINCT clients who have purchased products with prices greater than $150.

SELECT COUNT (DISTINCT s.CustomerID)
FROM Sales100k s
JOIN Products p ON s.ProductID = p.ProductID
WHERE p.Price > 150;

-- 2. Retrieve all information about clients who have purchased the product with ID=86 
--    and whose Last Name contains ‘Li’.

SELECT c.*
FROM Customers c
JOIN Sales100k s on s.CustomerID = c.CustomerID
WHERE s.ProductID=86 AND c.LastName LIKE '%Li%';

-- 3. Display information about employees who have sold more than 20 units of the same product 
--    in a single transaction (each transaction is represented by a row in the Sales table).

SELECT e.*
FROM Sales100k s
JOIN Employees e on e.EmployeeID = s.SalesPersonID 
WHERE s.Quantity >  20

-- 4. Compute the average price of products that contain “Hex Nut” in the name, 
--    considering only products with a price greater than zero.

SELECT AVG(p.Price)
FROM Products p
WHERE p.Name like '%Hex Nut%' and p.Price != 0

-- 5. List all customers who have made purchases and count the number of transactions they have completed.

SELECT 
  c.CustomerID, 
  c.FirstName, 
  c.LastName, 
  COUNT(s.SalesID) AS TotalPurchases
FROM Customers c
JOIN Sales100k s ON s.CustomerID = c.CustomerID
GROUP BY 
  c.CustomerID, 
  c.FirstName, 
  c.LastName;