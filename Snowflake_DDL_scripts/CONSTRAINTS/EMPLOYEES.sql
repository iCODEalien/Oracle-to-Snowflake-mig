ALTER TABLE "EMPLOYEES" MODIFY ("LAST_NAME" VARCHAR(50) NOT NULL ENABLE);
ALTER TABLE "EMPLOYEES" MODIFY ("EMAIL" VARCHAR(50) NOT NULL ENABLE);
ALTER TABLE "EMPLOYEES" MODIFY ("HIRE_DATE" DATE NOT NULL ENABLE);
ALTER TABLE "EMPLOYEES" MODIFY ("JOB_ID" VARCHAR(10) NOT NULL ENABLE);
ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE;
ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL") ENABLE;
ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID") ENABLE;