-- zad 1)
-- Dla każdego pracownika podaj nazwę klienta, dla którego dany pracownik w 1997r
-- obsłużył najwięcej zamówień, podaj także liczbę tych zamówień (jeśli jest kilku
-- takich klientów to wystarczy podać nazwę jednego nich). Za datę obsłużenia
-- zamówienia należy przyjąć orderdate. Zbiór wynikowy powinien zawierać imię i
-- nazwisko pracownika, nazwę klienta, oraz liczbę obsłużonych zamówień. (baza
-- northwind)

with t1 as (
select  FirstName, LastName,CompanyName,
count(O.EmployeeID) as number_of_served_orders from Employees E
join dbo.Orders O on E.EmployeeID = O.EmployeeID
join [Order Details] OD on O.OrderID = OD.OrderID
join Customers C on O.CustomerID = C.CustomerID
where YEAR(OrderDate) = 1997
group by  FirstName, LastName, CompanyName
), t2 as (
    select FirstName, LastName, CompanyName, number_of_served_orders,
    ROW_NUMBER() over (PARTITION BY FirstName, LastName ORDER BY number_of_served_orders DESC)
    as row_num from t1
)
select FirstName, LastName, CompanyName, number_of_served_orders from t2
where row_num =1
order by number_of_served_orders desc


