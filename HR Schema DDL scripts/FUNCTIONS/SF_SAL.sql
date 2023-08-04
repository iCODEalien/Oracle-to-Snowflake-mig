--------------------------------------------------------
--  DDL for Function SF_SAL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SF_SAL" (empno_ IN number)
return number is
sal_ number;
begin
    select salary into sal_ from employees
    where employee_id = empno_;
    return sal_;
end;
