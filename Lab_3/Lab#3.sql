1)SELECT name
FROM cities 
WHERE name LIKE '%ськ';

2)SELECT name
FROM cities 
WHERE name LIKE '%донец%';

3)SELECT CONCAT(name, ' (', region, ')') 
FROM cities
WHERE population > 100000
ORDER BY name ASC;

4)SELECT name, population, ((population / 40000000)*100)
from cities
Order by population Desc
Limit 10;

5)SELECT CONCAT(name, ' - ', ((population / 40000000) * 100), '%')
FROM cities
WHERE ((population / 40000000) * 100) >= 0.1
ORDER BY ((population / 40000000) * 100) ASC;