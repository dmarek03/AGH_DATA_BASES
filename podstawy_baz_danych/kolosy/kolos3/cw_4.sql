-- 4. Dla każdego klienta najczęściej zamawianą kategorię w dwóch wersjach.

with t1 as (select CompanyName, CategoryName,count(CC.CategoryID) as total_ordered_quantity
from Customers
         join Orders O on Customers.CustomerID = O.CustomerID
         join [Order Details] OD on O.OrderID = OD.OrderID
         join Products P on OD.ProductID = P.ProductID
         join Categories CC on P.CategoryID = CC.CategoryID
group by CategoryName, CompanyName )

select CompanyName, CategoryName as name_of_max_category from t1
where total_ordered_quantity =
(select  max(t2.total_ordered_quantity) from t1 as t2 where t1.CompanyName =t2.CompanyName)
order by CompanyName

with t1 as (select CompanyName, CategoryName,count(CC.CategoryID) as total_ordered_quantity
from Customers
         join Orders O on Customers.CustomerID = O.CustomerID
         join [Order Details] OD on O.OrderID = OD.OrderID
         join Products P on OD.ProductID = P.ProductID
         join Categories CC on P.CategoryID = CC.CategoryID
group by CategoryName, CompanyName ),
t2 as (
    select CompanyName, CategoryName, total_ordered_quantity,
    row_number() over (PARTITION BY CompanyName order by  total_ordered_quantity desc) as rn from t1

)
select CompanyName, CategoryName, total_ordered_quantity from t2
where rn = 1

