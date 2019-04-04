/*
 * member : 사용자 정보 테이블
 *   id : 이메일 형식의 사용자 구별 ID
 *   password : 특수문자, 영뮨자, 숫자 조합으로 8자 이상
 *   name : 실명 (어떻게 실명 확인을 할 것인가?)
 *   mobile : 연락할 수 있는 휴대폰 전화번호
 *   kind : 회원 분류 (고객: 1, 협력사: 2, 관리자: 3)
 *   sessionKey : 자동 로그인 기능 구현 시, 이전에 로그인했을 때 생성된 세션 ID
 *   sessionLimit : 로그인 후 쿠키에 의한 자동 로그인 기능이 유지되는 end 시간
 *   createdAt : 회원가입 시간
 *   modifiedAt : 회원정보 변경 시간
 */
create table member(
	id varchar(30) primary key not null,
	password varchar(60) not null,
	name varchar(50) not null,
	mobile varchar(20),
	kind int default 1 not null,
	sessionKey varchar(50) not null default 'none',
	sessionLimit timestamp,
	createdAt timestamp not null default current_timestamp,
	modifiedAt timestamp not null default '0000-00-00 00:00:00'
);

drop table member;

select * from member;

update member set sessionLimit = '2019-02-12 18:19:00.0' where id = 'ksseo63@naver.com';

select now();

delete from member;

desc member;

/* board type
 *   기본 : 제목, 작성자, 비밀번호, 내용, 첨부 1
 *   갤러리 : 이미지 첨부만 가능, 첨부를 thumbnail로 처리
 *   자료실 : 첨부 5개까지 가능
 *   Q&A : 비밀글 표시 및 비밀번호 검사 후 내용 표시
 *   공지사항 : 글쓰기 버튼 비활성화, 관리자만 쓰기 가능
 *   방명록 : 쓰기, 삭제, 목록보기 기능
 * url    : 링크를 누르면 이동할 페이지의 주소
 * secret : 비밀글 표시 사용 여부
 * read_allow  : 읽기 권한 (all, login, customer, business, admin)
 * write_allow : 쓰기 권한 (all, login, customer, business, admin)
 * reply  : 댓글 권한 (all, login, customer, business, admin)
 * modify : 수정 권한 (writer, admin)
 * remove : 삭제 권한 (writer, admin)
 * download : 첨부물 다운로드 권한 (all, login, customer, business, admin)
 * upload : 첨부물 업로드 권한 (all, login, customer, business, admin)
 * nAttach : 첨부 파일 수
 * aSize : 첨부파일 하나의 크기 제약
 */
create table board (
	board_id int not null primary key auto_increment,
	board_name varchar(40) not null,
	board_type varchar(20) not null,
	url varchar(100),
	secret char(1) default 'F',
	read_allow varchar(10),
	write_allow varchar(10),
	reply varchar(10),
	modify varchar(10),
	remove varchar(10),
	download varchar(10),
	upload varchar(10),
	nAttach int,
	aSize varchar(5),
	display_format int default 1,
	createdAt timestamp default current_timestamp,
	board_desc varchar(100)
);

drop table board;

select * from board;
update board set url='/article/list?board_id=1' where board_id = 1;

insert into board (board_name, board_type, url, secret, read_allow, write_allow, reply, modify, remove, download, upload, nAttach, aSize, display_format, board_desc)
			values ('시 모음', '기본', '/article/list?board_id=1&page=1', 'F', 'all', 'admin', 'not', 'admin', 'admin', 'login', 'admin', 5, '10MB', 1, '시를  모아놓은 곳');
insert into board (board_name, board_type, url, secret, read_allow, write_allow, reply, modify, remove, download, upload, nAttach, aSize, display_format, board_desc)
			values ('육아 정보', '기본', '/article/list?board_id=2&page=1', 'F', 'all', 'admin', 'not', 'admin', 'admin', 'login', 'admin', 5, '10MB', 1, '육아 정보를 모아놓은 곳');
