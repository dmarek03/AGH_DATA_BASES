-- 1. Szukamy informacji o produktach o cenach mniejszych niż 10 lub większych niż 20

select * from Products
where UnitPrice not between 10 and 20
order by UnitPrice desc