--------------------------------------------------------
--  Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "LOCATIONS" MODIFY ("CITY" VARCHAR(50) NOT NULL)
  ALTER TABLE "LOCATIONS" ADD CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID")
  USING INDEX "LOC_ID_PK"  ENABLE