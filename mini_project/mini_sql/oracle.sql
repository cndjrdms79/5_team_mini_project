
/* Drop Tables */

DROP TABLE t_board CASCADE CONSTRAINTS;
DROP TABLE t_user CASCADE CONSTRAINTS;
DROP TABLE t_attendance CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE t_board_no_seq;




/* Create Sequences */

CREATE SEQUENCE t_board_no_seq;



/* Create Tables */
CREATE TABLE t_attendance
(
   user_id varchar2(30) NOT NULL,
   attendance varchar2(100) NOT NULL
);
alter table t_attendance
add constraint t_attendance_unique unique(user_id, attendance); /* 아이디랑 날짜 중복체크 */


CREATE TABLE t_board
(
	no number NOT NULL,
	title varchar2(200) NOT NULL,
	user_id varchar2(30) NOT NULL,
	regdate date DEFAULT sysdate NOT NULL,
	content clob NOT NULL,
	file_name varchar2(1000),	
	file_volume varchar2(500),		/* file_volume 추가	*/
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
select * from t_user;
select * from t_attendance;

select * from t_user where user_id='next';

update t_user set user_name='정정민' where user_id='next';

insert into t_board(file_name)
value('?');


