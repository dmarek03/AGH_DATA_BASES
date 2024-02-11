-- 2. Zmodyfikuj zapytanie z poprzedniego punktu, tak aby podawało liczbę
-- zamówionych jednostek produktu dla wszystkich produktów
select productid, sum(Quantity) as total_quantity from [Order Details]
group by productid
order by ProductID