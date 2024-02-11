-- 2. Wypisać wszystkich czytelników, którzy nigdy nie wypożyczyli książki dane
-- adresowe i podział czy ta osoba jest dzieckiem (joiny, in, exists)

--joiny)
select  firstname,lastname,(street+' '+city+' '+state) as address, is_child ='False'  from member m
inner join dbo.adult a on m.member_no = a.member_no
left join loanhist lh on lh.member_no = m.member_no
left join loan l on l.member_no = m.member_no
where  lh.member_no  is null and  l.member_no is null
union
select firstname,lastname,(street+' '+city+' '+state) as address, is_child ='True'  from member m
inner join juvenile j on m.member_no = j.member_no
inner join adult a on j.adult_member_no = a.member_no
left join loanhist lh on lh.member_no = m.member_no
left join loan l on l.member_no = m.member_no
where  lh.member_no  is null and  l.member_no is null
order by  firstname, lastname, address

-- not in)
select firstname,lastname,(street+' '+city+' '+state) as address, is_child ='False'  from member m
inner join dbo.adult a on m.member_no = a.member_no
where m.member_no not in (select lh.member_no from loanhist lh)
and m.member_no not in (select l.member_no from loan l)
union
select firstname,lastname,(street+' '+city+' '+state) as address, is_child ='True'  from member m
inner join juvenile j on m.member_no = j.member_no
inner join adult a on j.adult_member_no = a.member_no
where m.member_no not in (select lh.member_no from loanhist lh)
and m.member_no not in (select l.member_no from loan l)
order by  firstname, lastname, address

-- exists)

select firstname,lastname,(street+' '+city+' '+state) as address, is_child ='False'  from member m
join dbo.adult a on m.member_no = a.member_no
where not exists(select lh.member_no from loanhist lh where lh.member_no = m.member_no)
and not exists(select l.member_no from loan l where l.member_no = m.member_no)
union
select firstname,lastname,(street+' '+city+' '+state) as address, is_child ='True'  from member m
inner join juvenile j on m.member_no = j.member_no
inner join adult a on j.adult_member_no = a.member_no
where not exists(select lh.member_no from loanhist lh where lh.member_no = m.member_no)
and not exists(select l.member_no from loan l where l.member_no = m.member_no)
order by firstname, lastname, address



