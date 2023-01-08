-- 기존 Member 테이블 삭제
drop table member purge;

-- Member 테이블 생성
create table member
(
  userid varchar2(10) primary key,
  passwd varchar2(10) not null,
  username varchar2(10) not null,
  post varchar2(6) not null,
  addr1 varchar2(500) not null,
  addr2 varchar2(500) not null,
  phone1 varchar2(3) not null,
  phone2 varchar2(4) not null,
  phone3 varchar2(4) not null,
  email1 varchar2(20) not null,
  email2 varchar2(20) not null
);

-- Insert
-- Member 더미 데이터 
insert into member values
('admin', 'admin', '관리자', '00000', '서울', '강남', '010', '0000', '0000', 'admin', 'daum.net');
insert into member values
('1', '1', 'KIM', '11111', '서울', '광진', '010', '1111', '1111', '1', 'daum.net');
insert into member values
('2', '2', 'LEE', '22222', '인천', '연수', '010', '2222', '2222', '2', 'naver.com');
insert into member values
('3', '3', 'PARK', '33333', '경기', '광주', '010', '3333', '3333', '3', 'daum.net');
insert into member values
('4', '4', 'CHOI', '44444', '전북', '전주', '010', '4444', '4444', '4', 'naver.com');
insert into member values
('5', '5', 'JEOUG', '55555', '강원', '강릉', '010', '5555', '5555', '5', 'daum.net');
insert into member values
('6', '6', 'SON', '66666', '층남', '천안', '010', '6666', '6666', '6', 'daum.net');
insert into member values
('7', '7', 'MIN', '77777', '경북', '포항', '010', '7777', '7777', '7', 'naver.com');
insert into member values
('8', '8', 'HONG', '88888', '경남', '부산', '010', '8888', '8888', '8', 'naver.com');
insert into member values
('9', '9', 'KWAK', '99999', '충북', '제천', '010', '9999', '9999', '9', 'daum.net');
commit;