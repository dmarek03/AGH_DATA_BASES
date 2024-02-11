-- 4. Wybierz klientów, którzy kupili przedmioty wyłącznie z jednej kategorii w marcu
-- 1997 i wypisz nazwę tej kategorii


select distinct CompanyName, CategoryName from Customers C
join dbo.Orders O on C.CustomerID = O.CustomerID
join dbo.[Order Details] "[O D]" on O.OrderID = "[O D]".OrderID
join Products P on "[O D]".ProductID = P.ProductID
join dbo.Categories C2 on P.CategoryID = C2.CategoryID
where YEAR(OrderDate) =1997 and MONTH(OrderDate) = 3
and C.CustomerID  in (
    select distinct  C.CustomerID from Customers C
    join dbo.Orders O2 on C.CustomerID = O2.CustomerID
    join dbo.[Order Details] "[O D]" on O2.OrderID = "[O D]".OrderID
    join Products P2 on "[O D]".ProductID = P2.ProductID
    join Categories C3 on P2.CategoryID = C3.CategoryID
    where YEAR(OrderDate) =1997 and MONTH(OrderDate) = 3
    group by C.CustomerID
    having COUNT(distinct C3.CategoryID) = 1
    )

























