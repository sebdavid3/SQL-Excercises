-- List all the Canadian cities and their populations ✓
SELECT city,
       population
FROM   north_american_cities
WHERE  country = 'Canada';

--Order all the cities in the United States by their latitude from north to south ✓
SELECT city,
       population
FROM   north_american_cities
WHERE  country = 'United States'
ORDER  BY latitude DESC;

--List all the cities west of Chicago, ordered from west to east ✓
SELECT *
FROM   north_american_cities
WHERE  longitude < '-87.629798'
ORDER  BY longitude ASC;

--List the two largest cities in Mexico (by population) ✓
SELECT city
FROM   north_american_cities
WHERE  country = 'Mexico'
ORDER  BY population DESC
LIMIT  2;

--List the third and fourth largest cities (by population) in the United States and their population ✓
SELECT city
FROM   north_american_cities
WHERE  country = 'United States'
ORDER  BY population DESC
LIMIT  2 offset 2; 