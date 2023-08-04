CREATE OR REPLACE EDITIONABLE TRIGGER "SECURE_EMPLOYEES" 
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;

-- No conversion needed as Snowflake supports the same data types as Oracle.