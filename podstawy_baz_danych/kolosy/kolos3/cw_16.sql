-- 4. Wybierz tytuły książek, gdzie ilość wypożyczeń książki jest większa od średniej ilości
-- wypożyczeń książek tego samego autora.
with t1 as (
select author, title, count(title) as cnt from title
join dbo.loanhist l on title.title_no = l.title_no
join member m on m.member_no = l.member_no
group by author, title
)
select title, cnt from t1 as t2 where cnt >
(select  avg( t1.cnt) from t1 where t1.author =t2.author)




