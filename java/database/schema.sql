BEGIN TRANSACTION;

DROP TABLE IF EXISTS flashcards;
DROP TABLE IF EXISTS users;

DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE flashcards(
	card_id serial primary key,
	user_id bigint,
	question_side varchar (256) not null,
	answer_side varchar (512) not null,
	keywords varchar (128),
	
	constraint fk_flashcards_user_id foreign key (user_id) references users(user_id)
);



INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1', 'test question','test answer','question stuff things');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1', 'What is the meaning of this','meh','question stuff things');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1', 'but why','because','dogs cats things');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1', 'tester test question','test answer','question stuff things');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1', 'test question','test answer','question stuff things');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1', 'test question','test answer','question stuff things');

COMMIT TRANSACTION;
