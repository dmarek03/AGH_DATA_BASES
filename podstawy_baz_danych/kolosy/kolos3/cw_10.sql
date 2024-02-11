-- 2. Dla każdego dziecka wybierz jego imię nazwisko, adres, imię i nazwisko rodzica i
-- ilość książek, które oboje przeczytali w 2001

with t1 as(
    select a.member_no, count (lh.member_no) + (select count(lh1.member_no) from loanhist lh1
    join juvenile j on j.member_no =lh1.member_no and j.adult_member_no = a.member_no )
    as read_book from loanhist lh
    join adult a on lh.member_no = a.member_no
    where year(out_date) =2001
    group by a.member_no
)
select firstname, lastname,(select m1.lastname from member m1
join dbo.adult a2 on m1.member_no = a2.member_no and a2.member_no = j.adult_member_no)
as parent_lastname, (street+' '+city+' '+city) as adress,
(select read_book from t1 where t1.member_no = a.member_no) as number_of_read_book
from member m
join dbo.juvenile j on m.member_no = j.member_no
join dbo.adult a on a.member_no = j.adult_member_no
order by lastname, parent_lastname

