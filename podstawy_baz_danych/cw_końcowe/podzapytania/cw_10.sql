-- 2. Podaj łączną wartość zamówień każdego zamówienia (uwzględnij cenę za
-- przesyłkę)

select  OD.OrderID , Round((select O.Freight from Orders  O where OD.OrderID = O.OrderID)+
SUM((1-OD.Discount)*(OD.UnitPrice*OD.Quantity)),2) as total_cost
from [Order Details] OD
group by OD.OrderID
order by total_cost desc