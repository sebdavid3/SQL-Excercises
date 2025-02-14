-- List all movies and their combined sales in millions of dollars ✓
SELECT *, (domestic_sales + international_sales)/1000000 as millions  FROM movies m join boxoffice b on b.movie_id = m.id;

-- List all movies and their ratings in percent ✓
SELECT m.*, (b.rating * 10) as ratePercent  FROM movies m join boxoffice b on b.movie_id = m.id;

-- List all movies that were released on even number years ✓
SELECT m.* FROM movies m where (select m.year%2) = 0