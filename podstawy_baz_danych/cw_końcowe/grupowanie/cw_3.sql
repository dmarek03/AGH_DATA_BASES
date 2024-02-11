-- 1. Podaj liczbę zamówionych jednostek produktów dla produktów, dla których productid < 3

select  ProductID, sum(quantity) as total_quantity from [Order Details]
where ProductID < 3
group by ProductID