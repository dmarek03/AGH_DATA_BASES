-- 1. Napisz polecenie, które wyświetla pracowników oraz ich podwładnych (baza northwind)

select (S.FirstName +' '+ S.LastName) as superior,
(E.FirstName +' '+ E.LastName) as employee from Employees S
join Employees E on E.ReportsTo = S.EmployeeID