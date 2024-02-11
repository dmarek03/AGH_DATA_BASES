-- 1. Szukamy informacji o produktach sprzedawanych w butelkach (‘bottle’)

select  ProductName, QuantityPerUnit from Products
where QuantityPerUnit like '%bottle%'