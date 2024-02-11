-- 1. Wybierz nazwy i ceny produktów (baza northwind) o cenie jednostkowej
-- pomiędzy 20.00 a 30.00, dla każdego produktu podaj dane adresowe dostawcy,
-- interesują nas tylko produkty z kategorii ‘Meat/Poultry

select  ProductName, UnitPrice, CompanyName, CategoryName,(Address +' '+Country +' '+City)
as adress from Products P
join Categories C on P.CategoryID = C.CategoryID
join Suppliers S on P.SupplierID = S.SupplierID
where UnitPrice between  20 and 30 and CategoryName = 'Meat/Poultry'
