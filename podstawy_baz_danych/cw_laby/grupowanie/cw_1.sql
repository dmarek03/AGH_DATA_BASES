-- 1. Podaj liczbę produktów o cenach mniejszych niż 10$ lub większych niż 20$
select count(ProductID) as count from Products
where UnitPrice not between 10 and 20