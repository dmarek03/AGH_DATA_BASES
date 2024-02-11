-- 2. Zamówienia z Freight większym niż AVG danego roku.

select  OrderID
from Orders O
where Freight > (select avg(OO.Freight)  from Orders OO
where  YEAR(OO.OrderDate) = YEAR(O.OrderDate)
)




