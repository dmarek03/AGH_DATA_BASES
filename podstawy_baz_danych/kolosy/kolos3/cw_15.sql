-- 3. Dane pracownika i najczęstszy dostawca pracowników bez podwładnych
with t1 as (select S.FirstName, S.LastName, ShipVia, COUNT(ShipVia) as cnt
            from Employees S
                     left join Employees E on E.ReportsTo = S.EmployeeID
                     join Orders O on S.EmployeeID = O.EmployeeID
                     join Shippers on O.ShipVia = Shippers.ShipperID
            where E.EmployeeID is null
            group by S.FirstName, S.LastName, ShipVia)

select FirstName, LastName, ShipVia, cnt as number_of_supplied_orders from t1 as t2
where cnt = (select max(cnt) from t1
where t1.FirstName =t2.FirstName and t2.LastName =t1.LastName)
