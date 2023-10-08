3)SELECT cities.name AS city_name, cities.population
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE regions.area_quantity >= 5
ORDER BY cities.population DESC
LIMIT 5 OFFSET 10;

4)SELECT regions.name AS region_name, COALESCE(sub.total_population, 0) AS total_population
FROM regions
LEFT JOIN (
  SELECT cities.region, SUM(CASE WHEN cities.population > 300000 THEN cities.population ELSE 0 END) AS total_population
  FROM cities
  GROUP BY cities.region
) AS sub ON regions.uuid = sub.region;


5)SELECT cities.name AS city_name, cities.population
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE regions.area_quantity <= 5
AND cities.name IN (
  SELECT cities.name
  FROM cities
  WHERE cities.population NOT BETWEEN 150000 AND 500000
);
