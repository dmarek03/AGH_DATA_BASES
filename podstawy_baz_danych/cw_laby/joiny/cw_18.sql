-- 4. Napisz polecenie, które wyświetla adresy członków biblioteki, którzy mają dzieci
-- urodzone przed 1 stycznia 1996. Interesują nas tylko adresy takich członków
-- biblioteki, którzy aktualnie nie przetrzymują książek.

select  distinct a.member_no,(street+' '+city+' '+state) as adress from adult a
join juvenile j on a.member_no = j.adult_member_no
-- left join loan l  on a.member_no = l.member_no
-- where birth_date < '1/1/1996' and (getdate() < due_date or l.member_no is NUll)
where birth_date < '1/1/1996' and a.member_no not in (select l1.member_no from loan l1)

-- w którym kwartale naliczono najwięcej kar za nieprzetrzymywanie książek

select count(l.member_no) as fine_number , DATEPART(quarter , l.in_date) as quartal from loanhist l
join member m on l.member_no = m.member_no
where in_date <= due_date  and isnull(fine_assessed, 0) > 0
group by DATEPART(quarter , l.in_date)

