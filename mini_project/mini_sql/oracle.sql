
/* Drop Tables */

DROP TABLE t_board CASCADE CONSTRAINTS;
DROP TABLE t_user CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE t_board_no_seq;




/* Create Sequences */

CREATE SEQUENCE t_board_no_seq;



/* Create Tables */

CREATE TABLE t_board
(
	no number NOT NULL,
	title varchar2(200) NOT NULL,
	user_id varchar2(30) NOT NULL,
	regdate date NOT NULL,
	content clob NOT NULL,
	available number(2) NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE t_user
(
	user_id varchar2(30) NOT NULL,
	user_pw varchar2(128) NOT NULL,
	user_name varchar2(30) NOT NULL,
	user_gender varchar2(30) NOT NULL,
	user_email varchar2(30) NOT NULL,
	user_birthdate varchar2(30) NOT NULL,
	user_phone varchar2(30) NOT NULL,
	user_addr varchar2(500) NOT NULL,
	PRIMARY KEY (user_id)
);

select * from T_BOARD;
select * from T_USER;

insert into T_USER(user_id, user_pw, user_name, user_gender, user_email, user_birthdate, user_phone, user_addr)
values('next','d404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db',
'정혜성','남자','cndjrdms79@naver.com','19960206','01012341234','대구시 달성군 현풍면');

commit


