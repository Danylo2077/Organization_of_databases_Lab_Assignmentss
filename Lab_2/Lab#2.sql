1)Select name, population
from cities
Where population >= 1000000;

2)Select name, population, region
from cities
Where region in ('E','W')
Order by population  Desc;

3)Select name, region, population
from cities
Where population > 50000 and region in ('S','C','N');

4)Select name, region, population
from cities
Where population > 150000 and population <= 350000 and region in ('E','W','N')
Order by name
Limit 20;

5)Select name, region, population
from cities
Where region not in ('E','W')
Order by population Desc
Limit 10 Offset 10;