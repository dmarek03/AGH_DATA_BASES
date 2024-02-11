-- Napisz polecenie select, za pomocą którego uzyskasz numer książki i autora dla wszystkich książek, których
-- autorem jest Charles Dickens lub Jane Austen

SELECT title_no, title, author from title
where author in ('Charles Dickens' , 'Jane Austen')