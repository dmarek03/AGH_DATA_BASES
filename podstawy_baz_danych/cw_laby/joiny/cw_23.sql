-- 1. Podaj listę członków biblioteki mieszkających w Arizonie (AZ) którzy mają więcej
-- niż dwoje dzieci zapisanych do biblioteki oraz takich którzy mieszkają w Kaliforni
-- (CA) i mają więcej niż troje dzieci zapisanych do biblioteki

select (ma.firstname +' '+ ma.lastname) as name, state,
count(mj.member_no) as child_number from adult a
join member ma on a.member_no = ma.member_no
join juvenile j on a.member_no = j.adult_member_no
join member mj on mj.member_no = j.member_no
where state = 'AZ'
group by (ma.firstname +' '+ ma.lastname) , state
having count(mj.member_no) > 2
UNION
select (ma.firstname +' '+ ma.lastname) as name, state,
count(mj.member_no) as child_number from adult a
join member ma on a.member_no = ma.member_no
join juvenile j on a.member_no = j.adult_member_no
join member mj on mj.member_no = j.member_no
where state = 'CA'
group by (ma.firstname +' '+ ma.lastname) , state
having count(mj.member_no) > 3
order by state, child_number desc


