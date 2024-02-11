-- zad 3)
-- Podaj tytuły książek wypożyczonych (aktualnie) przez dzieci mieszkające w Arizonie
-- (AZ). Zbiór wynikowy powinien zawierać imię i nazwisko członka biblioteki
-- (dziecka), jego adres oraz tytuł wypożyczonej książki. Jeśli jakieś dziecko
-- mieszkająca w Arizonie nie ma wypożyczonej żadnej książki to też powinno znaleźć
-- się na liście, a w polu przeznaczonym na tytuł książki powinien pojawić się napis
-- BRAK. (baza library)

select firstname, lastname, (street+' '+city+' '+state) as address, title from  member m
join dbo.juvenile j on m.member_no = j.member_no
join dbo.adult a on a.member_no = j.adult_member_no
join dbo.loan l on m.member_no = l.member_no
join title t on l.title_no = t.title_no
where state = 'AZ'
UNION
select firstname, lastname, (street+' '+city+' '+state) as address, title='BRAK' from  member m
join dbo.juvenile j on m.member_no = j.member_no
join dbo.adult a on a.member_no = j.adult_member_no
where state = 'AZ' and j.member_no not in (select lh1.member_no from loanhist lh1)
order by firstname, lastname
