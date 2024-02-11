-- zad 3)
-- Podaj liczbę̨
--  zamówień oraz wartość zamówień (uwzględnij opłatę za przesyłkę)
-- złożonych przez każdego klienta w lutym 1997. Jeśli klient nie złożył w tym okresie
-- żadnego zamówienia, to też powinien pojawić się na liście (liczba złożonych
-- zamówień oraz ich wartość jest w takim przypadku równa 0). Zbiór wynikowy
-- powinien zawierać: nazwę klienta, liczbę obsłużonych zamówień, oraz wartość
-- złożonych zamówień. (baza northwind)

with t1 as(
select C.CustomerID, CompanyName, COUNT(C.CustomerID) as number_of_orders,
ROUND(SUM((1-Discount)*(Quantity*UnitPrice)), 2) as total_cost from Customers C
join dbo.Orders O on C.CustomerID = O.CustomerID
join [Order Details] OD on O.OrderID = OD.OrderID
where YEAR(OrderDate) = 1997 and month(OrderDate) =2
group by C.CustomerID, CompanyName)

select CC.CompanyName, isnull(number_of_orders, 0) as number_of_orders ,
isnull(total_cost,0) as total_cost from t1
right join Customers CC on CC.CustomerID = t1.CustomerID
order by number_of_orders desc
