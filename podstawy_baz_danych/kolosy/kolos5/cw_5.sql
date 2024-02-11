-- zad 2)
-- Podaj listę dzieci będących członkami biblioteki, które w dniu '2001-12-14' nie
-- zwróciły do biblioteki książki o tytule 'Walking'. Zbiór wynikowy powinien zawierać
-- imię i nazwisko oraz dane adresowe dziecka. (baza library)

select distinct firstname, lastname, (street+' '+city+' '+state) as address from member m
inner join juvenile j on m.member_no = j.member_no
inner join dbo.adult a on a.member_no = j.adult_member_no
inner join loanhist lh on lh.member_no = j.member_no
where j.member_no not in (select lh.member_no from loanhist lh
join title t on lh.title_no = t.title_no
where YEAR(in_date) = 2001 and MONTH(in_date) = 12 and DAY(in_date) = 14 and title = 'Walking')