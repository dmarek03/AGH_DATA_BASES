-- 2. Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza
-- library). Interesuje nas imię, nazwisko, data urodzenia dziecka, adres
-- zamieszkania dziecka oraz imię i nazwisko rodzica.

select (m.firstname +' '+ m.lastname) as child_name , birth_date,
(ma.firstname +' '+ ma.lastname) as parent,
(a.street +' '+ a.city +' '+ a.state) as adress from member m
join juvenile j on m.member_no = j.member_no
join adult a on a.member_no = j.adult_member_no
join member ma on ma.member_no=a.member_no


