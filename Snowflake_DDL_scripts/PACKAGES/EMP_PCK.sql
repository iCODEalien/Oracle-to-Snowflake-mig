CREATE OR REPLACE EDITIONABLE PACKAGE "EMP_PCK" 
as                                      
                                        
procedure sp_employees_collection( p_error out varchar,
                                   p_err_cnt out number,
                                   p_proc_cnt out number);

procedure sp_ctrl_procedure;

end EMP_PCK;