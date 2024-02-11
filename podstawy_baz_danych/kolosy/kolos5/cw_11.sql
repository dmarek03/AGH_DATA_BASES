-- zad 2)
-- Wyświetl numery zamówień złożonych w od marca do maja 1997, które były
-- przewożone przez firmę 'United Package' i nie zawierały produktów z kategorii
-- "confections". (baza northwind)

select O.OrderID from Orders O
join Shippers S on O.ShipVia = S.ShipperID
join [Order Details] OD on O.OrderID = OD.OrderID
join Products P on OD.ProductID = P.ProductID
join dbo.Categories C on P.CategoryID = C.CategoryID
where OrderDate between '1997.03.01' and '1997.05.31' and S.CompanyName = 'United Package'
and O.OrderID not in (select O1.OrderID from Orders O1
join dbo.[Order Details] "[O D]" on O1.OrderID = "[O D]".OrderID
join Shippers S1 on O1.ShipVia = S1.ShipperID
join Products P1 on "[O D]".ProductID = P1.ProductID
join dbo.Categories C2 on P1.CategoryID = C2.CategoryID
where C2.CategoryName = 'Confections')