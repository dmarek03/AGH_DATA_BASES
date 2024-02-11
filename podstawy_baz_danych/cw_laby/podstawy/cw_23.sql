-- 3. Wybierz nazwy i kraje wszystkich klientów mających siedziby w Wielkiej Brytanii (UK) lub we Włoszech (Italy),
-- wyniki posortuj tak jak w pkt 1

select Country,CompanyName from Customers
where Country in  ('UK', 'Italy')
ORDER BY Country, CompanyName