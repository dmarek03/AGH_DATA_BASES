-- 1. Wybierz nazwy i ceny produktów (baza northwind) o cenie jednostkowej
-- pomiędzy 20.00 a 30.00, dla każdego produktu podaj dane adresowe dostawcy

select ProductName, UnitPrice, (S.Address +' '+S.Country+' '+S.City ) as adress from Products P
join Suppliers S on P.SupplierID = S.SupplierID
where UnitPrice between  20 and 30
