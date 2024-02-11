-- zad 3)
-- Dla każdego klienta podaj imię i nazwisko pracownika, który w 1997r obsłużył
-- najwięcej jego zamówień, podaj także liczbę tych zamówień (jeśli jest kilku takich
-- pracownikow to wystarczy podać imię nazwisko jednego nich). Zbiór wynikowy
-- powinien zawierać nazwę klienta, imię i nazwisko pracownika oraz liczbę
-- obsłużonych zamówień. (baza northwind)


select CompanyName,E.FirstName, E.LastName,
count(E.EmployeeID) as number_of_served_orders from  Customers C
join dbo.Orders O on C.CustomerID = O.CustomerID
join Employees E on O.EmployeeID = E.EmployeeID
where year(OrderDate) = 1997
group by C.CustomerID, CompanyName, E.FirstName, E.LastName
having count(E.EmployeeID) = (select top 1 count(EE.EmployeeID) from Orders OO
                            join Employees EE on OO.EmployeeID = EE.EmployeeID
                            where year(OO.OrderDate) = 1997 and C.CustomerID = OO.CustomerID
                            group by OO.EmployeeID
                            order by count(EE.EmployeeID) desc )
order by number_of_served_orders desc

with t1 as (
select CompanyName,E.FirstName, E.LastName,
count(E.EmployeeID) as number_of_served_orders from  Customers C
join dbo.Orders O on C.CustomerID = O.CustomerID
join Employees E on O.EmployeeID = E.EmployeeID
where year(OrderDate) = 1997
group by C.CustomerID, CompanyName, E.FirstName, E.LastName),
t2 as (
    select CompanyName, FirstName, LastName, number_of_served_orders,
    ROW_NUMBER() over (PARTITION BY CompanyName order by number_of_served_orders desc ) as row_num
    from t1

)
select CompanyName, FirstName, LastName, number_of_served_orders from t2
where row_num = 1
order by number_of_served_orders desc
