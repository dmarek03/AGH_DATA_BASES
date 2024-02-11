-- 3. Wybierz nazwy i ceny produktów o cenie jednostkowej pomiędzy 20 a 30

select ProductName, UnitPrice from Products
where UnitPrice between 20 and 30
order by UnitPrice desc