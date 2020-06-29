
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
	regdate date DEFAULT sysdate NOT NULL,
	content clob NOT NULL,
	file_name varchar2(1000),
	file_volume varchar2(500),
	content_type varchar2(50),
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
	user_postcode varchar2(5),
	user_addr varchar2(500) NOT NULL,
	user_detailaddr varchar2(100),
	user_extraaddr varchar2(100),
	PRIMARY KEY (user_id)
);

select * from T_BOARD;

