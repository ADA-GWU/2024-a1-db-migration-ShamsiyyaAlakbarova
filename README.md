[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/JwSLLxUh)

<h2>1.Prerequisites.</h2> 
<p>I used SQL script in this assignment, so before you can use this application, you will need to ensure that you have PostgreSQL (pdAdmin) installed on your system. If you don't have PostgreSQL installed, you can visit the official website at https://www.postgresql.org/download/, and download for your OS.</p> 

<h2>2.Set Up Environment.</h2>
<p>Step 1. Go to my github repository (https://github.com/ADA-GWU/2024-a1-db-migration-ShamsiyyaAlakbarova).<br>Step 2. Press to green CODE button, and download the repository as a ZIP file.<br>
Step 3. Unzip the file.<br>
Step 4. Open pgAdmin on your computer and create your database there. Here, you will run the scripts and see an outputs. <br>
Step 5. To create a database press on "Servers". Then you will see PostgreSQL 16 as a dropdown. Right click on PostgreSQL 16 => Create => Database. Give a name to your db (for example "HW1") and press save button.<br>
Step 6. Now, you have your HW1 db. Right click on HW1 => press Query Tool button. Here you will run your scripts.<br>
Step 7. On the top left corner you will see folder icon. You should press on it, or just use Alt+O command. You should find files from my repo, that you downloaded, and start running them.<br>

Set up is DONE!<br></p>

<h2>3.Run the Scripts.</h2>
<p>Step 1. First, you should open "tables" file. There, you will see this script:<br>
CREATE TABLE STUDENTS (<br>
    ST_ID INT PRIMARY KEY,<br>
    ST_NAME VARCHAR(20),<br>
    ST_LAST VARCHAR(20)<br>
);<br>
<br>
INSERT INTO STUDENTS (ST_ID, ST_NAME, ST_LAST) VALUES <br>
    (1, 'Konul', 'Gurbanova'),<br>
    (2, 'Shahnur', 'Isgandarli'),<br>
    (3, 'Natavan', 'Mammadova');<br>
<br>
CREATE TABLE INTERESTS (<br>
    STUDENT_ID INT,<br>
    INTEREST VARCHAR(20)<br>
);<br>
<br>
INSERT INTO INTERESTS (STUDENT_ID, INTEREST) VALUES <br>
    (1, 'Tennis'),<br>
    (1, 'Literature'),<br>
    (2, 'Math'),<br>
    (2, 'Tennis'),<br>
    (3, 'Math'),<br>
    (3, 'Music'),<br>
    (2, 'Football'),<br>
    (1, 'Chemistry'),<br>
    (3, 'Chess');<br>
<br>
In assignment we have two tables, <b>STUDENTS</b> and <b>INTERESTS</b>. This script creates these tables, and inserts values into the tables. Select this script and run it by pressing run button or F5 key. To check if tables are created, run these commands: <b>Select * from STUDENTS;</b> and <b>Select * from INTERESTS;</b><br>
Step 2. Now we have two tables in our HW1 database. We have to:<br> 
1. Rename the STUDENTS.ST_ID to STUDENTS.STUDENT_ID.<br> 
2. Change the length of STUDENTS.ST_NAME and STUDENTS.ST_LAST from 20 to 30.<br>
 3. Change the name of the INTERESTS.INTEREST to INTERESTS and its type to array of strings.<br><br>
 Open "migration" file. You will see this script there:<br><br>

 ALTER TABLE STUDENTS RENAME COLUMN ST_ID TO STUDENT_ID;<br>
ALTER TABLE STUDENTS ALTER COLUMN ST_NAME TYPE VARCHAR(30);<br>
ALTER TABLE STUDENTS ALTER COLUMN ST_LAST TYPE VARCHAR(30);<br><br>


ALTER TABLE INTERESTS RENAME COLUMN INTEREST TO INTERESTS;<br><br>

CREATE TEMP TABLE TEMP_INTERESTS AS<br>
SELECT<br>
    STUDENT_ID,<br>
   '{"' || STRING_AGG(INTERESTS, '","') || '"}' AS INTERESTS<br>
FROM<br>
    INTERESTS<br>
GROUP BY<br>
    STUDENT_ID<br>
ORDER BY<br>
    STUDENT_ID;<br><br>

DROP TABLE INTERESTS;<br><br>

ALTER TABLE TEMP_INTERESTS<br>
RENAME TO INTERESTS;<br><br>


Select * from INTERESTS;<br>
select * from STUDENTS;<br><br>

Firstly we renamed column ST_ID to STUDENT_ID in STUDENTS table.<br>
Then we changed the length of STUDENTS.ST_NAME and STUDENTS.ST_LAST from 20 to 30.<br>
After, we renamed column INTEREST to INTERESTS in INTERESTS table.<br>
For changing the type to array of strings we created temporary table TEMP_INTERESTS.Then we grouped the rows by student_id (1,2,3), aggregates the INTERESTS column values into a JSON array. To have commas and double quotes we used STRING_AGG statement. Also we used order by student_id, to place IDs in sequential order (from 1 to 3).<br>
</p>