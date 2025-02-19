----1.  Show the information (name  id and last name) for the salesman that has sold the largest amount of dollars for products that cost more than $100 dollars. 
SELECT TOP 1 e.employeeid,
             e.firstname,
             e.lastname
FROM   employees e
       JOIN (SELECT s.salespersonid,
                    Sum(p.price * s.quantity) AS totalAmountOfDollars
             FROM   sales100k s
                    JOIN products p
                      ON s.productid = p.productid
             WHERE  p.price > 100
             GROUP  BY s.salespersonid) AS salesTotal
         ON e.employeeid = salesTotal.salespersonid
ORDER  BY salesTotal.totalamountofdollars DESC;

/*2.  Select all the information about the customers who have purchased more than 100 items of the same product in one transaction and show them ordered
    by the number of purchases (one purchase is one row) they have done that comply with 
    the requested rule (the first one in your list must be the customer with the greatest number of purchases).  */
SELECT c.*
FROM   customers c
       JOIN (SELECT s.customerid,
                    Count(*) AS numberPurchases
             FROM   sales100k s
             WHERE  s.quantity > 100
             GROUP  BY s.customerid) AS especialCustomers
         ON especialCustomers.customerid = c.customerid
ORDER  BY especialCustomers.numberpurchases DESC;

/* 3.  Show me the information on all the products that have been sold that have a price greater than the average price of the products on the database. */
SELECT DISTINCT p.*
FROM   products p
       JOIN sales100k s
         ON s.productid = p.productid
WHERE  p.price > (SELECT Avg(price) AS priceAverage
                  FROM   products);

/*4.  Tell me all the information about the customer who has purchased the largest amount of money (in terms of dollars purchased) so that the company can send them a gift. */
SELECT TOP 1 c.customerid,
             c.firstname,
             Sum(p.price * s.quantity) AS totalPurchased
FROM   customers c
       JOIN sales100k s
         ON c.customerid = s.customerid
       JOIN products p
         ON p.productid = s.productid
GROUP  BY c.customerid,
          c.firstname
ORDER  BY totalpurchased DESC; 
