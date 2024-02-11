-- Zad.3. Wyświetl podsumowanie zamówień (całkowita cena + fracht) obsłużonych
-- przez pracowników w lutym 1997 roku, uwzględnij wszystkich, nawet jeśli suma
-- wyniosła 0.
with table1 as
(select E.EmployeeID, E.FirstName, E.LastName,
round(sum(od.Quantity*od.UnitPrice*(1-od.Discount)) + sum(o.Freight),2) as total_cost
from Employees E
join Orders O on E.EmployeeID = O.EmployeeID
join [Order Details] od on O.OrderID = od.OrderID
where year(O.OrderDate) = 1997 and month(O.OrderDate) = 2
group by E.EmployeeID, E.FirstName, E.LastName)
select E.FirstName, E.LastName, isnull(t1.total_cost,0) as total_cost from table1 t1
right join Employees E on E.EmployeeID = t1.EmployeeID
order by total_cost desc


