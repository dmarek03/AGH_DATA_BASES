-- 2. wyświetl imiona i nazwiska osób, które nigdy nie wypożyczyły żadnej książki
-- a) bez podzapytań
-- b) podzapytaniami

--a)
select firstname, lastname from member m
left join loan on m.member_no = loan.member_no
left join loanhist l on l.member_no = m.member_no
where loan.member_no is  null and l.member_no is null
order by lastname desc


--b)
select firstname, lastname from member m
where m.member_no not in  (select loanhist.member_no from loanhist)
and member_no not in (select loan.member_no from loan)
order by lastname desc
