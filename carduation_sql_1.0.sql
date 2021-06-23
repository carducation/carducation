use carduation;

Drop table word;
Drop table category;
Drop table comment;
Drop table board;
Drop table score;
DROP table USER;

CREATE TABLE USER(
user_num INT AUTO_INCREMENT NOT NULL,
user_id VARCHAR(50) NULL,
password VARCHAR(100) NULL,
nickname VARCHAR(50) NULL,
status VARCHAR(10) NULL,
sns_type VARCHAR(10) NULL,
sns_id VARCHAR(255) NULL,
deactivate_time DATETIME NULL,
PRIMARY KEY (user_num),
INDEX idx1_user_id (user_id ASC),
INDEX idx2_nickname (nickname ASC),
INDEX idx3_sns_id (sns_id ASC)
);

CREATE TABLE BOARD(
board_num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
user_num INT NOT NULL,
title VARCHAR(255) NULL,
content VARCHAR(10000) NULL,
file MEDIUMBLOB NULL,
view_count INT DEFAULT 0,
FOREIGN KEY(user_num) REFERENCES user(user_num)
);

CREATE TABLE COMMENT(
comment_num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
board_num INT NOT NULL,
user_num INT NOT NULL,
comment_content VARCHAR(500) NOT NULL,
FOREIGN KEY(board_num) REFERENCES board(board_num),
FOREIGN KEY(user_num) REFERENCES user(user_num)
);

CREATE TABLE SCORE(
user_num INT NOT NULL PRIMARY KEY,
dietary_score INT DEFAULT 0,
politics_administration_score INT DEFAULT 0,
nature_score INT DEFAULT 0,
culture_score INT DEFAULT 0,
FOREIGN KEY(user_num) REFERENCES USER(user_num)
);

CREATE TABLE CATEGORY(
category_id INT NOT NULL PRIMARY KEY,
category_name VARCHAR(100) NULL
);

CREATE TABLE WORD(
word_num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
category_id INT NOT NULL,
english_word VARCHAR(100) NOT NULL,
english_description VARCHAR(2000),
korean_word VARCHAR(100) NOT NULL,
korean_description VARCHAR(2000),
grammar VARCHAR(10),
FOREIGN KEY(category_id) REFERENCES CATEGORY(category_id)
);

