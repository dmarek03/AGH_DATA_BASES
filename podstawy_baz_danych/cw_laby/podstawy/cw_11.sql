-- 6. Wybierz nazwy produktów których nie ma w magazynie

select ProductName, UnitsInStock from Products
where isnull(UnitsInStock, 0) = 0