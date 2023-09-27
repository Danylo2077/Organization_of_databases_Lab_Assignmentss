1)SELECT UPPER(name) AS name_upcase
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5;

2)SELECT name, CHAR_LENGTH(name) AS name_length
FROM cities
WHERE CHAR_LENGTH(name) NOT IN (8, 9, 10);

3)SELECT region, SUM(population) AS total_population
FROM cities
WHERE region IN ('C', 'S')
GROUP BY region;

4)SELECT AVG(population) AS average_population
FROM cities
WHERE region = 'W';

5)SELECT region, COUNT(name) AS city_count
FROM cities
WHERE region = 'E';