-- 3. Napisz polecenie, które wybiera numer czytelnika i karę
-- dla tych czytelników, którzy mają kary między $8 a $9

select member_no, isnull(fine_assessed,0)-isnull(fine_waived,0)-isnull(fine_paid,0) as fine
from loanhist where isnull(fine_assessed,0)-isnull(fine_waived,0)-isnull(fine_paid,0) between 8 and 9
