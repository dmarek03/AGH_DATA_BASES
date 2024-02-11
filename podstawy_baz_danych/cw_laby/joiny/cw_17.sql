-- 3. Napisz polecenie, które wyświetla adresy członków biblioteki, którzy mają dzieci
-- urodzone przed 1 stycznia 1996

select distinct a.member_no,  (street +' '+ city +' '+ state) as adress from adult a
join juvenile j on a.member_no = j.adult_member_no
where birth_date< '1/1/1996'
order by adress