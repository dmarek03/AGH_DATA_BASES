-- 3. Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień obsłużonych przez tego pracownika

select E.FirstName, E.LastName, round(sum((1-OD.Discount)*(OD.UnitPrice*OD.Quantity)),2)
as total_cost from Employees E
join Orders O on E.EmployeeID = O.EmployeeID
join [Order Details] OD on O.OrderID = OD.OrderID
group by E.FirstName, E.LastName
order by total_cost desc