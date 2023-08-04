CREATE OR REPLACE FUNCTION "SF_SAL" (empno_ IN NUMBER)
RETURNS NUMBER
AS
$$
    SELECT salary FROM employees
    WHERE employee_id = empno_;
$$;