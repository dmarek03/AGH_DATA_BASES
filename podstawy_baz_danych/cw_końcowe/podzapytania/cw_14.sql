-- 2. Który z pracowników obsłużył najaktywniejszy (obsłużył zamówienia o
-- największej wartości) w 1997r, podaj imię i nazwisko takiego pracownika

select top 1 FirstName, LastName, ROUND((select sum((1-Discount)*(Quantity*UnitPrice)) from [Order Details] OD
inner join dbo.Orders O on O.OrderID = OD.OrderID and E.EmployeeID = O.EmployeeID)
+ (select sum(O.Freight) from Orders O where E.EmployeeID = O.EmployeeID and YEAR(ShippedDate)=1997),2)
as total_cost_of_served_orders from Employees E
order by total_cost_of_served_orders desc