-- 4. Podaj liczbę zamówień dostarczanych przez poszczególnych spedytorów (przewoźników)

select Shipvia, COUNT(ShipVia) as number_of_orders from Orders
group by Shipvia
order by number_of_orders desc