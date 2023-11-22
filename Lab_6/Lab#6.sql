1)Select cities.name, regions.name
From cities
Join regions on cities.region = regions.uuid
Where cities.population > 350000;

2)Select cities.name
From cities
Join regions on cities.region = regions.uuid
Where regions.name = 'Nord';


3) 

// Таблиця lines (Ця таблиця містить інформацію про різні лінії метро в місті)
CREATE TABLE lines (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) not null,
    city_name varchar(255) not null
);

//Таблиця stations (У цій таблиці містяться дані про різні станції метро в місті)
CREATE TABLE stations (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) not null,
    line_id int,
    prev_station_id INT DEFAULT NULL; //додав
    next_station_id INT DEFAULT NULL; //додав
    latitude decimal(10, 8),
    longitude decimal(11, 8),
    city_name varchar(255) not null,
    FOREIGN KEY (line_id) REFERENCES lines(id)
);



//Таблиця transfers призначена для зберігання інформації про пересадки між різними станціями
CREATE TABLE transfers( --додав
id INT PRIMARY KEY,
station_id_from INT DEFAULT NULL;
station_id_to INT DEFAULT NULL;
);





//Таблиця station_Connections (У цій таблиці містяться дані про з'єднання між різними станціями в місті)
CREATE TABLE station_connections (
    id int AUTO_INCREMENT PRIMARY KEY,
    station_id int,
    connected_station_id int,
    connection_type varchar(255),
    city_name varchar(255) not null,//Додано поле для city_name
    FOREIGN KEY (station_id) REFERENCES stations(id),
    FOREIGN KEY (connected_station_id) REFERENCES stations(id)
);

// Таблиця branches (Ця таблиця містить дані про гілки метро в місті)
CREATE TABLE branches (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) not null,
    line_id int,
    FOREIGN KEY (line_id) REFERENCES lines(id)
);


--Лінії визначають основні транспортні маршрути, пролягаючи через різні райони міста та створюючи каркас системи громадського транспорту,
 --що об'єднує різні частини міста. Гілки є додатковими маршрутами, відгалуженнями від основних ліній, і призначені для обслуговування
  --конкретних районів чи станцій, маючи свої власні характеристики, але зазвичай підпорядковані та пов'язані з основною лінією.