-- 1. Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień
-- obsłużonych przez tego pracownika
-- – Ogranicz wynik tylko do pracowników
-- a) którzy mają podwładnych
-- b) którzy nie mają podwładnych

select distinct (S.FirstName + ' '+ S.LastName) as superior,
round(sum((1-OD.Discount)*(OD.UnitPrice*OD.Quantity)), 2) as total_cost from Employees S
join Employees E on S.EmployeeID = E.ReportsTo
join dbo.Orders O on S.EmployeeID = O.EmployeeID
join dbo.[Order Details] OD on O.OrderID = OD.OrderID
-- Jak chcemy wartość zamówień tylko tych którzy mają podwładnych to trzeba grupować jeszcze po E.EmployeeID,
-- bo inczej wliczają się też zamowienia ich podwładnych
group by E.EmployeeID,(S.FirstName + ' '+ S.LastName)
order by total_cost desc

--b)
-- Jak chcemy tych co nie mają podwładnych to robimy left joina na Employee i dokładamy warunek, że E.ReportsTo is null
select (S.FirstName +' '+ S.LastName) as employee,
round(sum((1-OD.Discount)*(OD.UnitPrice*OD.Quantity)), 2) as total_cost from Employees S
left join Employees E on E.ReportsTo = S.EmployeeID
join dbo.Orders O on S.EmployeeID = O.EmployeeID
join [Order Details] OD on O.OrderID = OD.OrderID
where E.ReportsTo is null
group by (S.FirstName +' '+ S.LastName)
order by total_cost desc
