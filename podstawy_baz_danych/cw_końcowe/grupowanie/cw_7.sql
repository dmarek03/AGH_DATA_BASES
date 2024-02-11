-- 2. Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę"
-- przewożonych przez niego zamówień

select ShipVia, SUM(Freight) as freight from Orders
group by ShipVia
order by ShipVia