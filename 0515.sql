use test02;
select pkey,name,birth from `user`
order by pkey desc
limit 1;

select min(pkey),max(name)
from `user`;

#얘는 안 됨
select * 
from `user`
where pkey = min(pkey);

#얘는 된다.
select *
from `user`
where pkey= (select min(pkey) from `user`);

select (select avg(2024-year(birth))from `user`)-(2024-year(birth)) as avg
from `user`;


select date_format(now(),'%Y-%m-%d %H:%i:%s');

select count(*) from `user`;

select count(*) from profile;

#가장 많은 프로필 사진을 올린 유저와 가장 작은 사진을 올린 유저의 차이

select user_fkey,count(user_fkey) as profile_img
from profile
group by profile.user_fkey;

select count(*)
from `profile`
where user_fkey =7;

select gender,count(gender) from `user`
where gender !=0 
group by gender;

select * from `profile`
where user_fkey=2;

#left 조인 하지 않고 두 개의 테이블 같이 불러오기
select p.pkey, p.image, p.profile,p.status as profile_status,p.user_fkey
from profile p ,user u
where u.pkey = p.user_fkey and p.user_fkey=2;


#프로필 테이블과 user 테이블 데이터를 같이 불러오기
select p.pkey, p.image, p.profile,p.status as profile_status,p.user_fkey,u.`name` as user_name,u.status as user_status
from profile p ,user u
where u.pkey = p.user_fkey and p.user_fkey=2;

#pkey가 2번인 유저의 이름 불러오기
select u.name
from user u
where pkey =2;

#user와 profile테이블 left join
select u.name as user_name
from user u
left join profile p 
on p.user_fkey =u.pkey
where u.pkey =2 and p.status !=3;

#현재 사용 중인 프로필 이미지만 출력하기

select u.name as user_name,p.image as profile_image
from user u
left join profile p 
on u.pkey = p.user_fkey and
p.status = 1;


