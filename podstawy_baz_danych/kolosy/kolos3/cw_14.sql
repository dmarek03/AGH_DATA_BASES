-- 2. Wybierz kategorię, która w danym roku 1997 najwięcej zarobiła, podział na miesiące

with t1 as (
select CategoryName, DATEPART(month, OrderDate) as month,
ROUND(SUM((1-Discount)*(Quantity*OD.UnitPrice)),2) as total_cost from Categories C
join dbo.Products P on C.CategoryID = P.CategoryID
join dbo.[Order Details] OD on P.ProductID = OD.ProductID
join Orders O on OD.OrderID = O.OrderID
where YEAR(OrderDate) = 1997
group by CategoryName, DATEPART(month, OrderDate)
)

select CategoryName, month, total_cost as max_cost_per_month from t1
where total_cost = (select max(t2.total_cost) from t1 as t2 where t1.month = t2.month)