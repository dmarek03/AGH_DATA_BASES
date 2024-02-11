-- Napisz polecenie, które wybiera wszystkie unikalne pary miast i stanów z tablicy adult.

select distinct  (city + ' '+ state ) as CityandState from adult