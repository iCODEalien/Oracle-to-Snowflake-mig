ALTER TABLE "COUNTRIES" ADD CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "REGIONS" ("REGION_ID") ENABLE

No conversion needed as the data types used in Oracle are compatible with Snowflake's data types.