-- Który z pracowników obsłużył najaktywniejszy (obsłużył zamówienia o
-- największej wartości) w 1997r, podaj imię i nazwisko takiego pracownika

select top 1 E.FirstName, E.LastName,
round(sum((1-OD.Discount)*(OD.Quantity*OD.UnitPrice)),2) as total_cost from Employees E
join Orders O on E.EmployeeID = O.EmployeeID
join dbo.[Order Details] OD on O.OrderID = OD.OrderID
where YEAR(O.OrderDate) = 1997
group by E.FirstName, E.LastName
order by total_cost desc