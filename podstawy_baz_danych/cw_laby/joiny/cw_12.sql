-- 4. Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii
-- ‘Confections

select distinct CompanyName, Phone, CategoryName from Customers C
join dbo.Orders O on C.CustomerID = O.CustomerID
join dbo.[Order Details] "[O D]" on O.OrderID = "[O D]".OrderID
join Products P on "[O D]".ProductID = P.ProductID
join Categories CC on P.CategoryID = CC.CategoryID
where CategoryName = 'Confections'