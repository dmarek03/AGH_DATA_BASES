-- Napisz polecenie, które wybiera title i title_no z tablicy
-- title.Wynikiem powinna być pojedyncza kolumna o formacie jak w
-- przykładzie poniżej:
-- The title is: Poems, title number 7
-- The title is: Poems, title number 7
-- Czyli zapytanie powinno zwracać pojedynczą kolumnę w oparciu
-- o wyrażenie, które łączy 4 elementy:
-- stała znakowa ‘The title is:’
-- wartość kolumny title
-- stała znakowa ‘title number’
-- wartość kolumny title_no
SELECT CONCAT('The title is: ', title, ', title number ', title_no) AS Title_and_number
FROM title

SELECT 'The title is: ' + title + ' , title number ' + CAST(title_no AS VARCHAR) AS formatted_title
FROM title;
