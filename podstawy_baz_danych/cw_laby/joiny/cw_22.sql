-- 4. Podaj listę członków biblioteki mieszkających w Arizonie (AZ) mają więcej niż
-- dwoje dzieci zapisanych do biblioteki

select (ma.firstname +' '+ ma.lastname) as name, state,
count(j.member_no) as child_number from  adult a
join member ma on ma.member_no = a.member_no
join juvenile j on a.member_no = j.adult_member_no
join member mj on mj.member_no = j.member_no
where state = 'AZ'
group by (ma.firstname +' '+ ma.lastname) , state
having count(j.member_no) > 2
order by child_number desc