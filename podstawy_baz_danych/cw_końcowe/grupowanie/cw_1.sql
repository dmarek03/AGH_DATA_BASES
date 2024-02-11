-- Napisz polecenie, które oblicza wartość sprzedaży dla każdego zamówienia i
-- zwraca wynik posortowany w malejącej kolejności (wg wartości sprzedaży).

select OrderID, round(sum((UnitPrice*Quantity)*(1-Discount)),2) as total_cost from [Order Details]
group by OrderID
order by total_cost desc