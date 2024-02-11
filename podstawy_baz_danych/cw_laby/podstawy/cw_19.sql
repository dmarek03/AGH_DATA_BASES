-- 1. Wybierz nazwy i kraje wszystkich klientów mających siedziby w Japonii (Japan) lub we Włoszech (Italy)

select CompanyName, Country from Customers
where Country in ('Japan', 'Italy')