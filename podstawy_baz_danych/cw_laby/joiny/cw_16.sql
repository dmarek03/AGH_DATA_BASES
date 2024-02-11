-- 2. Napisz polecenie, które wyświetla pracowników, którzy nie mają podwładnych (baza northwind)

select (s.firstname+' '+s.lastname) as empolyees_without_reports from employees as s
left join employees as e on e.reportsto=s.EmployeeID
where e.ReportsTo is null