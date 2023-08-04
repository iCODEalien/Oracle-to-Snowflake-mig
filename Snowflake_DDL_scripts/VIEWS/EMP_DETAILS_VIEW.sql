CREATE OR REPLACE VIEW "EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
SELECT
  e.employee_id::NUMBER, 
  e.job_id::VARCHAR, 
  e.manager_id::NUMBER, 
  e.department_id::NUMBER,
  d.location_id::NUMBER,
  l.country_id::VARCHAR,
  e.first_name::VARCHAR,
  e.last_name::VARCHAR,
  e.salary::NUMBER,
  e.commission_pct::NUMBER,
  d.department_name::VARCHAR,
  j.job_title::VARCHAR,
  l.city::VARCHAR,
  l.state_province::VARCHAR,
  c.country_name::VARCHAR,
  r.region_name::VARCHAR
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id 
WITH READ ONLY;