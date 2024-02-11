-- 1.a) Wyświetl imię, nazwisko, dane adresowe oraz ilość wypożyczonych książek dla
-- każdego członka biblioteki. Ilość wypożyczonych książek nie może być nullem, co najwyżej zerem.
-- b) j/w + informacja, czy dany członek jest dzieckiem
--a)
select firstname, lastname, (street +' '+ city +' '+state) as address,
count(l.member_no) as number_of_book from member m
join adult a on m.member_no = a.member_no
left join loanhist l on m.member_no = l.member_no
group by firstname, lastname, (street +' '+ city +' '+state)
UNION
select  m.firstname, m.lastname, (street +' '+ city +' '+state) as address,
count(m.member_no) as number_of_book from member m
join juvenile j on m.member_no = j.member_no
join adult a on j.adult_member_no = a.member_no
left join loanhist l on m.member_no = l.member_no
group by firstname, lastname, (street +' '+ city +' '+state)
order by number_of_book desc

--b)

select  firstname, lastname, (street +' '+ city +' '+state) as address,
count(m.member_no) as number_of_book, is_child = 'False' from member m
join adult a on m.member_no = a.member_no
join loan l on m.member_no = l.member_no
group by firstname, lastname, (street +' '+ city +' '+state)
UNION
select  m.firstname, m.lastname, (street +' '+ city +' '+state) as address,
count(m.member_no) as number_of_book, is_child = 'True' from member m
join juvenile j on m.member_no = j.member_no
join adult a on j.adult_member_no = a.member_no
join loan l on m.member_no = l.member_no
group by firstname, lastname, (street +' '+ city +' '+state)
order by number_of_book desc









