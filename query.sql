select * from `user`;
select * from sns_type;
select * from profile;
select * from board;
select * from reply;

# parent_id - 0 대댓글이 아니라, 진짜 다 대글 , , 

select * from `like`;

#몇 개의 종류가 있는지 카운트
select gender,min(sns_type) from `user`
group by gender;

select gender,sns_type from `user`
where gender =0;

select `user`.gender,`user`.sns_type,sns_type.`name`
from `user`,sns_type
where `user`.sns_type=sns_type.pkey;

#미성년자 몇명인지 확인
select `name`,2023-year(birth) from `user`
where !isnull(birth) and 2023-year(birth)<20;

#미성년자 몇명인지 몇명인지 세어보자
select count(pkey) from `user`
where birth is not null and 2023-year(birth)<20;
#where !isnull(birth) and 2023-year(birth)<20;

# 최초 가입 유저
select * from `user`
order by pkey asc
limit 1;


#최근 가입 유저
select * from `user`
order by pkey desc
limit 1;

#서브 쿼리

select `name`,sns_type, (select `name` from sns_type where `user`.sns_type=sns_type.pkey limit 1) as 'sns'
from `user`;


select * from reply;

select reply1.pkey,reply1.board_id,reply1.parent_id,reply1.reply,
reply2.pkey,reply2.board_id,reply2.parent_id,reply2.reply
from reply reply1,reply reply2
where reply1.pkey = reply2.parent_id; #댓글의 pkey와 대댓글의 pkey 비교, 즉 댓글이 달린 걸 보여준다.
;

#join

select reply1.pkey,reply1.board_id,reply1.parent_id,reply1.reply,
reply2.pkey,reply2.board_id,reply2.parent_id,reply2.reply
from reply reply1
left join reply reply2 on reply1.pkey = reply2.parent_id
where reply1.parent_id=0;

#유저에서 프로필로 조인
select * from `profile`;

select `user`.pkey,`user`.`name`,`profile`.`profile`,`profile`.image
from `user`
left join `profile` on `user`.pkey=`profile`.user_fkey;