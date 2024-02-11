-- 5. Podaj wartość zamówienia o numerze 10250

select OrderID,  ROUND(SUM((1-Discount)*(Quantity*UnitPrice)), 2) as total_cost from [Order Details]
where OrderID = 10250
group by OrderID