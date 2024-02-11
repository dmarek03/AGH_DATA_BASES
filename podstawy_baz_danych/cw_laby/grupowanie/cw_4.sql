-- 4. Wypisz informację o wszystkich produktach o cenie powyżej średniej

select * from  Products
where UnitPrice > (select avg(UnitPrice) from Products)

