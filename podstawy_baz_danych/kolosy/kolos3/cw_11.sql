-- 3. Kategorie które w roku 1997 grudzień były obsłużone wyłącznie przez ‘United
-- Package’

select distinct  CategoryName,CompanyName from Categories C
join Products P on C.CategoryID = P.CategoryID
join dbo.[Order Details] "[O D]" on P.ProductID = "[O D]".ProductID
join dbo.Orders O on "[O D]".OrderID = O.OrderID
join dbo.Shippers S on O.ShipVia = S.ShipperID
where year(ShippedDate) = 1997 and month(ShippedDate) = 12 and CompanyName = 'United Package'
and CategoryName not in (select distinct CategoryName from Categories C1
join Products P1 on C1.CategoryID = P1.CategoryID
join dbo.[Order Details] "[O D]1" on P1.ProductID = "[O D]1".ProductID
join dbo.Orders O1 on "[O D]1".OrderID = O1.OrderID
join dbo.Shippers S1 on O1.ShipVia = S1.ShipperID
where year(ShippedDate) = 1997 and month(ShippedDate) = 12 and CompanyName != 'United Package')