-- Podaj nr zamówienia oraz wartość zamówienia, dla zamówień, dla których
-- łączna liczba zamawianych jednostek produktów jest > 250
select orderid, sum(Quantity) as total_quantity,
round(sum((UnitPrice*Quantity)*(1-Discount)),2) as total_cost from [Order Details]
group by orderid with rollup
having sum(Quantity) > 250


