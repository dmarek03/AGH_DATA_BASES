--1. Jaki był najpopularniejszy autor wśród dzieci w Arizonie w 2001

select top 1 author, COUNT(title) as cnt from loanhist lh
join title t on lh.title_no = t.title_no
join juvenile j on lh.member_no = j.member_no
join adult a on j.adult_member_no = a.member_no
where state = 'AZ' and YEAR(out_date) = 2001
group by author
order by cnt desc
