-- Podaj łączna liczbę i wartość obsłużonych zamówień wszystkich pracowników w lutym 1997
-- (pamiętaj o opłacie za przesyłkę) , wyświetl także pracowników którzy nie mają żadnych zamówień

with  t1 as (
select E.EmployeeID, FirstName, LastName, Count(O.EmployeeID) as number_of_served_orders,
ROUND(SUM((1-Discount)*(Quantity*UnitPrice)) + sum(O.Freight), 2) as total_cost from Employees E
join dbo.Orders O on E.EmployeeID = O.EmployeeID
join [Order Details] OD on O.OrderID = OD.OrderID
where YEAR(OrderDate) = 1997 and MONTH(OrderDate) = 2
group by  E.EmployeeID,FirstName, LastName)

select EE.FirstName, EE.LastName,
isnull(number_of_served_orders, 0)
as number_of_served_orders,
isnull(total_cost, 0) as total_cost from t1
right join Employees EE on t1.EmployeeID = EE.EmployeeID
order by total_cost desc

