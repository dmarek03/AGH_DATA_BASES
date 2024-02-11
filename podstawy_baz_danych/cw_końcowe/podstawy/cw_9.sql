-- 2. Napisz polecenie, które:
-- wybiera numer członka biblioteki, isbn książki i wartość
-- naliczonej kary dla wszystkich wypożyczeń, dla których
-- naliczono karę
--stwórz kolumnę wyliczeniową zawierającą podwojoną wartość
-- kolumny fine_assessed
--stwórz alias ‘double fine’ dla tej kolumny

select isbn, (isnull(fine_assessed,0)) as fine
,isnull(2*fine_assessed,0) as 'double fine'from loanhist
where isnull(fine_assessed,0) > 0