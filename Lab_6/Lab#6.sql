1)Select cities.name, regions.name
From cities
Join regions on cities.region = regions.uuid
Where cities.population > 350000;

2)Select cities.name
From cities
Join regions on cities.region = regions.uuid
Where regions.name = 'Nord';


3) //Таблиця Cities

CREATE TABLE Cities (
    city_id int AUTO_INCREMENT PRIMARY KEY,
    city_name varchar(255) not null
);

// Таблиця Metro Lines

CREATE TABLE Metro_Lines (
    line_id int AUTO_INCREMENT PRIMARY KEY,
    line_name varchar(255) not null,
    city_id int,
    FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);

//Таблиця Metro Stations

CREATE TABLE Metro_Stations (
    station_id int AUTO_INCREMENT PRIMARY KEY,
    station_name varchar(255) not null,
    line_id int,
    latitude decimal(10, 8),
    longitude decimal(11, 8),
    FOREIGN KEY (line_id) REFERENCES Metro_Lines(line_id)
);

// Таблиця Station Connections

CREATE TABLE Station_Connections (
    connection_id int AUTO_INCREMENT PRIMARY KEY,
    station_id_1 int,
    station_id_2 int,
    connection_type varchar(255),
    FOREIGN KEY (station_id_1) REFERENCES Metro_Stations(station_id),
    FOREIGN KEY (station_id_2) REFERENCES Metro_Stations(station_id)
);

// Таблиця Branches

CREATE TABLE Branches (
    branch_id int AUTO_INCREMENT PRIMARY KEY,
    branch_name varchar(255) not null,
    line_id int,
    FOREIGN KEY (line_id) REFERENCES Metro_Lines(line_id)
);
