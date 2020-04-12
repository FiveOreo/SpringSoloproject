create table MP_BOARD(
BNO number not null,
TITLE varchar2(100) not null,
CONTENT varchar2(2000) not null,
WRITER varchar2(100) not null,
REGDATE date default sysdate,
primary key(BNO)
);

CREATE SEQUENCE MP_BOARD_SEQ START WITH 0 MINVALUE 0;

insert into MP_BOARD(BNO,TITLE,CONTENT,WRITER)
  values(MP_BOARD_SEQ.NEXTVAL,'안녕하세요','안녕하살법','돈까스'); 

select * from MP_BOARD;


insert into mp_board(bno, title, content, writer)
select mp_board_seq.nextval, title, content, writer from mp_board;

commit;

update mp_board set title = '안녕하세요2' where bno = 66;
delete from mp_board where bno = 66;

drop sequence MP_BOARD_SEQ;

ALTER TABLE MP_BOARD ADD(HIT NUMBER DEFAULT 0);
COMMIT;
