ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_LOC_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "LOCATIONS" ("LOCATION_ID") ENABLE;
ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE; 

No conversion needed as Oracle's data types are compatible with Snowflake's data types.