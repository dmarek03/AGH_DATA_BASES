-- 1. Wybierz dzieci wraz z adresem, które nie wypożyczyły książek w lipcu 2001
-- autorstwa ‘Jane Austin’

select distinct firstname, lastname, (street+' '+city+' '+state) as address from member m
join dbo.juvenile j on m.member_no = j.member_no
join dbo.adult a on j.adult_member_no = a.member_no
join loanhist lh on lh.member_no = m.member_no
where j.member_no not in (
    select lh1.member_no from loanhist lh1
    --join juvenile j1 on lh1.member_no = j1.member_no
    join title t on lh1.title_no = t.title_no
    where YEAR(lh1.out_date) =2001 and MONTH(lh1.out_date) = 7 and author = 'Jane Austin'
                                               )
order by firstname, lastname desc


select distinct firstname, lastname, (street+' '+city+' '+state) as address from member m
join dbo.juvenile j on m.member_no = j.member_no
join dbo.adult a on j.adult_member_no = a.member_no
join loanhist lh on lh.member_no = m.member_no
where not exists (
    (select lh1.member_no from loanhist lh1
    --join juvenile j1 on lh1.member_no = j1.member_no
    join title t on lh1.title_no = t.title_no
    where YEAR(lh1.out_date) =2001 and MONTH(lh1.out_date) = 7 and author = 'Jane Austen'
                                               ))
order by firstname, lastname desc

