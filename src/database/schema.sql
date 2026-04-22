-- estrutura do banco

CREATE DATABASE IF NOT EXISTS KAIROS;
USE KAIROS;

CREATE TABLE IF NOT EXISTS user (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    user_type ENUM('student', 'moderator', 'admin') NOT NULL
);


CREATE TABLE IF NOT EXISTS student (
    id_student INT PRIMARY KEY,
    current_streak INT DEFAULT 0,
    bigger_streak INT DEFAULT 0,
    FOREIGN KEY (id_student) REFERENCES user(id_user)
);

CREATE TABLE IF NOT EXISTS moderator (
    id_moderator INT PRIMARY KEY,
    subject_owner VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_moderator) REFERENCES user(id_user)
);

CREATE TABLE IF NOT EXISTS admin (
    id_admin INT PRIMARY KEY,
    FOREIGN KEY (id_admin) REFERENCES user(id_user)
);

CREATE TABLE IF NOT EXISTS topic (
    id_topic INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    subject ENUM('MATH') NOT NULL
);

CREATE TABLE IF NOT EXISTS topic_pre_requirements (
    topic_id INT NOT NULL,
    pre_requirement_id INT NOT NULL,
    PRIMARY KEY (topic_id, pre_requirement_id),
    FOREIGN KEY (topic_id) REFERENCES topic(id_topic),
    FOREIGN KEY (pre_requirement_id) REFERENCES topic(id_topic)
);

CREATE TABLE IF NOT EXISTS question (
    id_question INT AUTO_INCREMENT PRIMARY KEY,
    topic_id INT NOT NULL,
    statement TEXT NOT NULL,
    stats ENUM('verified', 'not_verified') NOT NULL,
    difficulty ENUM('easy', 'medium', 'hard') NOT NULL,
    FOREIGN KEY (topic_id) REFERENCES topic(id_topic)
);

CREATE TABLE IF NOT EXISTS alternatives (
    id_alternatives INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    text TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    FOREIGN KEY (question_id) REFERENCES question(id_question)
);

CREATE TABLE IF NOT EXISTS answer (
    id_answer INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    question_id INT NOT NULL,
    got_right BOOLEAN NOT NULL,
    answer_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    type ENUM('multiple_choice') NOT NULL ,
    base_answer TEXT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(id_student),
    FOREIGN KEY (question_id) REFERENCES question(id_question)
);

CREATE TABLE IF NOT EXISTS reports (
    id_reports INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    question_id INT NOT NULL,
    report_date TIMESTAMP NOT NULL,
    reason TEXT NOT NULL,
    analyzed_by INT NULL,
    stats ENUM('analyzed', 'pending', 'not_analyzed') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(id_student),
    FOREIGN KEY (question_id) REFERENCES question(id_question),
    FOREIGN KEY (analyzed_by) REFERENCES moderator(id_moderator)
);

CREATE TABLE IF NOT EXISTS gap (
    id_gap INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    topic_id INT NOT NULL,
    qty_solved_questions INT NOT NULL,
    correct_answers INT NOT NULL,
    identified_date TIMESTAMP NOT NULL,
    stats ENUM('solved', 'not_solved') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(id_student),
    FOREIGN KEY (topic_id) REFERENCES topic(id_topic)
);

CREATE TABLE IF NOT EXISTS student_topic (
    student_id INT NOT NULL,
    topic_id INT NOT NULL,
    qty_solved_questions INT NULL,
    qty_wrong_questions INT NULL,
    PRIMARY KEY (student_id, topic_id),
    FOREIGN KEY (student_id) REFERENCES student(id_student),
    FOREIGN KEY (topic_id) REFERENCES topic(id_topic)
);
