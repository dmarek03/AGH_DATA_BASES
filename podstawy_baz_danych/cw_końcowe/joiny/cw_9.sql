-- 4. Dla każdego zamówienia podaj jego wartość uwzględniając opłatę za przesyłkę

-- Dla danego zamówienia tylko raz płacimy za przewóz, ale zamówienie może się składać z kilku produktów, dlatego
-- `Freight`należy uwzględnimy po za sumą, która wylicza łączny koszt zamówienia

select OD.OrderID ,round(sum((1-OD.Discount)*(OD.Quantity*OD.UnitPrice)) + O.Freight,2) as total_cost_with_freight
from [Order Details] OD
join Orders O on OD.OrderID = O.OrderID
group by OD.OrderID, O.Freight
order by total_cost_with_freight desc