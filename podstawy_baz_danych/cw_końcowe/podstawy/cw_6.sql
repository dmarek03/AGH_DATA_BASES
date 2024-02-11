-- Napisz polecenie, które wybiera numer czytelnika, karę oraz zapłaconą karę dla wszystkich, którzy jeszcze nie
-- zapłacili.
select member_no, (isnull(fine_assessed, 0)-isnull(fine_waived, 0)-isnull(fine_paid, 0)) as fine
, isnull(fine_paid, 0) as fine_paid from loanhist where isnull(fine_paid, 0) = 0 and isnull(fine_assessed, 0) > 0