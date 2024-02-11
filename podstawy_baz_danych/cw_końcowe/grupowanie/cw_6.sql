-- 1. Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień
select EmployeeID, count(EmployeeID) as number_of_seriviced_orders from Orders
group by EmployeeID
order by EmployeeID