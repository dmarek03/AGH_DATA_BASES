-- 1. Wypisz wszystkich członków biblioteki z adresami i info czy jest dzieckiem czy nie i
-- ilość wypożyczeń w poszczególnych latach i miesiącach.

select  firstname, lastname,(street+' '+city+' '+state) as address, is_child ='False',
DATEPART(year ,lh.out_date) as year,DATEPART(month,lh.out_date) as month,
(count(lh.member_no)) as number_of_book  from  member m
inner join adult a on m.member_no = a.member_no
join loanhist lh on lh.member_no = m.member_no
group by DATEPART(year ,lh.out_date) , DATEPART(month,lh.out_date) ,firstname, lastname,(street+' '+city+' '+state)
UNION
select   firstname, lastname,(street+' '+city+' '+state) as address, is_child ='True',
DATEPART(year ,lh.out_date) as year, DATEPART(month,lh.out_date)  as month,
(count(lh.member_no)) as number_of_book  from  member m
inner join juvenile j on m.member_no = j.member_no
join adult on j.adult_member_no = adult.member_no
join loanhist lh on lh.member_no = m.member_no
group by  DATEPART(year ,lh.out_date) , DATEPART(month,lh.out_date),firstname, lastname,(street+' '+city+' '+state)
order by year,month
