-- 4. Wybierz nazwy i ceny produktów z kategorii ‘meat’

select ProductName, UnitPrice from Products
where CategoryID  = (select CategoryID from Categories
where CategoryName like '%meat%')
order by UnitPrice desc

select ProductName, UnitPrice from Products
where CategoryID = 6
order by UnitPrice desc

