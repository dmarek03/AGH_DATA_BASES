-- 3. Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, jeśli tak to pokaż ich dane adresowe

select distinct CompanyName, (Address +' '+Country+' '+City) as adress  from Customers C
left join Orders O on C.CustomerID = O.CustomerID
where YEAR(OrderDate) != 1997
