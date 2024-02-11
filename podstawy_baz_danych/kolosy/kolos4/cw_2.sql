-- Zad.2. Wyświetl wszystkich członków biblioteki (imię i nazwisko, adres)
-- rozróżniając dorosłych i dzieci (dla dorosłych podaj liczbę dzieci),
-- którzy nigdy nie wypożyczyli książki

-- join)
select m.firstname, m.lastname, (street+' '+city+' '+state) as address,
count(j.adult_member_no) as number_of_child, Adult = 'Adult' from member m
join dbo.adult a on m.member_no = a.member_no
left join dbo.juvenile j on j.adult_member_no = a.member_no
left join dbo.loan l on m.member_no = l.member_no
left join loanhist lh on lh.member_no = m.member_no
where l.member_no is null and lh.member_no is null
group by firstname, lastname, (street+' '+city+' '+state)
UNION
select firstname, lastname, (street+' '+city+' '+state) as address,
NUll, Child = 'Child' from member m
join dbo.juvenile j on m.member_no = j.member_no
join adult on j.adult_member_no = adult.member_no
left join dbo.loan l on m.member_no = l.member_no
left join loanhist lh on lh.member_no = m.member_no
where l.member_no is null and lh.member_no is null
group by firstname, lastname, (street+' '+city+' '+state)
order by number_of_child desc

-- not in)

select (m.firstname+' '+m.lastname) as name ,
(street+' '+city+' '+state) as address,
count(j.adult_member_no) as number_of_child, Adult = 'Adult' from member m
join dbo.adult a on m.member_no = a.member_no
left join dbo.juvenile j on a.member_no = j.adult_member_no
where a.member_no not in (select lh.member_no from loanhist lh union select l.member_no from loan l )
group by (firstname+' '+lastname),(street+' '+city+' '+state)
UNION
select (m.firstname+' '+m.lastname) as name ,
(street+' '+city+' '+state) as address,
NUll, Child  = 'Child' from member m
join juvenile j on m.member_no = j.member_no
join adult a on j.adult_member_no = a.member_no
where j.member_no not in
(select lh.member_no from loanhist lh union select l.member_no from loan l)
group by (firstname+' '+lastname),(street+' '+city+' '+state)
order by name, number_of_child


-- exists)

select (m.firstname+' '+m.lastname) as name ,
(street+' '+city+' '+state) as address,
count(j.adult_member_no) as number_of_child, Adult = 'Adult' from member m
join dbo.adult a on m.member_no = a.member_no
left join dbo.juvenile j on a.member_no = j.adult_member_no
where not exists (select lh.member_no from loanhist lh  where lh.member_no = m.member_no)
and not exists(select l.member_no from loan l where l.member_no = m.member_no)
group by (firstname+' '+lastname),(street+' '+city+' '+state)
UNION
select (m.firstname+' '+m.lastname) as name ,
(street+' '+city+' '+state) as address,
NUll, Child  = 'Child' from member m
join juvenile j on m.member_no = j.member_no
join adult a on j.adult_member_no = a.member_no
where not exists(select lh.member_no from loanhist lh where lh.member_no = j.member_no) and
not exists(select l.member_no from loan l where l.member_no = j.member_no)
group by (firstname+' '+lastname),(street+' '+city+' '+state)
order by name, number_of_child




