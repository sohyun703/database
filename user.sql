use test01;
drop table user;
CREATE TABLE profile (pkey int(4) NOT NULL AUTO_INCREMENT, image varchar(255), profile varchar(500), status int(1) DEFAULT 0 NOT NULL comment '0 = 사용 안 함
1 = 사용
2 = 노출 안 함
3 = 삭제', user_fk int(4) NOT NULL, insert_date datetime DEFAULT now() NOT NULL, update_date datetime NULL, PRIMARY KEY (pkey), UNIQUE INDEX (pkey));
CREATE TABLE sns_type (pkey int(1) NOT NULL AUTO_INCREMENT, name varchar(50), PRIMARY KEY (pkey), UNIQUE INDEX (pkey));
CREATE TABLE `user` (id varchar(50),  pkey int(4) NOT NULL AUTO_INCREMENT, name char(50), pwd char(150), birthday date, profile_image char(255), email varchar(200), update_date datetime NULL, insert_update datetime DEFAULT now() NOT NULL, certificated_email int(1) DEFAULT 0 NOT NULL comment '0은 not yes
1은 certificated', certificated_date datetime NOT NULL, gender int(1) comment '1은 어쩌고
2는 어쩌고 해서 나와의 약속 해주기~~', sns_key varchar(50), sns_type int(1) NOT NULL, userpkey int(1) NOT NULL, sns_typepkey int(1) NOT NULL, lastest_login_date datetime NULL, privacy_ok_date datetime NULL, privacy_verision int(1), status int(1) DEFAULT 0 NOT NULL comment '-2  탈퇴
-1 차단
0 = 가입 전
1 가입 완료
2 휴먼 계정', PRIMARY KEY (pkey), UNIQUE INDEX (pkey));
ALTER TABLE profile ADD INDEX FKprofile517221 (user_fk), ADD CONSTRAINT FKprofile517221 FOREIGN KEY (user_fk) REFERENCES `user` (pkey);
ALTER TABLE `user` ADD INDEX FKuser133924 (sns_type), ADD CONSTRAINT FKuser133924 FOREIGN KEY (sns_type) REFERENCES sns_type (pkey);


#참조키가 있기 때문에 먼저 넣어준다 -> 이제부터 카카오로 가입한 사람은 1, 구글로 가입한 사람 2, 페이스북으로 가입한 사람 3, 네이버로 가입한 사람은 4
INSERT INTO `test01`.`sns_type` (`name`) VALUES ('kakao');
INSERT INTO `test01`.`sns_type` (`name`) VALUES ('google');
INSERT INTO `test01`.`sns_type` (`name`) VALUES ('facebook');
INSERT INTO `test01`.`sns_type` (`name`) VALUES ('naver');

select * from sns_type;

#user 데이터 삽입
INSERT INTO `test01`.`user`
(
    `id`,
	`name`,
	`pwd`,
	`birthday`,
	`email`,
	`certificated_email`,
	`certificated_date`,
	`gender`,
	`privacy_ok_date`,
	`privacy_verision`,
	`status`
)
VALUES
(
    <{id: }>,
	<{pkey: }>,
	<{name: }>,
	<{pwd: }>,
	<{birthday: }>,
	<{email: }>,
	<{certificated_email: 0}>,
	<{certificated_date: }>,
	<{gender: }>,
	<{privacy_ok_date: }>,
	<{privacy_verision: }>,
	<{status: 0}>
);