insert into board (board_name, board_type, url, secret, read_allow, write_allow, reply, modify, remove, download, upload, nAttach, aSize, display_format, board_desc)
			values ('도시농업', '기본', '/article/list?board_id=3&page=1', 'F', 'all', 'admin', 'not', 'admin', 'admin', 'login', 'admin', 5, '10MB', 1, '도시농업에 대한 정보를 공유하는 곳');
insert into board (board_name, board_type, url, secret, read_allow, write_allow, reply, modify, remove, download, upload, nAttach, aSize, display_format, board_desc)
			values ('Android', '기본', '/article/list?board_id=4&page=1', 'F', 'all', 'admin', 'not', 'admin', 'admin', 'login', 'admin', 5, '10MB', 1, 'Android 앱을 개발하기 위하여 필요한 정보를 공유하는 게시판');
insert into board (board_name, board_type, url, secret, read_allow, write_allow, reply, modify, remove, download, upload, nAttach, aSize, display_format, board_desc)
			values ('Web(자바기반)', '기본', '/article/list?board_id=5&page=1', 'F', 'all', 'admin', 'not', 'admin', 'admin', 'login', 'admin', 5, '10MB', 1, '자바기반의 Web을 개발하기 위하여 필요한 정보를 공유하는 곳');
insert into board (board_name, board_type, url, secret, read_allow, write_allow, reply, modify, remove, download, upload, nAttach, aSize, display_format, board_desc)
			values ('임베디드', '기본', '/article/list?board_id=6&page=1', 'F', 'all', 'admin', 'not', 'admin', 'admin', 'login', 'admin', 5, '10MB', 3, '임베디드 기술에 대한 정보를 공유하는 곳');
insert into board (board_name, board_type, url, secret, read_allow, write_allow, reply, modify, remove, download, upload, nAttach, aSize, display_format, board_desc)
			values ('함께 만들어요', '기본', '/article/list?board_id=7&page=1', 'F', 'all', 'login', 'not', 'admin', 'admin', 'login', 'login', 5, '10MB', 1, '회원과 운영자가 함께 정보를 만들어 가는 곳');
insert into board (board_name, board_type, url, secret, read_allow, write_allow, reply, modify, remove, download, upload, nAttach, aSize, display_format, board_desc)
			values ('공지사항', '공지사항', '/article/list?board_id=8&page=1', 'F', 'all', 'admin', 'not', 'admin', 'admin', 'login', 'admin', 5, '10MB', 3, '관리자가 회원들에게 알리는 사항을 게시하는 곳');
insert into board (board_name, board_type, url, secret, read_allow, write_allow, reply, modify, remove, download, upload, nAttach, aSize, display_format, board_desc)
			values ('Q&A', 'Q&A', '/qna/list?board_id=9&page=1', 'T', 'all', 'all', 'admin', 'writer', 'writer', 'login', 'login', 3, '1MB', 1, '회원과 관리자간에 질문과 답변을 주고 받는 곳');
insert into board (board_name, board_type, url, secret, read_allow, write_allow, reply, modify, remove, download, upload, nAttach, aSize, display_format, board_desc)
			values ('방명록', '방명록', '/guestbook/list.?board_id=10&page=1', 'F', 'all', 'login', 'not', 'writer', 'writer', 'not', 'not', 0, '0', 3, '사이트의 방문자가 방문록을 남기는 곳');

/*
 * article : 게시판
 */
create table article (
	bId int not null primary key auto_increment,
	board_id int default 0,
	bName varchar(50) not null,
	bTitle varchar(200) not null,
	bContent text null,
	bIp varchar(20),
	bSecret char(1) default 'F',
	bCreatedAt timestamp not null default now(),
	bModifiedAt timestamp not null default current_timestamp on update current_timestamp,
	bHit int default 0,
	bComment int default 0,
	bLike int default 0,
	bGroup int not null,
	bStep int default 0,
	bIndent int default 0
);

select * from article;

update article set bName='kdhong@gmail.com', bGroup=1 where bId=1;
update article set bGroup = 11 where bId = 11;
update article set board_id=1 where bId = 252;
update article set bStep=2, bIndent=1 where bId=252;
update article set bStep=1, bIndent=1 where bId=253;
update article set bStep=2, bIndent=1 where bId=255;
update article set bStep=1, bIndent=1 where bId=256;

