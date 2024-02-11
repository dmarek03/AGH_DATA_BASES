-- zad 1)
-- Podaj liczbę̨
--  zamówień oraz wartość zamówień (bez opłaty za przesyłkę)
-- obsłużonych przez każdego pracownika w marcu 1997. Za datę obsłużenia
-- zamówienia należy uznać datę jego złożenia (orderdate). Jeśli pracownik nie
-- obsłużył w tym okresie żadnego zamówienia, to też powinien pojawić się na liście
-- (liczba obsłużonych zamówień oraz ich wartość jest w takim przypadku równa 0).
-- Zbiór wynikowy powinien zawierać: imię i nazwisko pracownika, liczbę obsłużonych
-- zamówień, wartość obsłużonych zamówień, oraz datę najpóźniejszego zamówienia
-- (w badanym okresie). (baza northwind)

with t1 as (
select E.EmployeeID, FirstName, LastName, count(E.EmployeeID) as number_of_served_orders ,
ROUND(SUM((1-Discount)*(Quantity*UnitPrice)),2) as total_cost,
(select top 1 OO.OrderDate from Orders OO where E.EmployeeID = OO.EmployeeID
and YEAR(OO.OrderDate) = 1997 and MONTH(OO.OrderDate) = 3
order by OrderDate desc ) as date_of_last_served_orders
from Employees E
join dbo.Orders O on E.EmployeeID = O.EmployeeID
join [Order Details] OD on O.OrderID = OD.OrderID
where YEAR(OrderDate) = 1997 and MONTH(OrderDate) =3
group by E.EmployeeID,FirstName, LastName)
select EE.FirstName, EE.LastName, isnull(number_of_served_orders,0) as number_of_served_orders,
isnull(total_cost,0) as total_cost, date_of_last_served_orders from t1
right join Employees EE on EE.EmployeeID =t1.EmployeeID
order by number_of_served_orders, total_cost desc



