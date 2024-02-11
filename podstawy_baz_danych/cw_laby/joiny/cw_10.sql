-- 2. Wybierz nazwy i ceny produktów z kategorii ‘Confections’ dla każdego produktu
-- podaj nazwę dostawcy.

select ProductName, UnitPrice, CompanyName from Products P
join Categories C on P.CategoryID = C.CategoryID
join Suppliers S on P.SupplierID = S.SupplierID
where CategoryName = 'Confections'
order by UnitPrice desc