/*
Medium) Displays the year that generated the highest amount of revenue from invoices for the company. Note: 
Use Year() to extract the year from a date, and keep in mind that you cannot directly use the result of 
a function to group and order a query.  
*/

SELECT TOP 1 
YEAR(Sales.Invoices.InvoiceDate) as yearInvoice,   
SUM(Sales.InvoiceLines.UnitPrice * Sales.InvoiceLines.Quantity) as totalAmount  
FROM Sales.Invoices 
JOIN Sales.InvoiceLines ON Sales.InvoiceLines.InvoiceID = Sales.Invoices.InvoiceID 
GROUP BY YEAR(Sales.Invoices.InvoiceDate) 
ORDER BY totalAmount DESC; 

/*
Easy) Displays the customer information (CustomerID and CustomerName) for the customer with the 
highest total amount invoiced in dollars.
*/

SELECT TOP 1 Sales.Customers.CustomerID, 
Sales.Customers.CustomerName, 
SUM(Sales.InvoiceLines.UnitPrice * Sales.InvoiceLines.Quantity) as totalAmount 
FROM Sales.Customers 
JOIN Sales.Invoices on Sales.Invoices.CustomerID = Sales.Customers.CustomerID 
JOIN Sales.InvoiceLines on Sales.InvoiceLines.InvoiceID = Sales.Invoices.InvoiceID 
GROUP BY Sales.Customers.CustomerID, Sales.Customers.CustomerName 
ORDER BY totalAmount DESC; 

/*
Hard) An order has a BackorderID when some or all of the originally requested products were not available. 
For example, OrderID 1 has BackOrderID 48, where a new list of products was ordered. 
You need to check, among the new orders, which ones purchased fewer products than the original list. 
List the complete information for these orders (OrderID, total number of products ordered, and total order amount in dollars).
*/

SELECT  
    b.OrderID AS OrderID, 
    b.BackorderProducts AS TotalProducts, 
    b.BackorderTotal AS TotalDolar 
FROM  
    (SELECT  
        o.OrderID AS BackorderID, 
        COUNT(DISTINCT ol.StockItemID) AS BackorderProducts, 
        SUM(ol.Quantity * ol.UnitPrice) AS BackorderTotal 
    FROM Sales.Orders o 
    JOIN Sales.OrderLines ol ON o.OrderID = ol.OrderID 
    JOIN Sales.Orders bo ON bo.BackorderOrderID = o.OrderID 
    GROUP BY o.OrderID) b 
JOIN  
    (SELECT  
        bo.BackorderOrderID AS BackorderID, 
        COUNT(DISTINCT bol.StockItemID) AS OriginalProducts, 
        SUM(bol.Quantity * bol.UnitPrice) AS OriginalTotal 
    FROM Sales.Orders bo 
    JOIN Sales.OrderLines bol ON bo.OrderID = bol.OrderID 
    GROUP BY bo.BackorderOrderID) o  
ON b.BackorderID = o.BackorderID 
WHERE b.BackorderProducts < o.OriginalProducts;  

