//Таблиця для зберігання даних про проекти
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

//Таблиця для зберігання даних про користувачів
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL
);


//Таблиця для привязки користувачів до проекту 
CREATE TABLE project_members (
    project_id INT,
    user_id INT,
    PRIMARY KEY (project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);



//Таблиця для зберігання даних про задачі
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    project_id INT,
    author_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

//Таблиця для зберігання даних про виконавців завдань
CREATE TABLE task_assignees (
    task_id INT,
    user_id INT,
    PRIMARY KEY (task_id, user_id),
    FOREIGN KEY (task_id) REFERENCES tasks(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


//Таблиця для зберігання інформації про файли (проектів)
CREATE TABLE project_files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(id)
);




//Таблиця для зберігання інформації про файли (задач)
CREATE TABLE task_files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    task_id INT,
    FOREIGN KEY (task_id) REFERENCES tasks(id)
);



