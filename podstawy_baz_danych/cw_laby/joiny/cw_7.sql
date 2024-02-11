-- 3. Podaj informacje o karach zapłaconych za przetrzymywanie książki o tytule ‘Tao
-- Teh King’. Interesuje nas data oddania książki, ile dni była przetrzymywana i jaką
-- zapłacono karę

select title,  in_date, datediff(day, due_date,in_date) as day_diff,
(fine_paid-fine_waived) as fine_paid from loanhist l
join title t on l.title_no = t.title_no
where title = 'Tao Teh King' and in_date > due_date