-- 3. Ogranicz wynik z pkt 1 tylko do pracowników
-- a) którzy mają podwładnych
-- b) którzy nie mają podwładnych

-- a) którzy mają podwładnych
select firstname, lastname, Round((select sum(quantity*unitprice*(1-discount)) from [Order Details] oo
inner join orders o on o.orderid=oo.orderid and o.EmployeeID=e.employeeid) +
(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID),2) as total_cost from Employees e
where  exists(
    select * from Employees EE where EE.ReportsTo = E.EmployeeID
)
order by total_cost desc

-- b) którzy nie mają podwładnych

select firstname, lastname, Round((select sum(quantity*unitprice*(1-discount)) from [Order Details] oo
inner join orders o on o.orderid=oo.orderid and o.EmployeeID=e.employeeid) +
(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID),2) as total_cost from Employees e
where not  exists(
    select * from Employees EE where EE.ReportsTo = E.EmployeeID
)
order by total_cost desc
