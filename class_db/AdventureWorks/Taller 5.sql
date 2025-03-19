/*1. What is the name of the product sub-category that represents the largest number of items in the 
Product Inventory? */
SELECT TOP 1 
sub.Name AS subCategoria, SUM(Quantity) as cantidad 
FROM Production.Product AS p 
JOIN Production.ProductInventory AS pi ON p.ProductID = pi.ProductID 
JOIN Production.ProductSubcategory AS sub on  p.ProductSubcategoryID = 
sub.ProductSubcategoryID 
GROUP BY sub.Name 
ORDER BY  SUM(Quantity) DESC; 

/*2. What is the name and ID of the Special Offer that represents the largest amount of sales in dollars for 
the company?*/ 
WITH respuesta_2 (ventas, oferta_id) AS( 
SELECT TOP 1 
SUM(LineTotal)AS ventas,spOffer.SpecialOfferID 
FROM Sales.SpecialOffer AS  spOffer 
JOIN Sales.SalesOrderDetail AS saOrder ON  spOffer.SpecialOfferID = saOrder.SpecialOfferID 
WHERE spOffer.SpecialOfferID != 1 
GROUP BY spOffer.SpecialOfferID 
ORDER BY SUM(LineTotal) DESC) 
SELECT ventas, oferta_id,sp.Description 
FROM respuesta_2 
JOIN Sales.SpecialOffer as sp on sp.SpecialOfferID = respuesta_2.oferta_id; 

/*3. Select the products that have a current price at least 2% higher than their historical average price, but 
do not include those products that have only one price in the historical prices table. */ 
WITH precio_promedio AS ( 
SELECT AVG(ListPrice) AS promedio 
FROM Production.ProductListPriceHistory 
) 
SELECT name, ListPrice 
FROM Production.Product 
WHERE ListPrice > (SELECT promedio FROM precio_promedio) * 1.2; 