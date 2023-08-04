CREATE OR REPLACE EDITIONABLE PROCEDURE "ADD_JOB_HISTORY" 
  (  p_emp_id          NUMBER
   , p_start_date      DATE
   , p_end_date        DATE
   , p_job_id          VARCHAR(10)
   , p_department_id   NUMBER 
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date, 
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;