-- 3. Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, jeśli tak to pokaż ich dane adresowe

select C.CompanyName, C.Address from Customers C
where not   exists(
select * from Orders O where O.CustomerID = C.CustomerID and year(OrderDate) =1997
)