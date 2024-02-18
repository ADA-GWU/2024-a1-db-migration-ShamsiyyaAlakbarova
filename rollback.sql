
ALTER TABLE STUDENTS RENAME COLUMN STUDENT_ID TO ST_ID;
ALTER TABLE STUDENTS ALTER COLUMN ST_NAME TYPE VARCHAR(20);
ALTER TABLE STUDENTS ALTER COLUMN ST_LAST TYPE VARCHAR(20);


ALTER TABLE INTERESTS RENAME COLUMN INTERESTS TO INTEREST;


DELETE FROM INTERESTS;

-- Reinsert the original data
INSERT INTO INTERESTS (STUDENT_ID, INTEREST) VALUES 
    (1, 'Tennis'),
    (1, 'Literature'),
    (2, 'Math'),
    (2, 'Tennis'),
    (3, 'Math'),
    (3, 'Music'),
    (2, 'Football'),
    (1, 'Chemistry'),
    (3, 'Chess');


SELECT * FROM STUDENTS;
SELECT * FROM INTERESTS;