-- 2. Wybierz informację o produktach (grupa, nazwa, cena), produkty posortuj wg grup a w grupach malejąco wg ceny

select CategoryID, ProductName, UnitPrice from Products
order by CategoryID, UnitPrice desc