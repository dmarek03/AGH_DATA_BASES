--   Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których
--  łączna liczba jednostek jest większa niż 250.

select O.orderid,C.CompanyName, sum(Quantity) as total_quantity
,ROUND(sum((1-Discount)*(Quantity*UnitPrice)),2) as total_cost from Orders O
join dbo.[Order Details] OD on O.OrderID = OD.OrderID
join Customers C on O.CustomerID = C.CustomerID
group by O.orderid,C.CompanyName
having sum(Quantity) > 250
order by total_cost desc
