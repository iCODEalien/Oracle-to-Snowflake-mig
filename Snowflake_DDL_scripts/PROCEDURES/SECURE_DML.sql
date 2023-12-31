CREATE OR REPLACE EDITIONABLE PROCEDURE "SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (CURRENT_TIMESTAMP, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (CURRENT_TIMESTAMP, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205, 
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;