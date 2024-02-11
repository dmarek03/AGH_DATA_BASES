-- 4. Który z pracowników obsłużył największą liczbę zamówień w 1997r, podaj imię i nazwisko takiego pracownika

select top 1 E.FirstName, E.LastName, Count(O.EmployeeID) as number_of_served_orders from Employees E
join Orders O on E.EmployeeID = O.EmployeeID
where YEAR(O.OrderDate) = 1997
group by E.FirstName, E.LastName
order by number_of_served_orders desc