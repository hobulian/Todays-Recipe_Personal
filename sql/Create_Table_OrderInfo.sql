-- 기존 orderInfo 테이블과 시퀀스 삭제
drop table orderinfo purge;
drop sequence orderInfo_seq;

-- orderInfo 테이블 생성
create table orderInfo
  (num NUMBER(6) PRIMARY KEY,
    userid VARCHAR2(10),
    gCode varchar2(20) NOT NULL,
	gCategory VARCHAR2(20) NOT NULL,
    gName varchar2(50) NOT NULL,
    gPrice NUMBER(6) NOT NULL,
    gAmount NUMBER(4) NOT NULL,
    gImage varchar2(20) NOT NULL,
    orderName VARCHAR2(10) NOT NULL,
    post VARCHAR2(5) NOT NULL,
    addr1 VARCHAR2(500) NOT NULL,
    addr2 VARCHAR2(500) NOT NULL,
    phone VARCHAR2(11) NOT NULL,
    payMethod VARCHAR2(30) NOT NULL,
    orderDay DATE DEFAULT SYSDATE,
	status VARCHAR(500) DEFAULT '주문접수'
  );   
  
-- orderInfo에 userid FK 추가
alter table orderInfo
add CONSTRAINT orderInfo_userid_fk FOREIGN KEY(userid)
REFERENCES member(userid) ON DELETE CASCADE;

alter table orderInfo
add CONSTRAINT orderInfo_gCode_fk FOREIGN KEY(gCode)
REFERENCES goods(gCode) ON DELETE CASCADE; 

-- orderInfo 번호 시퀀스 생성   
create sequence orderInfo_seq;

