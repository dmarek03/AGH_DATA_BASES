-- 5. Zmodyfikuj poprzedni przykład tak żeby dodać jeszcze imię i nazwisko pracownika obsługującego zamówienie

select O.orderid,C.CompanyName, E.FirstName, E.LastName,sum(Quantity) as total_quantity
,ROUND(sum((1-Discount)*(Quantity*UnitPrice)),2) as total_cost from Orders O
join dbo.[Order Details] OD on O.OrderID = OD.OrderID
join Customers C on O.CustomerID = C.CustomerID
join Employees E on E.EmployeeID = O.EmployeeID
group by O.orderid,C.CompanyName,E.FirstName, E.LastName
having sum(Quantity) > 250
order by total_cost desc