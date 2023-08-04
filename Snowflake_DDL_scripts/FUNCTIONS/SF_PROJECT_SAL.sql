CREATE OR REPLACE FUNCTION "SF_PROJECT_SAL" (scale_percent FLOAT, salary FLOAT)
returns varchar SQL_MACRO(SCALAR)
as 
begin
    return
        q'{salary + salary * (scale_percent/100)}';
end;