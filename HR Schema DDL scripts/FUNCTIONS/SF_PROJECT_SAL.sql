--------------------------------------------------------
--  DDL for Function SF_PROJECT_SAL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SF_PROJECT_SAL" (scale_percent in number, salary in number)
return varchar2 SQL_MACRO(SCALAR)
is 
begin
    return
        q'{salary + salary * (scale_percent/100)}';
end;
