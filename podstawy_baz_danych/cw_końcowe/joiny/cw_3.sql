-- Dla każdego zamówienia podaj łączną wartość tego zamówienia oraz nazwę klienta.

select O.orderid,C.CompanyName, ROUND(sum((1-Discount)*(Quantity*UnitPrice)),2) as total_cost from Orders O
join dbo.[Order Details] OD on O.OrderID = OD.OrderID
join Customers C on O.CustomerID = C.CustomerID
group by O.orderid,C.CompanyName
order by total_cost desc