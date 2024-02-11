-- 2)
-- Podaj tytuły książek, które nie są aktualnie zarezerwowane przez dzieci mieszkające
-- w Arizonie (AZ). (baza library)

select distinct title from title
join item on title.title_no = item.title_no
join reservation r on item.isbn = r.isbn
where r.member_no not  in (select j.member_no from juvenile j
join dbo.adult a on a.member_no = j.adult_member_no
join member m on j.member_no = m.member_no where state ='AZ')