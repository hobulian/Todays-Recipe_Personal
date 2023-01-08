-- 기존 Cart 테이블과 시퀀스 삭제
drop table cart purge;
drop sequence cart_seq;

-- Cart 테이블 생성
create table cart
(  num NUMBER(6) PRIMARY KEY,
    userid VARCHAR2(10),
    gCode varchar2(20) not null,
	gCategory varchar2(20) not null,
    gName varchar2(50) not null,
    gPrice NUMBER(6) not null,
    gAmount NUMBER(4) not null,
    gImage varchar2(20) not null
);   
   
-- Cart에 userid FK 추가
alter table cart
add CONSTRAINT cart_userid_fk FOREIGN KEY(userid)
REFERENCES member(userid) ON DELETE CASCADE;
   
alter table cart
add CONSTRAINT cart_gCode_fk FOREIGN KEY(gCode)
REFERENCES goods(gCode) ON DELETE CASCADE;   

-- Cart 번호 시퀀스 생성
create sequence cart_seq; 