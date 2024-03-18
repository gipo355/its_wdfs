# cursors

## Cursor

Cursors are used to iterate over the result set of a query. The cursor is a
pointer to the result set of a query. By default, the cursor is positioned
before the first row. The fetch operations move the cursor to the next row. The
cursor is closed when the transaction is committed or rolled back.

e.g.

```sql
DECLARE cursor_name CURSOR FOR SELECT column1, column2, ... FROM table_name;

OPEN cursor_name;

FETCH NEXT FROM cursor_name INTO variable1, variable2, ...;

WHILE @@FETCH_STATUS = 0
BEGIN
  FETCH NEXT FROM cursor_name INTO variable1, variable2, ...;
END;

CLOSE cursor_name;

DEALLOCATE cursor_name;
```
