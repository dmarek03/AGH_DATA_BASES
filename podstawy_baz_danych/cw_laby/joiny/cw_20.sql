-- 2. Napisz polecenie, które zwraca: isbn, copy_no, on_loan, title, translation, cover,
-- dla książek o isbn 1, 500 i 1000. Wynik posortuj wg ISBN

select distinct  c.isbn, copy_no, on_loan, title, translation, cover  from copy c
join title t on c.title_no = t.title_no
join item i on t.title_no = i.title_no
where c.isbn in ('1', '500', '1000')
order by c.isbn