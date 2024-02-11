-- zad 1)
-- Podaj nazwy produktów które w marcu 1997 nie były kupowane przez klientów z
-- Francji. Dla każdego takiego produktu podaj jego nazwę, nazwę kategorii do której
-- należy ten produkt oraz jego cenę.

select distinct ProductName, P.UnitPrice, CategoryName from Products P
join dbo.Categories C on C.CategoryID = P.CategoryID
join dbo.[Order Details] OD on P.ProductID = OD.ProductID
join dbo.Orders O on O.OrderID = OD.OrderID
where YEAR(OrderDate) = 1997 and month(OrderDate) = 3 and  P.ProductID not in
(select P1.ProductID from Products P1
join dbo.[Order Details] "[O D]" on P1.ProductID = "[O D]".ProductID
join dbo.Orders O1 on O1.OrderID = "[O D]".OrderID
join Customers C on O1.CustomerID = C.CustomerID
where YEAR(O1.OrderDate) = 1997 and  month(O1.OrderDate) =3 and Country = 'France')
order by P.UnitPrice desc