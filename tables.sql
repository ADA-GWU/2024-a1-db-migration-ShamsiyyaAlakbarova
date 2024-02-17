CREATE TABLE STUDENTS (
    ST_ID INT PRIMARY KEY,
    ST_NAME VARCHAR(20),
    ST_LAST VARCHAR(20)
);

INSERT INTO STUDENTS (ST_ID, ST_NAME, ST_LAST) VALUES 
    (1, 'Konul', 'Gurbanova'),
    (2, 'Shahnur', 'Isgandarli'),
    (3, 'Natavan', 'Mammadova');

CREATE TABLE INTERESTS (
    STUDENT_ID INT,
    INTEREST VARCHAR(20)
);

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
	
	Select * from STUDENTS;
	Select * from INTERESTS;