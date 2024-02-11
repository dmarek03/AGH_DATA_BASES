-- zad 2)
-- Pokaż nazwy produktów, kategorii 'Beverages' które nie były kupowane w okresie
-- od '1997.02.20' do '1997.02.25' Dla każdego takiego produktu podaj jego nazwę,
-- nazwę dostawcy (supplier), oraz nazwę kategorii. Zbiór wynikowy powinien
-- zawierać nazwę produktu, nazwę dostawcy oraz nazwę kategorii. (baza northwind)

select distinct ProductName, CategoryName, S.CompanyName from Products P
join Categories C on P.CategoryID = C.CategoryID
join Suppliers S on P.SupplierID = S.SupplierID
join dbo.[Order Details] "[O D]" on P.ProductID = "[O D]".ProductID
join Orders O on "[O D]".OrderID = O.OrderID
where OrderDate  not between '1997.02.20' and '1997.02.25' and CategoryName ='Beverages'
