ALTER TABLE "COUNTRIES" MODIFY ("COUNTRY_ID" NOT NULL)
ALTER TABLE "COUNTRIES" ADD CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID")
USING INDEX  ENABLE;