drop table article;

select max(bId) from article;

select * from article order by bGroup desc, bStep asc limit 0, 10;

insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 1', '내용 1', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 2', '내용 2', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 3', '내용 3', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 4', '내용 4', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 5', '내용 5', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 6', '내용 6', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 7', '내용 7', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 8', '내용 8', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 9', '내용 9', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 10', '내용 10', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 1', '내용 1', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 2', '내용 2', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 3', '내용 3', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 4', '내용 4', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 5', '내용 5', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 6', '내용 6', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 7', '내용 7', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 8', '내용 8', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 9', '내용 9', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 10', '내용 10', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 1', '내용 1', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 2', '내용 2', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 3', '내용 3', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 4', '내용 4', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 5', '내용 5', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 6', '내용 6', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 7', '내용 7', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 8', '내용 8', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 9', '내용 9', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 10', '내용 10', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 1', '내용 1', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 2', '내용 2', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 3', '내용 3', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 4', '내용 4', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 5', '내용 5', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 6', '내용 6', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 7', '내용 7', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 8', '내용 8', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 9', '내용 9', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 10', '내용 10', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 1', '내용 1', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 2', '내용 2', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 3', '내용 3', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 4', '내용 4', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 5', '내용 5', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 6', '내용 6', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 7', '내용 7', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 8', '내용 8', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 9', '내용 9', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 10', '내용 10', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 1', '내용 1', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 2', '내용 2', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 3', '내용 3', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 4', '내용 4', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 5', '내용 5', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 6', '내용 6', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 7', '내용 7', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 8', '내용 8', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 9', '내용 9', '127.0.0.1', last_insert_id()+1);
insert into article (board_id, bName, bTitle, bContent, bIp, bGroup) values (1, 'kdhong@gmail.com', '게시글 10', '내용 10', '127.0.0.1', last_insert_id()+1);

/*
 * attach table
 */
create table attach (
	fullName varchar(150) not null,
	bId int not null,
	regdate timestamp default now(),
	primary key (fullName)
);

alter table attach add constraint fk_article_attach foreign key (bId) references article (bId);

select * from attach;

drop table attach;

/*
 * setting_item : 시스템 파라미터 관리
 */
create table setting_item (
	parameterName varchar(100) not null primary key,
	value varchar(200) not null,
	createdAt timestamp not null default '0000-00-00 00:00:00',
	modifiedAt timestamp not null default current_timestamp on update current_timestamp
);

drop table setting_item;

create table music_server (
	id int not null primary key auto_increment,
	pid varchar(12) not null,
	title_ko text not null,
	author_ko text not null,
	title_en text not null,
	author_en text not null,
	genre int not null,
	play_time text not null,
	file_size int not null,
	file_info text,
	url_info text
);

drop table music_server;

select * from music_server limit 5000, 500;
select count(id) from music_server;

create table music_content (
	lid int primary key not null,
	pid varchar(12) not null
);

select * from music_content limit 0, 500;

drop table tbl_music_server_info;
drop table tbl_music_contents_info;

create table pds_item (
	id int primary key auto_increment,
	fileName varchar(200) not null,
	realPath varchar(200) not null,
	fileSize long,
	downloadCount int default 0,
	description varchar(255),
	articleId int,
	kind varchar(12)
);

show tables;

drop table pds_item;

desc pds_item;

select * from pds_item;
select * from pds_item where id=5034;
select count(id) from pds_item;
select * from pds_item limit 5000, 500;
update pds_item set realPath='D:\\zzz\\upload\\upload\\b9564b31-1d22-40e9-a5ef-23f1bb20d769_MusicListDB.db' where id=5034;
update pds_item set kind='123454321' where id=5034;

create table env_data (
	id int primary key auto_increment,
	temperature float not null,
	humidity float not null,
	illuminate int not null,
	soil_humid int not null,
	createdAt timestamp not null default current_timestamp
);

select * from env_data limit 0, 500;
select * from env_data limit 500, 500;
select * from env_data limit 1000, 500;