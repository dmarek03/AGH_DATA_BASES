--   Dla każdego zamówienia podaj łączną liczbę zamówionych jednostek towaru oraz nazwę klienta.

select O.OrderID, C.CompanyName , sum(Quantity) as total_order_quanatity from Customers C
join  Orders O on C.CustomerID = O.CustomerID
join [Order Details] OD on O.OrderID = OD.OrderID
group by O.OrderID, C.CompanyName
order by total_order_quanatity desc
