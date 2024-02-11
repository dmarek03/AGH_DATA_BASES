-- zad 1)
-- Dla każdego klienta podaj imię i nazwisko pracownika, który w 1997r obsłużył
-- najwięcej jego zamówień, podaj także liczbę tych zamówień (jeśli jest kilku takich
-- pracownikow to wystarczy podać imię nazwisko jednego nich). Za datę obsłużenia
-- zamówienia należy przyjąć orderdate. Zbiór wynikowy powinien zawierać nazwę
-- klienta, imię i nazwisko pracownika oraz liczbę obsłużonych zamówień. (baza
-- northwind)

with t1 as (
select CompanyName,FirstName, LastName,
COUNT(O.EmployeeID) as number_of_served_orders  from Customers C
join Orders O on C.CustomerID = O.CustomerID
join Employees E on O.EmployeeID = E.EmployeeID
where YEAR(OrderDate) = 1997
group by CompanyName, FirstName, LastName),
t2 as (
    select CompanyName, FirstName, LastName, number_of_served_orders,
    ROW_NUMBER() over (PARTITION BY CompanyName order by number_of_served_orders desc) as row_num
    from t1
)
select CompanyName, FirstName, LastName, number_of_served_orders from t2
where row_num = 1
order by number_of_served_orders desc




