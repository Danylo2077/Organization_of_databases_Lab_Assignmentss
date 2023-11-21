1)Select cities.name, regions.name
From cities
Join regions on cities.region = regions.uuid
Where cities.population > 350000;

2)Select cities.name
From cities
Join regions on cities.region = regions.uuid
Where regions.name = 'Nord';


3) //Прибрав таблицю Cities



// Таблиця Lines (Ця таблиця містить інформацію про різні лінії метро в місті)
                                                                            
CREATE TABLE Lines (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) not null,
    city_name varchar(255) not null, //Додано поле для city_name
);

//Таблиця  Stations (У цій таблиці містяться дані про різні станції метро в місті)
                                                                            
CREATE TABLE Stations (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) not null,
    line_id int,
    latitude decimal(10, 8),
    longitude decimal(11, 8),
    city_name varchar(255) not null, //Додано поле для city_name
    FOREIGN KEY (line_id) REFERENCES Lines(id)
);

// Таблиця Station Connections (У цій таблиці містяться дані про з'єднання між різними станціями в місті)
                                                                          
CREATE TABLE Station_Connections (
    id int AUTO_INCREMENT PRIMARY KEY,
    station_id int,
    connected_station_id int,
    order_number int, //Додано поле для визначення порядку
    connection_type varchar(255),
    city_name varchar(255) not null,//Додано поле для city_name
    FOREIGN KEY (station_id) REFERENCES Stations(id),
    FOREIGN KEY (connected_station_id) REFERENCES Stations(id)
);

// Таблиця Branches (Ця таблиця містить дані про гілки метро в  місті)
                                                                           
CREATE TABLE Branches (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) not null,
    line_id int,
    FOREIGN KEY (line_id) REFERENCES Lines(id)
);


//Лінії визначають основні транспортні маршрути, пролягаючи через різні райони міста та створюючи каркас системи громадського транспорту,
 що об'єднує різні частини міста. Гілки є додатковими маршрутами, відгалуженнями від основних ліній, і призначені для обслуговування
  конкретних районів чи станцій, маючи свої власні характеристики, але зазвичай підпорядковані та пов'язані з основною лінією.