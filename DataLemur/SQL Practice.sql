/*
Your given a products table, which contains data about different Microsoft Azure cloud products.
*/
SELECT *
FROM   products

--Given the reviews table, write a query to retrieve all 3-star reviews using the SQL WHERE clause. Only display the user_id and stars columns.
SELECT user_id,
       stars
FROM   reviews
WHERE  stars = 3;

/*
the review should have 4 or more stars
the review ID is less than 6000
the review ID is more than 2000
the review can't come from user 142
*/
SELECT *
FROM   reviews
WHERE  stars >= 4
       AND review_id < 6000
       AND review_id > 2000
       AND user_id != 142;

/*
the start count is greater than 2, and less than or equal to 4
the review must come from either user 123, 265, or 362
*/
SELECT *
FROM   reviews
WHERE  stars > 2
       AND stars <= 4
       AND user_id = 123
        OR user_id = 265
        OR user_id = 362; 