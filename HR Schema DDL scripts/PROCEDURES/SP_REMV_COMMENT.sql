--------------------------------------------------------
--  DDL for Procedure SP_REMV_COMMENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SP_REMV_COMMENT" (p_owner IN varchar2)
as
    v_tab_comm varchar2(150);
    v_col_comm varchar2(150);

    cursor c1 is
        select owner,
            object_type,
            object_name
        from all_objects ao
        where owner = p_owner
        and object_type = 'TABLE' and
        not exists ( select 1 from user_mviews um
                    where um.mview_name = ao.object_name);

    cursor c2 is
        select owner,
            table_name,
            column_name
        from  all_tab_cols
        where owner = p_owner;
begin
        for rec1 in c1
        loop
            --dbms_output.put_line('Owner : '||rec1.owner||'     object type : '||rec1.object_type||'      object_name : '||rec1.object_name);
--            dbms_output.put_line('COMMMENT ON TABLE '||REC1.OWNER||'.'||REC1.OBJECT_NAME||' IS '''';');

--            EXECUTE IMMEDIATE 'COMMMENT ON TABLE '||REC1.OWNER||'.'||REC1.OBJECT_NAME||' IS '''' ';

            v_tab_comm := 'COMMENT ON TABLE '||REC1.OWNER||'.'||REC1.OBJECT_NAME||' IS '''' ';
            execute immediate v_tab_comm;
        end loop;

        dbms_output.put_line('---------------------------------------------------');
--        
        for rec2 in c2
        loop
--            dbms_output.put_line('Owner : '||rec2.owner||'      Table name : '||rec2.table_name||'      column_name : '||rec2.column_name);
--            DBMS_OUTPUT.PUT_LINE('COMMENT ON COLUMN '||REC2.OWNER||'.'||REC2.TABLE_NAME||'.'||REC2.COLUMN_NAME||' IS '''';');

--             EXECUTE IMMEDIATE 'COMMENT ON COLUMN '||REC2.OWNER||'.'||REC2.TABLE_NAME||'.'||REC2.COLUMN_NAME||' IS '''' ';

            v_col_comm := 'COMMENT ON COLUMN "'||REC2.OWNER||'"."'||REC2.TABLE_NAME||'"."'||REC2.COLUMN_NAME||'" IS '''' ';
            EXECUTE IMMEDIATE v_col_comm;
        end loop;
end;
