/****** Select all the information about the clients who have purchased the product with ID=213 and whose Last Name contains ee (UNO SOLO POR PERSONA) ******/
SELECT DISTINCT c.*
FROM   customers c
       JOIN sales100k s
         ON s.customerid = c.customerid
WHERE  s.productid = 213
       AND c.lastname LIKE '%ee%';

/****** Count how many DIFFERENT products have been sold with prices between $20 and $100 ******/
SELECT Count(DISTINCT s.productid)
FROM   sales100k s
       JOIN products p
         ON s.productid = p.productid
WHERE  p.price BETWEEN 20 AND 100;

/****** Show the information about the employees that have sold more than 10 items of the same product on a single transaction (each represented by a row in the Sales table).
    Show the number of lines in your response ******/
SELECT DISTINCT e.*
FROM   employees e
       JOIN sales100k s
         ON e.employeeid = s.salespersonid
WHERE  s.quantity > 10;

/****** List all the customers that have purchased anything and count how many purchases they have made ******/
SELECT c.customerid,
       c.firstname,
       c.lastname,
       Count(s.salesid) AS comprasTotales
FROM   customers c
       JOIN sales100k s
         ON c.customerid = s.customerid
GROUP  BY c.customerid,
          c.firstname,
          c.lastname
ORDER  BY comprastotales DESC;

/****** Calculate the minimum price of products containing “Sport” in the name for all the products with a price different from zero. ******/
SELECT Min(p.price)
FROM   products p
WHERE  p.price != 0
       AND p.NAME LIKE '%Sport%'; 