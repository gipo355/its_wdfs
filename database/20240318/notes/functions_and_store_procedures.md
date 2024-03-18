# functions

```sql
CREATE FUNCTION function_name (parameter1, parameter2, ...)
RETURNS return_datatype AS
BEGIN
    -- function body
    -- use params with @parameter1
    return return_value;
END;
```

# store procedure

allows creating a function that can be called from SQL statements.

same syntax as function, but with `PROCEDURE` instead of `FUNCTION`

no param, no return statement

# analyzer, piano esecuzione
