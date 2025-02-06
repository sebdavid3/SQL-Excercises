SELECT COUNT (DISTINCT s.CustomerID)
FROM Sales100k s
JOIN Products p ON s.ProductID = p.ProductID
WHERE p.Price > 150;

SELECT c.*
FROM Customers c
JOIN Sales100k s on s.CustomerID = c.CustomerID
WHERE s.ProductID=86 AND c.LastName LIKE '%Li%';

SELECT e.*
FROM Sales100k s
JOIN Employees e on e.EmployeeID = s.SalesPersonID 
WHERE s.Quantity >  20

SELECT AVG(p.Price)
FROM Products p
WHERE p.Name like '%Hex Nut%' and p.Price != 0

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
  c.LastName; -- Include all non-aggregated columns in GROUP BY