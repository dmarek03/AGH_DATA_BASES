-- 2. Napisz polecenie, które podaje tytuły aktualnie wypożyczonych książek

select distinct title from loan l
inner  join title t on l.title_no = t.title_no
