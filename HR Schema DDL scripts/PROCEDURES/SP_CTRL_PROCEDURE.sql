--------------------------------------------------------
--  DDL for Procedure SP_CTRL_PROCEDURE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SP_CTRL_PROCEDURE" 
    as
    pr_proc_cnt number :=0;
    pr_err_cnt number :=0;
    lv_err_m varchar2(200);
    total_records number := 0;
    lv_err_cntr number :=0;
    lv_processed_cntr number :=0;
    lv_temp_emp_id number;
begin
    -- getting the temp_employee_id
    select
        employee_id
        into
            lv_temp_emp_id
    from temp_table;
    
    --- Getting the count
    select 
        count(1) 
        into 
            total_records
    from
        employees
    where employee_id > lv_temp_emp_id;
        
    --- Feedback loop
     while total_records >  lv_err_cntr + lv_processed_cntr 
     loop
        sp_employees_collection(lv_err_m, pr_err_cnt,pr_proc_cnt);
        dbms_output.put_line ('Error MSG : '|| lv_err_m);
        dbms_output.put_line( 'Processed rows count: '||pr_proc_cnt||'    Error rows count: '||pr_err_cnt);
        lv_err_cntr := lv_err_cntr + pr_err_cnt;
        lv_processed_cntr := lv_processed_cntr + pr_proc_cnt;
    end loop;
    dbms_output.put_line('Process Completed. Total rows: '||total_records||'  Processed records: '||lv_processed_cntr||' Error records: '||lv_err_cntr);
end;
