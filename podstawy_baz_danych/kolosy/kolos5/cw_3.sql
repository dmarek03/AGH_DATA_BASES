-- zad 3)
-- Podaj listę dzieci będących członkami biblioteki, które w dniu '2001-12-14'
-- zwróciły do biblioteki książkę o tytule 'Walking'. Zbiór wynikowy powinien zawierać
-- imię i nazwisko oraz dane adresowe dziecka. (baza library)



select firstname, lastname ,(street+' '+city+' '+state) as address , in_date from member m
join juvenile j on m.member_no = j.member_no
join dbo.adult a on j.adult_member_no = a.member_no
join loanhist lh on lh.member_no =j.member_no
join title on lh.title_no = title.title_no
where year(in_date) =  2001 and month(in_date) = 12 and day(in_date) = 14  and title = 'Walking'

