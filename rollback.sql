
ALTER TABLE STUDENTS RENAME COLUMN STUDENT_ID TO ST_ID;
ALTER TABLE STUDENTS ALTER COLUMN ST_NAME TYPE VARCHAR(20);
ALTER TABLE STUDENTS ALTER COLUMN ST_LAST TYPE VARCHAR(20);


ALTER TABLE INTERESTS RENAME COLUMN INTERESTS TO INTEREST;
