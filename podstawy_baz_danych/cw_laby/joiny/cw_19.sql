-- 1. Napisz polecenie które zwraca imię i nazwisko (jako pojedynczą kolumnę –
-- name), oraz informacje o adresie: ulica, miasto, stan kod (jako pojedynczą
-- kolumnę – address) dla wszystkich dorosłych członków biblioteki

select (firstname +' '+ lastname) as name ,
(street +' '+ city +' '+state +' '+ zip) as address from member m
join adult a  on m.member_no = a.member_no
