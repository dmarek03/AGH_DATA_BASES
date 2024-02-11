-- 1. Podaj łączną wartość zamówienia o numerze 1025 (uwzględnij cenę za przesyłkę)

select orderid, Round(sum(unitprice*quantity*(1-discount)) +
(select freight from orders o where o.OrderID=10250),2) as total_cost
from [Order Details] oo
Where orderid=10250
group by orderid




