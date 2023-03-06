create table kh_member(
   kh_id varchar2(30),
   kh_pw varchar2(30),
   kh_name varchar2(30),
   kh_tel varchar2(30),
   PRIMARY KEY (kh_id)
);

delete from kh_member;
select * from kh_member;
drop table kh_member purge;

insert into KH_MEMBER (kh_id, kh_pw, kh_name, kh_tel) values ('admin', '1234', '이학연', '01094077182');
insert into KH_MEMBER (kh_id, kh_pw, kh_name, kh_tel) values ('dlgkrdus7898', '1234', '이학연', '01094077182');
create table kh_boardq(
   q_num number,
   q_id varchar2(30),
   q_subject varchar2(30),
   q_content varchar2(1000),
   q_re_ref number,
   q_re_lev number,
   q_re_seq number,
   q_date date,
   q_readcount number,
   PRIMARY KEY (q_num)
);

select * from KH_BOARDQ;
drop table kh_boardq purge;
delete from kh_boardq;  

create table kh_boardr(
   r_num number,
   r_id varchar2(30),
   r_subject varchar2(30),
   r_content varchar2(1000),
   r_date date,
   r_readcount number,
   PRIMARY KEY (r_num)
);

drop table kh_boardr purge;

select * from kh_boardr;

create table kh_boardn(
   n_num number,
   n_subject varchar2(30),
   n_content varchar2(1000),
   n_date date,
   n_file varchar2(100),
   n_readcount number,
   
   PRIMARY KEY (n_num)
);

select * from kh_boardn;
drop table kh_boardn purge;

create table kh_product(
   p_num number,
   P_file varchar2(30),
   p_name varchar2(30),
   p_level number,
   p_content varchar2(1000),
   p_pre varchar2(1000),
   p_place varchar2(1000),
   PRIMARY KEY (p_num)
);

select * from kh_product;

drop table kh_product purge;

create table kh_book(
   b_num number,
   b_id varchar2(30),
   b_product varchar2(30),
   b_pnum number,
   b_name varchar2(30),
   b_date date,
   b_tel varchar2(30),
   b_inwon number,
   b_time varchar2(30),
   
   PRIMARY KEY (b_num)
);

drop table kh_book purge;

alter table kh_boardq add constraint q_id foreign key(q_id) references kh_member(kh_id) on delete cascade;

alter table kh_boardr add constraint r_id foreign key(r_id) references kh_member(kh_id) on delete cascade;

alter table kh_book add  constraint b_name foreign key(b_id) references kh_member(kh_id) on delete cascade;

alter table kh_book add constraint b_product foreign key(b_pnum) references kh_product(p_num) on delete cascade;

ALTER TABLE kh_boardq DROP CONSTRAINT q_id;

ALTER TABLE kh_boardr DROP CONSTRAINT r_id;

ALTER TABLE kh_book DROP CONSTRAINT b_name;

ALTER TABLE kh_book DROP CONSTRAINT b_product;

SELECT * FROM    ALL_CONSTRAINTS
WHERE    TABLE_NAME = 'kh_product';

select q_num, q_id, q_subject, q_content, q_re_ref, q_re_lev, q_re_seq, q_date,q_readcount 
from (select * from kh_boardq order by q_re_ref desc, q_re_seq asc);


select * from 
(select q_num, q_id, q_subject, q_content, q_re_ref, q_re_lev, q_re_seq, q_date,q_readcount 
from (select * from kh_boardq order by q_re_ref desc, q_re_seq asc)) 
where ROW_NUMBER() > 5;

SELECT * FROM
(SELECT * FROM(SELECT ROWNUM AS SEQ, q_num, q_id, q_subject, q_content, q_re_ref, q_re_lev, q_re_seq, q_date,q_readcount
FROM( SELECT * FROM kh_boardq order by q_re_ref desc, q_re_seq asc )) WHERE SEQ >= 11 )
WHERE ROWNUM <= 10;

alter table kh_boardn ADD n_file VARCHAR2(30);