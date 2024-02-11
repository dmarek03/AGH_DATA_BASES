-- 1. Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień
-- obsłużonych przez tego pracownika (przy obliczaniu wartości zamówień
-- uwzględnij cenę za przesyłkę

select firstname, lastname, Round((select sum(quantity*unitprice*(1-discount)) from [Order Details] oo
inner join orders o on o.orderid=oo.orderid and o.EmployeeID=e.employeeid) +
(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID),2) as total_cost from Employees e
order by total_cost desc






