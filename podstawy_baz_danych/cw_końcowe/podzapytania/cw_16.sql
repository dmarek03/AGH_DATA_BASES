-- 4. Zmodyfikuj rozwiązania z pkt 3 tak aby dla pracowników pokazać jeszcze datę
-- ostatnio obsłużonego zamówienia

-- a) którzy mają podwładnych
select firstname, lastname, Round((select sum(quantity*unitprice*(1-discount)) from [Order Details] oo
inner join orders o on o.orderid=oo.orderid and o.EmployeeID=e.employeeid) +
(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID),2) as total_cost,
(select top 1 shippeddate from orders o where o.EmployeeID=e.EmployeeID order by ShippedDate desc) as date
from Employees e
where  exists(
    select * from Employees EE where EE.ReportsTo = E.EmployeeID
)
order by total_cost desc

-- b) którzy nie mają podwładnych

select firstname, lastname, Round((select sum(quantity*unitprice*(1-discount)) from [Order Details] oo
inner join orders o on o.orderid=oo.orderid and o.EmployeeID=e.employeeid) +
(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID),2) as total_cost,
(select top 1 ShippedDate from Orders O where E.EmployeeID = O.EmployeeID order by ShippedDate desc) as date
from Employees e
where not  exists(
    select * from Employees EE where EE.ReportsTo = E.EmployeeID
)
order by total_cost desc


