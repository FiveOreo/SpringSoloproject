create table mp_reply(
  bno number not null,
  rno number not null,
  content varchar2(1000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate,
  primary key(bno, rno)
);

alter table mp_reply add constraint mp_reply_bno foreign key(bno)
references mp_board(bno);

create sequence mp_reply_seq start with 1 minvalue 0;

commit;


insert into mp_reply (bno, rno, content, writer)
  values(3, mp_reply_seq.nextval, '테스트댓글', '테스트작성자');
  
select rno, content, writer, regdate
  from mp_reply
 where bno = 1;
 
 drop sequence mp_reply_seq;
 
 INSERT INTO MP_REPLY(
		BNO
		, RNO
		, CONTENT
		, WRITER
		)
		VALUES( '67'
		, MP_REPLY_SEQ.NEXTVAL
		, '333444'
		, '111222' );