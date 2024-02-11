-- 1. Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza library).
-- Interesuje nas imię, nazwisko i data urodzenia dziecka
select lastname, firstname, birth_date from member m
inner  join juvenile j on m.member_no = j.member_no

