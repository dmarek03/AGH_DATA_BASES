-- 2. Zmodyfikuj zapytanie z poprzedniego punktu, tak aby zwracało pierwszych 10 wierszy
select top 10 OrderID, round(sum((UnitPrice*Quantity)*(1-Discount)),2) as total_cost from [Order Details]
group by OrderID
order by total_cost desc