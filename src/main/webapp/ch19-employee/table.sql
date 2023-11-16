--사원관리
create table semployee(
 snum number primary key,
 id varchar2(12) unique not null,
 name varchar2(30) not null,
 passwd varchar2(12) not null,
 salary number(8) not null,
 job varchar2(30) not null,
 reg_date date default sysdate not null
);
create sequence semployee_seq;

--사원 게시판 (정식 표기법으로 명시)
create table story(
   num number not null,
   title varchar2(150) not null,
   content clob not null,
   ip varchar2(30) not null,
   snum number not null, --사원 번호(작성자 역할)
   reg_date date default sysdate not null,
   constraint story_pk primary key (num),
   constraint story_fk foreign key (snum) references semployee (snum)
);
