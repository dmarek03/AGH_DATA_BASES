-- zad 1)
-- Podaj tytuły książek zarezerwowanych przez dorosłych członków biblioteki
-- mieszkających w Arizonie (AZ). Zbiór wynikowy powinien zawierać imię i nazwisko
-- członka biblioteki, jego adres oraz tytuł zarezerwowanej książki. Jeśli jakaś osoba
-- dorosła mieszkająca w Arizonie nie ma zarezerwowanej żadnej książki to też
-- powinna znaleźć się na liście, a w polu przeznaczonym na tytuł książki powinien
-- pojawić się napis BRAK. (baza library)

with t1 as (
select a.member_no, firstname, lastname, (street+' '+city+' '+state) as address, title from member m
join dbo.adult a on m.member_no = a.member_no
join reservation r on m.member_no = r.member_no
join item on r.isbn = item.isbn
join title on item.title_no = title.title_no
where state = 'AZ')
select mm.firstname, mm.lastname,(a2.street+' '+a2.city+' '+a2.state) as address,
isnull(title, 'BRAK') as title from t1
right join member mm on mm.member_no = t1.member_no
join dbo.adult a2 on mm.member_no = a2.member_no and state ='AZ'
order by firstname, lastname


-- Rozwiązanie z union

select firstname, lastname, (street+' '+city+' '+state) as address, title from member m
join dbo.adult a on m.member_no = a.member_no
join reservation r on m.member_no = r.member_no
join item on r.isbn = item.isbn
join title on item.title_no = title.title_no
where state = 'AZ'
union
select firstname, lastname, (street+' '+city+' '+state) as address,title = 'BRAK' from member m
join dbo.adult a on m.member_no = a.member_no
where state = 'AZ' and m.member_no not in (select r.member_no from reservation r)