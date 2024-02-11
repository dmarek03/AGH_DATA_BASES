-- 4. Znajdź nazwy kategorii, które w opisie zawierają przecinek

select CategoryName, Description from Categories
where Description like '%,%'