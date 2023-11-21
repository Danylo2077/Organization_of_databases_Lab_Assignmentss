//Тут можна зберігати дані про проекти
CREATE TABLE Projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

//Тут можна зберігати дані про користувачів
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL
);

//Тут можна зберігати дані про задачі
CREATE TABLE Tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    project_id INT,
    author_id INT,
    FOREIGN KEY (project_id) REFERENCES Projects(id),
    FOREIGN KEY (author_id) REFERENCES Users(id)
);

//Тут можна зберігати дані про виконавців завдань
CREATE TABLE TaskAssignees (
    assignee_id INT AUTO_INCREMENT PRIMARY KEY,
    task_id INT,
    user_id INT,
    FOREIGN KEY (task_id) REFERENCES Tasks(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

//Тут можна зберігати дані про файли
CREATE TABLE Files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_url VARCHAR(255) NOT NULL,
    project_id INT,
    task_id INT,
    FOREIGN KEY (project_id) REFERENCES Projects(id),
    FOREIGN KEY (task_id) REFERENCES Tasks(id)
);



