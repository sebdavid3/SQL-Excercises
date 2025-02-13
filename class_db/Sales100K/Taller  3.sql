-- Select all the information of the customers who have purchased more than 100 items 
-- of the same product in one transaction and show them ordered by the number of purchases(one purchase is one row) 
-- they have done that comply with the requested rule (the firstone in your list must be the customer with the greatest number of purchases
SELECT c.customerid,
       c.firstname,
       c.lastname,
       c.middleinitial,
       Count(s.salesid) AS ComprasTotales
FROM   customers c
       JOIN sales100k s
         ON s.customerid = c.customerid
WHERE  s.quantity > 100
GROUP  BY c.customerid,
          c.firstname,
          c.lastname,
          c.middleinitial
ORDER  BY comprastotales DESC;

-- Show the information from the product with the greatest number of sales to customers whose last names start with ‘A’
SELECT TOP 1 p.NAME,
             p.price,
             p.productid,
             Count(s.salesid) AS ventas
FROM   sales100k s
       JOIN products p
         ON p.productid = s.productid
       JOIN customers c
         ON c.customerid = s.customerid
WHERE  c.lastname LIKE 'A%'
GROUP  BY p.NAME,
          p.price,
          p.productid
ORDER  BY ventas;

-- Please select all the information about the least expensive product from 
-- the list of products the company has sold at least once
SELECT TOP 1 p.NAME,
             p.price,
             p.productid
FROM   products p
       JOIN sales100k s
         ON s.productid = p.productid
ORDER  BY P.price ASC;

-- Tell me all the information from the least selling salesman (in terms of dollars sold) so thatthe manager can fire him/her
SELECT TOP 1 e.employeeid,
             e.firstname,
             e.lastname,
             e.middleinitial,
             Sum(s.quantity * p.price) AS totalSalesDollars
FROM   sales100k s
       JOIN employees e
         ON e.employeeid = s.salespersonid
       JOIN products p
         ON p.productid = s.productid
GROUP  BY e.employeeid,
          e.firstname,
          e.lastname,
          e.middleinitial
ORDER  BY totalsalesdollars ASC; 