-- 1. Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza
-- library). Interesuje nas imię, nazwisko, data urodzenia dziecka i adres
-- zamieszkania dziecka.

select firstname, lastname, birth_date, (street +' '+city +' '+state) as adress from  member m
join juvenile j on m.member_no = j.member_no
join adult a on j.adult_member_no = a.member_no