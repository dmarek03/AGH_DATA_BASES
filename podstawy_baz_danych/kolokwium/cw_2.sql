--tytuły książek, pożyczonych przez więcej niż 1 czytelnika

select firstname, lastname , title from member m
join adult a on m.member_no = a.member_no
join loanhist lh on lh.member_no = m.member_no
join title t on t.title_no = lh.title_no
where a.member_no in (select j.adult_member_no from juvenile j ) and
(select count(lh1.member_no) from loanhist lh1
join title t1 on lh1.title_no = t1.title_no and
lh1.member_no = a.member_no and t.title_no = t1.title_no) > 2
group by firstname, lastname , title



