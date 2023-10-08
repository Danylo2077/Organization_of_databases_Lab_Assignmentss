1)SELECT regions.name AS region_name, SUM(cities.population) AS total_population
FROM regions
LEFT JOIN cities ON regions.uuid = cities.region
GROUP BY regions.name;

2)SELECT regions.name AS region_name, SUM(cities.population) AS total_population
FROM regions
LEFT JOIN cities ON regions.uuid = cities.region
GROUP BY regions.name
HAVING COUNT(cities.id) >= 10;

