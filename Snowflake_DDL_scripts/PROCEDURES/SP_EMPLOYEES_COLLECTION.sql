CREATE OR REPLACE EDITIONABLE PROCEDURE "SP_EMPLOYEES_COLLECTION" ( p_error out varchar,
                                                     p_err_cnt out number,
                                                     p_proc_cnt out number)
    as
    type v_tab is table of employees%rowtype; -- declaring
    col_obj v_tab := v_tab(); -- defining and initializing.
    
    lv_error_count number := 0;
    lv_processed_count number := 0;
    lv_temp_emp_id number := 0;
    
begin
    --- get the current record employee id from temp table.
    select
        employee_id
        into
            lv_temp_emp_id
    from
        temp_table;
    
    col_obj.extend(3);
    
    --- populating the collection.
    select * bulk collect into col_obj from employees
    where employee_id > lv_temp_emp_id
    order by employee_id;
    
    for i in 1..col_obj.count
    loop
        if col_obj(i).first_name like 'S%' 
           or extract(year from col_obj(i).hire_date) < 2005 then
                dbms_output.put_line('BAD RECORD:    Employee ID: '||col_obj(i).employee_id||'    '||col_obj(i).First_name||'  '||col_obj(i).salary||'  '||col_obj(i).hire_date);
                update temp_table
                SET EMPLOYEE_ID = col_obj(i).employee_id;
                lv_error_count := lv_error_count + 1;
                commit;
                exit;
        else 
            dbms_output.put_line('GOOD RECORD :   '||col_obj(i).employee_id||'  '||col_obj(i).First_name||'  '||col_obj(i).salary||'  '||col_obj(i).hire_date);
            update temp_table
                SET EMPLOYEE_ID = col_obj(i).employee_id;
            lv_processed_count := lv_processed_count + 1;
            commit;
        end if;
    end loop;
    p_error := SQLERRM;
    p_err_cnt := lv_error_count;
    p_proc_cnt := lv_processed_count;
end;