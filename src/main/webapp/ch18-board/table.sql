--게시판
create table smboard(
 num number primary key,
 title varchar2(150) not null,
 name varchar2(30) not null,
 passwd varchar2(12) not null, --로그인 x 비밀번호 인증하면 다 등록가능
 content clob not null, --clob 더 찾아보기
 ip varchar2(30) not null,
 reg_date date default sysdate not null
);
create sequence smboard_seq;