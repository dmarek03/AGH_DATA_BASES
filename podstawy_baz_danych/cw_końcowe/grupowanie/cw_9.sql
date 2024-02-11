-- Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień z  podziałem na lata i miesiące

select EmployeeID, YEAR(OrderDate) as year, MONTH(OrderDate) as month
, COUNT(EmployeeID) as number_of_serviced_orders from Orders
group by EmployeeID, YEAR(OrderDate), MONTH(OrderDate) with cube
