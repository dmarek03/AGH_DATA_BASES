-- Zad.1. Wyświetl produkt, który przyniósł najmniejszy, ale niezerowy, przychód w 1996 roku

select  top 1 ProductName,Round(sum((1-Discount)*(Quantity*"[O D]".UnitPrice)),2)
as total_income from Products P
left join dbo.[Order Details] "[O D]" on P.ProductID = "[O D]".ProductID
left join dbo.Orders O on "[O D]".OrderID = O.OrderID
where YEAR(OrderDate) = 1996
group by ProductName
having Round(sum((1-Discount)*(Quantity*"[O D]".UnitPrice)),2) > 0
order by total_income




