-- 4. Dla każdego czytelnika imię nazwisko, suma książek wypożyczony przez tą osobę i
-- jej dzieci, który żyje w Arizona ma mieć więcej niż 2 dzieci lub kto żyje w Kalifornii
-- ma mieć więcej niż 3 dzieci

with t1 as (select (firstname + ' ' + lastname) as Name, state,
(SELECT count(*) from loanhist lh where lh.member_no = a.member_no) +
(select count(*) from loanhist  lh1 join juvenile j1 on j1.member_no = lh1.member_no
and  j1.adult_member_no = a.member_no)
as BooksSum,
(Select count(*) from juvenile where a.member_no = juvenile.adult_member_no) as Kids
from member
join dbo.adult a on member.member_no = a.member_no
join dbo.juvenile j on a.member_no = j.adult_member_no
where state = 'AZ'),
t2 as (select (firstname + ' ' + lastname) as Name, state,
(SELECT count(*) from loanhist lh where lh.member_no = a.member_no)+
(select count(*) from loanhist  lh1 join juvenile j1 on j1.member_no = lh1.member_no
and j1.adult_member_no = a.member_no) as BooksSum,
(Select count(*) from juvenile where a.member_no = juvenile.adult_member_no) as Kids
from member join dbo.adult a on member.member_no = a.member_no
join dbo.juvenile j on a.member_no = j.adult_member_no
where state = 'CA')
SELECT Name, BooksSum, Kids, state from t1
where kids>2
union
SELECT Name, BooksSum, Kids, state from t2
where kids>3
order by BooksSum, Kids
