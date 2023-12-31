--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "DEPARTMENTS" ("DEPARTMENT_ID") ENABLE
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "JOBS" ("JOB_ID") ENABLE
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE
