-- 3. Najczęściej wybierana kategoria w 1997 dla każdego klienta
with t1 as(
    select distinct CompanyName, CategoryName, Count(CategoryName) as cnt from Customers C
    join Orders O on C.CustomerID = O.CustomerID
    join [Order Details] OD on O.OrderID = OD.OrderID
    join Products P on OD.ProductID = P.ProductID
    join Categories CC on P.CategoryID = CC.CategoryID
    where YEAR(OrderDate) = 1997
    group by CategoryName, CompanyName, YEAR(OrderDate)

    )

select distinct CompanyName, CategoryName, cnt  from t1
where cnt = (select max(t2.cnt) from t1 as t2 where t1.CompanyName = t2.CompanyName)
order by CompanyName



select distinct CompanyName,
(FIRST_VALUE(CategoryName) over (PARTITION BY CompanyName order by count(CategoryName) desc))
as most_choosen_category from Customers
join Orders O on Customers.CustomerID = O.CustomerID
join [Order Details] OD on O.OrderID = OD.OrderID
join Products P on OD.ProductID = P.ProductID
join Categories CC on P.CategoryID = CC.CategoryID
where YEAR(OrderDate) = 1997
group by CategoryName, CompanyName, YEAR(OrderDate)