-- Insert
-- OrderInfo 더미 데이터
Insert into ORDERINFO values (9,'1','F5','아보카도',3240,7,'fruit5','KIM','11111','서울','광진','01011111111','신용카드',to_date('22/06/10','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (8,'1','V15','당근',2990,8,'veg15','KIM','11111','서울','광진','01011111111','계좌이체',to_date('22/06/11','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (7,'1','V6','깐대파',2590,6,'veg6','KIM','11111','서울','광진','01011111111','계좌이체',to_date('22/06/12','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (14,'1','F21','카랴향',14800,8,'fruit21','KIM','11111','서울','광진','01011111111','계좌이체',to_date('22/06/13','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (13,'1','S29','미역',8900,8,'seafood29','KIM','11111','서울','광진','01011111111','계좌이체',to_date('22/06/14','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (12,'1','N3','스파게티',2450,8,'noodle3','KIM','11111','서울','광진','01011111111','신용카드',to_date('22/06/15','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (11,'1','N27','부침가루',2980,6,'noodle27','KIM','11111','서울','광진','01011111111','무통장 입급',to_date('22/06/10','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (10,'1','M15','등심 돈까스',12900,7,'meat15','KIM','11111','서울','광진','01011111111','신용카드',to_date('22/06/11','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (43,'2','N29','된장',2050,3,'noodle29','LEE','22222','인천','연수','01022222222','무통장 입급',to_date('22/06/12','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (44,'2','N23','당면',3980,5,'noodle23','LEE','22222','인천','연수','01022222222','신용카드',to_date('22/06/13','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (45,'2','F4','방울토마토',4170,4,'fruit4','LEE','22222','인천','연수','01022222222','신용카드',to_date('22/06/14','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (46,'2','V14','양상추',2590,3,'veg14','LEE','22222','인천','연수','01022222222','계좌이체',to_date('22/06/15','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (47,'2','M17','소고기 등심',11500,1,'meat17','LEE','22222','인천','연수','01022222222','신용카드',to_date('22/06/10','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (48,'2','S21','해삼',11430,1,'seafood21','LEE','22222','인천','연수','01022222222','계좌이체',to_date('22/06/11','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (42,'2','N21','돈까스 소스',3280,3,'noodle21','LEE','22222','인천','연수','01022222222','신용카드',to_date('22/06/12','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (41,'2','V12','국산 브로콜리',2120,4,'veg12','LEE','22222','인천','연수','01022222222','신용카드',to_date('22/06/13','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (40,'2','M15','등심 돈까스',12900,6,'meat15','LEE','22222','인천','연수','01022222222','신용카드',to_date('22/06/14','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (39,'2','M13','메추리 알',4800,1,'meat13','LEE','22222','인천','연수','01022222222','신용카드',to_date('22/06/15','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (38,'2','S8','도다리',16900,10,'seafood8','LEE','22222','인천','연수','01022222222','신용카드',to_date('22/06/10','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (6,'2','S3','동태',5900,7,'seafood3','LEE','22222','인천','연수','01022222222','신용카드',to_date('22/06/11','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (49,'2','S17','굴',4500,15,'seafood17','LEE','22222','인천','연수','01022222222','신용카드',to_date('22/06/12','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (4,'2','V3','참타리 버섯',1050,1,'veg3','LEE','22222','인천','연수','01022222222','무통장 입급',to_date('22/06/13','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (5,'2','V1','애호박',1480,5,'veg1','LEE','22222','인천','연수','01022222222','신용카드',to_date('22/06/14','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (15,'3','V11','다다기오이',2800,5,'veg11','PARK','33333','경기','광주','01033333333','신용카드',to_date('22/06/15','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (16,'3','F26','팬시레몬',2560,5,'fruit26','PARK','33333','경기','광주','01033333333','신용카드',to_date('22/06/10','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (17,'3','S11','연어',22900,3,'seafood11','PARK','33333','경기','광주','01033333333','신용카드',to_date('22/06/11','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (18,'3','N30','올리고당',2800,3,'noodle30','PARK','33333','경기','광주','01033333333','계좌이체',to_date('22/06/12','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (50,'3','F2','참외',14900,6,'fruit2','PARK','33333','경기','광주','01033333333','신용카드',to_date('22/06/13','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (51,'3','S3','동태',5900,5,'seafood3','PARK','33333','경기','광주','01033333333','신용카드',to_date('22/06/14','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (52,'3','N5','토마토 케첩',2580,1,'noodle5','PARK','33333','경기','광주','01033333333','무통장 입급',to_date('22/06/15','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (53,'3','N10','참기름',7980,6,'noodle10','PARK','33333','경기','광주','01033333333','신용카드',to_date('22/06/16','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (54,'3','N16','고춧가루',9800,3,'noodle16','PARK','33333','경기','광주','01033333333','계좌이체',to_date('22/06/16','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (19,'4','S2','갈치',11100,1,'seafood2','CHOI','44444','전북','전주','01044444444','신용카드',to_date('22/06/16','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (20,'4','S14','쭈꾸미',19710,5,'seafood14','CHOI','44444','전북','전주','01044444444','신용카드',to_date('22/06/16','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (21,'4','S24','새우',9900,1,'seafood24','CHOI','44444','전북','전주','01044444444','신용카드',to_date('22/06/16','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (22,'4','S23','꽃게',59900,5,'seafood23','CHOI','44444','전북','전주','01044444444','신용카드',to_date('22/06/16','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (23,'4','V18','양배추',3790,2,'veg18','CHOI','44444','전북','전주','01044444444','신용카드',to_date('22/06/10','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (24,'4','V28','숙주나물',1990,2,'veg28','CHOI','44444','전북','전주','01044444444','계좌이체',to_date('22/06/11','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (25,'4','N8','카레 분말',3280,2,'noodle8','CHOI','44444','전북','전주','01044444444','계좌이체',to_date('22/06/12','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (26,'4','N15','올리브 오일',7980,3,'noodle15','CHOI','44444','전북','전주','01044444444','계좌이체',to_date('22/06/13','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (27,'5','M3','삼겹살',12660,9,'meat3','JEOUG','55555','강원','강릉','01055555555','계좌이체',to_date('22/06/14','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (28,'5','M12','닭 다리살',12800,3,'meat12','JEOUG','55555','강원','강릉','01055555555','계좌이체',to_date('22/06/15','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (29,'5','M2','훈제오리',2680,1,'meat2','JEOUG','55555','강원','강릉','01055555555','신용카드',to_date('22/06/16','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (30,'5','M25','닭 윗날개',8600,6,'meat25','JEOUG','55555','강원','강릉','01055555555','신용카드',to_date('22/06/10','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (31,'5','M20','우삼겹',6930,1,'meat20','JEOUG','55555','강원','강릉','01055555555','신용카드',to_date('22/06/11','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (32,'5','M5','소고기 다짐육',7500,2,'meat5','JEOUG','55555','강원','강릉','01055555555','신용카드',to_date('22/06/12','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (33,'5','N20','진간장',5000,7,'noodle20','JEOUG','55555','강원','강릉','01055555555','신용카드',to_date('22/06/13','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (34,'5','V5','깻잎',1090,3,'veg5','JEOUG','55555','강원','강릉','01055555555','신용카드',to_date('22/06/14','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (35,'5','S14','쭈꾸미',19710,6,'seafood14','JEOUG','55555','강원','강릉','01055555555','신용카드',to_date('22/06/15','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (36,'5','S20','멍게',9160,6,'seafood20','JEOUG','55555','강원','강릉','01055555555','무통장 입급',to_date('22/06/16','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (37,'5','M23','닭 가슴살',12900,1,'meat23','JEOUG','55555','강원','강릉','01055555555','신용카드',to_date('22/06/10','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (83,'6','S3','동태',5900,5,'seafood3','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/11','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (84,'6','M11','소고기 국거리용',8100,3,'meat11','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/12','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (87,'6','V8','깐마늘',2990,1,'veg8','SON','66666','층남','천안','01066666666','계좌이체',to_date('22/06/13','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (88,'6','V13','파프리카',2480,1,'veg13','SON','66666','층남','천안','01066666666','계좌이체',to_date('22/06/14','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (89,'6','V17','알배기 배추',3990,1,'veg17','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/15','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (91,'6','V22','미나리',4990,1,'veg22','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/16','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (92,'6','V25','가지',2180,1,'veg25','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/10','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (93,'6','V23','시금치',2190,1,'veg23','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/11','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (94,'6','V28','숙주나물',1990,1,'veg28','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/12','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (95,'6','V30','콩나물',2600,1,'veg30','SON','66666','층남','천안','01066666666','무통장 입급',to_date('22/06/13','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (96,'6','V27','양송이버섯',3690,1,'veg27','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/14','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (97,'6','F12','신고배',7900,1,'fruit12','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/15','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (98,'6','F13','냉동블루베리',8050,1,'fruit13','SON','66666','층남','천안','01066666666','계좌이체',to_date('22/06/16','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (99,'6','F20','파인애플청크',5480,1,'fruit20','SON','66666','층남','천안','01066666666','계좌이체',to_date('22/06/10','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (100,'6','F15','컷팅파인애플',9800,1,'fruit15','SON','66666','층남','천안','01066666666','계좌이체',to_date('22/06/11','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (102,'6','N21','돈까스 소스',3280,1,'noodle21','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/12','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (103,'6','N8','카레 분말',3280,1,'noodle8','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/13','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (104,'6','M4','앞다리 살',6900,1,'meat4','SON','66666','층남','천안','01066666666','신용카드',to_date('22/06/14','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (75,'7','F2','참외',14900,77,'fruit2','MIN','77777','경북','포항','01077777777','신용카드',to_date('22/06/15','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (76,'7','F18','자몽',10900,2,'fruit18','MIN','77777','경북','포항','01077777777','신용카드',to_date('22/06/16','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (77,'7','N10','참기름',7980,5,'noodle10','MIN','77777','경북','포항','01077777777','무통장 입급',to_date('22/06/10','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (78,'7','M2','훈제오리',2680,5,'meat2','MIN','77777','경북','포항','01077777777','신용카드',to_date('22/06/11','RR/MM/DD'),'거래완료','Meat');
Insert into ORDERINFO values (79,'7','S9','가자미',6500,24,'seafood9','MIN','77777','경북','포항','01077777777','신용카드',to_date('22/06/12','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (80,'7','V7','양파',3600,22,'veg7','MIN','77777','경북','포항','01077777777','신용카드',to_date('22/06/13','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (81,'7','V11','다다기오이',2800,3,'veg11','MIN','77777','경북','포항','01077777777','계좌이체',to_date('22/06/14','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (82,'7','F11','사파이어포도',8910,15,'fruit11','MIN','77777','경북','포항','01077777777','계좌이체',to_date('22/06/15','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (61,'8','V2','팽이버섯',1160,1,'veg2','HONG','88888','경남','부산','01088888888','계좌이체',to_date('22/06/16','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (62,'8','S8','도다리',16900,4,'seafood8','HONG','88888','경남','부산','01088888888','계좌이체',to_date('22/06/10','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (63,'8','S8','도다리',16900,1,'seafood8','HONG','88888','경남','부산','01088888888','신용카드',to_date('22/06/11','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (64,'8','S13','낙지',19900,1,'seafood13','HONG','88888','경남','부산','01088888888','신용카드',to_date('22/06/12','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (65,'8','S16','바지락',7500,5,'seafood16','HONG','88888','경남','부산','01088888888','무통장 입급',to_date('22/06/13','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (66,'8','S15','문어',22500,1,'seafood15','HONG','88888','경남','부산','01088888888','신용카드',to_date('22/06/14','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (67,'8','S20','멍게',9160,4,'seafood20','HONG','88888','경남','부산','01088888888','신용카드',to_date('22/06/15','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (68,'8','S23','꽃게',59900,6,'seafood23','HONG','88888','경남','부산','01088888888','신용카드',to_date('22/06/16','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (69,'8','V24','샐러리',2690,4,'veg24','HONG','88888','경남','부산','01088888888','신용카드',to_date('22/06/10','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (70,'8','S25','새우살',6640,8,'seafood25','HONG','88888','경남','부산','01088888888','계좌이체',to_date('22/06/11','RR/MM/DD'),'거래완료','Seafood');
Insert into ORDERINFO values (71,'8','N3','스파게티',2450,2,'noodle3','HONG','88888','경남','부산','01088888888','계좌이체',to_date('22/06/12','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (72,'8','N2','바질페스토',5980,1,'noodle2','HONG','88888','경남','부산','01088888888','계좌이체',to_date('22/06/13','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (73,'8','N14','생칼국수',2480,1,'noodle14','HONG','88888','경남','부산','01088888888','신용카드',to_date('22/06/14','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (74,'8','N17','소금',4800,99,'noodle17','HONG','88888','경남','부산','01088888888','신용카드',to_date('22/06/15','RR/MM/DD'),'거래완료','Noodle');
Insert into ORDERINFO values (55,'9','F28','적용과',3960,5,'fruit28','KWAK','99999','충북','제천','01099999999','신용카드',to_date('22/06/16','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (56,'9','F7','블루베리',8090,4,'fruit7','KWAK','99999','충북','제천','01099999999','신용카드',to_date('22/06/16','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (57,'9','F9','애플청포도',9990,5,'fruit9','KWAK','99999','충북','제천','01099999999','신용카드',to_date('22/06/11','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (58,'9','V15','당근',2990,4,'veg15','KWAK','99999','충북','제천','01099999999','무통장 입급',to_date('22/06/14','RR/MM/DD'),'거래완료','Vegetable');
Insert into ORDERINFO values (59,'9','F14','골드키위',9900,24,'fruit14','KWAK','99999','충북','제천','01099999999','계좌이체',to_date('22/06/12','RR/MM/DD'),'거래완료','Fruit');
Insert into ORDERINFO values (60,'9','F11','사파이어포도',8910,55,'fruit11','KWAK','99999','충북','제천','01099999999','계좌이체',to_date('22/06/13','RR/MM/DD'),'거래완료','Fruit');
commit;