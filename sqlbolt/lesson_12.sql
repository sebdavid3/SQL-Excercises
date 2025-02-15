--Find the number of movies each director has directed ✓
SELECT director,
       Count(title) AS DirectedMovies
FROM   movies
GROUP  BY director;

-- Find the total domestic and international sales that can be attributed to each director ✓
SELECT m.director,
       Sum(b.domestic_sales + b.international_sales) AS totalSales
FROM   movies m
       JOIN boxoffice b
         ON b.movie_id = m.id
GROUP  BY director; 