use sakila; #데이터베이스 선택
show tables; #테이블 정보 조회

use test01;

create table user(
	`name` char(20), #몇 바이트를 생성하고 진행할 예정인가, 처리속도가 높은 게 좋음, 데이터베이스가 자주 접근함, char이 속도가 높음
    pwd char(150), #비밀번호 자주 접근해야 하는데 너무 높음,,, 이렇게 해야 하는 거 맞을까?
    birthday date,
    profile_image varchar(300),#폴더 주소와 파일명을 넣어준다. #C:\Users\DS\.android
    email varchar(200)
);

drop table test02;

insert into `user`(`name`,pwd,birthday,email)values ('name1','pwd1',20000703,'email1'  #2000-07-03, 문자형으로 date 형 넣기
);




insert into `user`(`name`,pwd,birthday,email)values ('name1','pwd1',20000703,'email1'  #2000-07-03, 문자형으로 date 형 넣기
);

update `test01`.`user`
SET
`name`= 'name10',
`pwd`='pwd10',
`bityhday`='2000-12-03',
`email`='email10';

select * from user;