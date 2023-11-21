
// Таблиця Categories 
//Тут можна зберігати дані про категорії новин

CREATE TABLE Categories (
    id int AUTO_INCREMENT PRIMARY KEY,
    name  varchar(255) not null
);

 //Таблиця News
 //Тут можна зберігати дані про новини, пов'язані з категоріями

CREATE TABLE News (
    id int AUTO_INCREMENT PRIMARY KEY,
    category_id int,
    title varchar(255) not null,
    content text not null,
    publication_date datetime not null,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

//Таблиця Comments 
//Тут можна зберігати коментарі до новин

CREATE TABLE Comments (
    id int AUTO_INCREMENT PRIMARY KEY,
    news_id int,
    commenter_name  varchar(255) not null,
    comment_text text not null,
    date datetime not null,
    FOREIGN KEY (news_id) REFERENCES News(id)
);

//Таблиця Ratings 
//Тут можна зберігати рейтинги новин з визначеними значеннями від 1 до 5

CREATE TABLE Ratings (
    id int AUTO_INCREMENT PRIMARY KEY,
    news_id int,
    ip_address  varchar(255) not null,
    rating_value int CHECK (rating_value >= 1 AND rating_value <= 5) not null,
    FOREIGN KEY (news_id) REFERENCES News(id)
);