// Таблиця Categories 

CREATE TABLE Categories (
    category_id int AUTO_INCREMENT PRIMARY KEY,
    category_name  varchar(255) not null
);

 //Таблиця News

CREATE TABLE News (
    news_id int AUTO_INCREMENT PRIMARY KEY,
    category_id int,
    title varchar(255) not null,
    content text not null,
    publication_date datetime not null,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

//Таблиця Comments 

CREATE TABLE Comments (
    comment_id int AUTO_INCREMENT PRIMARY KEY,
    news_id int,
    commenter_name  varchar(255) not null,
    comment_text text not null,
    comment_date datetime not null,
    FOREIGN KEY (news_id) REFERENCES News(news_id)
);

//Таблиця Ratings 

CREATE TABLE Ratings (
    rating_id int AUTO_INCREMENT PRIMARY KEY,
    news_id int,
    ip_address  varchar(255) not null,
    rating_value int CHECK (rating_value >= 1 AND rating_value <= 5) not null,
    FOREIGN KEY (news_id) REFERENCES News(news_id)
);