select * from test02.user;
select * from test02.board;
select * from test02.reply;
select * from test02.`like`;

use test02;
#적극적으로 활동하는 유저 순으로 정렬하고 출력 유저이름 게시판글수 댓글수 좋아요수 총개수 


create index name_index on user (name);
show index from user;

select name 
from user use index(name_index);

select U.name, count(B.pkey),count(R.pkey),count(L.pkey)
from user U use index(name_index)
left join board B on B.writer = U.pkey
left join reply R on R.board_id = B.pkey
left join `like` L on L.user_id = U.pkey
group by U.name;

select U.name ,B.title,L.type
from user U use index(name_index)
left join board B on B.writer = U.pkey
left join reply R on R.board_id = B.pkey
left join `like` L on L.user_id = U.pkey
where U.name is not null;

#유저이름, 글 제목, 뷰 카운트, 댓글 수
select U.name,B.title,B.view_count,count(R.reply) as '댓글 수'
from board B
left join user U on U.pkey = B.writer
left join reply R on R.board_id = B.pkey
group by U.name,B.title,B.view_count
order by B.view_count desc
limit 5;
