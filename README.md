# FCC-Build-a-Celestial-Bodies_DB
One of the projects to complete [FreeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-database/)

## My notes from the tutorials completed up to this point:

### PostGres Commands
```
psql --username=freecodecamp --dbname=postgres
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
pg_dump --clean --create --inserts --username=freecodecamp students > students.sql
psql -U postgres < universe.sql
\l - list databases
\c <database_name> - connect to database
\d - list tables in the DB
\d <table_name> - details about a table
```

### SQL Commands
```sql
CREATE DATABASE database_name;
ALTER DATABASE database_name RENAME TO new_database_name;

CREATE TABLE table_name();
CREATE TABLE table_name(column_name DATATYPE CONSTRAINTS);
	CREATE TABLE sounds(sound_id SERIAL PRIMARY KEY);

ALTER TABLE table_name ADD COLUMN column_name DATATYPE;
	ALTER TABLE people ADD COLUMN age INT;
	ALTER TABLE people ADD COLUMN name VARCHAR(30) NOT NULL;
	ALTER TABLE people ADD COLUMN id SERIAL; [INT & NOT NULL]
		
ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE table_name RENAME COLUMN column_name TO new_name;

ALTER TABLE table_name ADD PRIMARY KEY(column_name);
ALTER TABLE table_name DROP CONSTRAINT constraint_name;

// create a column as a foreign key one to one relationship:
ALTER TABLE table_name ADD COLUMN column_name DATATYPE CONSTRAINT REFERENCES referenced_table_name(referenced_column_name);
	ALTER TABLE more_info ADD COLUMN character_id INT NOT NULL REFERENCES characters(character_id);
ALTER TABLE table_name ADD UNIQUE(column_name);
	ALTER TABLE more_info ADD UNIQUE(character_id);

// create a column as a foreign key one to many relationship
ALTER TABLE table_name ADD COLUMN column_name DATATYPE CONSTRAINT REFERENCES referenced_table_name(referenced_column_name);
	ALTER TABLE sounds ADD COLUMN character_id INT NOT NULL REFERENCES characters(character_id);

// create a junction table
	CREATE TABLE character_actions();
	ALTER TABLE character_actions ADD COLUMN character_id INT NOT NULL;
	ALTER TABLE character_actions ADD FOREIGN KEY(character_id) REFERENCES characters(character_id);
	ALTER TABLE character_actions ADD COLUMN action_id INT NOT NULL;
	ALTER TABLE character_actions ADD FOREIGN KEY(action_id) REFERENCES actions(action_id);
	ALTER TABLE character_actions ADD PRIMARY KEY(character_id, action_id);
	
	

INSERT INTO table_name(column_1, column_2) VALUES(value1, value2);
	INSERT INTO second_table (id, username) VALUES (1, 'Samus'),(2, 'Mario'), (3, 'Luigi');

DELETE FROM table_name WHERE condition;

UPDATE table_name SET column_name=new_value WHERE condition;
	UPDATE people SET age=27 WHERE name='Zyta';

SELECT columns FROM table_name ORDER BY column_name;
	SELECT * FROM people ORDER BY id;

SELECT columns FROM table_name WHERE condition;
```
Comparaison signs (">=", "<", etc.) works on strins first letters:
```
SELECT first_name, last_name, gpa FROM students WHERE last_name >= 'R' AND (gpa > 3.8 OR gpa < 2.0);
```
An underscore "_" in a patters will return rows that have any character in that spot:
```
SELECT * FROM courses WHERE course LIKE '_lgorithms';
```
Percentage sign "%" will match one or more characters:
```
SELECT * FROM courses WHERE course LIKE '%lgorithms';
```
ILIKE will ignore the case of the letters when matching:
```
SELECT * FROM courses WHERE course NOT ILIKE '%A%';
```
More examples of SQL pattern matching:
```
SELECT * FROM courses WHERE course LIKE '_e%';
SELECT * FROM courses WHERE course LIKE '% %';
SELECT * FROM courses WHERE course NOT LIKE '% %';
SELECT * FROM courses WHERE course NOT ILIKE '%A%' AND course LIKE '% %';
SELECT last_name FROM students WHERE last_name ILIKE '%sa%' OR last_name LIKE '%r_';
SELECT * FROM students WHERE gpa IS NOT NULL;
SELECT first_name, last_name, gpa FROM students WHERE major_id IS NULL AND (first_name LIKE 'D%' OR gpa > 3.0);
SELECT * FROM students WHERE gpa IS NOT NULL  ORDER BY gpa DESC, first_name LIMIT 10;
SELECT course FROM courses WHERE course LIKE '_e%' OR course LIKE '%s' ORDER BY course DESC LIMIT 5;
```
### SQL Matematical operations
```
SELECT MIN(gpa) FROM students;
SELECT MIN(gpa) FROM students;
SELECT SUM(major_id) FROM students;
SELECT AVG(major_id) FROM students;
SELECT CEIL(AVG(major_id)) FROM students;
SELECT ROUND(AVG(major_id)) FROM students;
SELECT ROUND(AVG(major_id),5) FROM students; // round to 5 decimal places
SELECT ROUND(AVG(gpa),2) FROM students;      // round to 2 decimal places
SELECT COUNT(*) FROM majors;
SELECT DISTINCT(major_id) FROM students;
SELECT major_id FROM students GROUP BY major_id;
SELECT major_id, COUNT(*) FROM students GROUP BY major_id;
SELECT major_id, COUNT(student_id) FROM students GROUP BY major_id;
SELECT major_id, MIN(gpa) FROM students GROUP BY major_id;
SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id;
SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id HAVING MAX(gpa)=4;
SELECT major_id, MIN(gpa) AS min_gpa, MAX(gpa) AS max_gpa FROM students GROUP BY major_id HAVING MAX(gpa)=4;
SELECT major_id, COUNT(*) AS number_of_students FROM students GROUP BY major_id;
SELECT major_id, COUNT(*) AS number_of_students FROM students GROUP BY major_id HAVING COUNT(*) < 8;

SELECT major_id, COUNT(*) AS number_of_students, ROUND(AVG(gpa),2) AS avarage_gpa
FROM students
GROUP BY major_id HAVING COUNT(*) > 1;

SELECT * FROM students
FULL JOIN majors
ON students.major_id = majors.major_id;

SELECT * FROM students
LEFT JOIN majors
ON students.major_id = majors.major_id;

SELECT * FROM students
RIGHT JOIN majors
ON students.major_id = majors.major_id;

SELECT * FROM students
INNER JOIN majors
ON students.major_id = majors.major_id;

SELECT major FROM majors
LEFT JOIN students
ON majors.major_id = students.major_id
WHERE student_id IS NULL;

SELECT * FROM students
LEFT JOIN majors
ON students.major_id = majors.major_id
WHERE major = 'Data Science'
OR gpa >= 3.8
ORDER BY gpa DESC;

SELECT * FROM students FULL JOIN majors USING(major_id);

SELECT * FROM students
FULL JOIN majors USING(major_id)
FULL JOIN majors_courses USING(major_id)
FULL JOIN courses USING(course_id);

//List of courses, in alphabetical order, with only one student enrolled:
SELECT DISTINCT(course) 
FROM students
FULL JOIN majors USING(major_id)
FULL JOIN majors_courses USING(major_id)
FULL JOIN courses USING(course_id)
ORDER BY course;

//In order to add GROUP BY condition I will add aliases
SELECT DISTINCT(c.course)
FROM students AS s 
FULL JOIN majors AS m ON s.major_id=m.major_id
FULL JOIN majors_courses AS mc ON m.major_id=mc.major_id
FULL JOIN courses AS c ON mc.course_id=c.course_id
ORDER BY course;

//Now I need to add COUNT(student_id) and GROUP BY
SELECT DISTINCT(c.course), COUNT(s.student_id) AS count_of_students
FROM students AS s
FULL JOIN majors AS m ON s.major_id=m.major_id
FULL JOIN majors_courses AS mc ON m.major_id=mc.major_id
FULL JOIN courses AS c ON mc.course_id=c.course_id
GROUP BY course;

//Adding HAVING condition
SELECT DISTINCT(c.course), COUNT(s.student_id) AS count_of_students
FROM students AS s
FULL JOIN majors AS m ON s.major_id=m.major_id
FULL JOIN majors_courses AS mc ON m.major_id=mc.major_id
FULL JOIN courses AS c ON mc.course_id=c.course_id
GROUP BY c.course
HAVING COUNT(s.student_id) = 1;

//Adding alphabetical order
SELECT DISTINCT(c.course), COUNT(s.student_id) AS count_of_students
FROM students AS s
FULL JOIN majors AS m ON s.major_id=m.major_id
FULL JOIN majors_courses AS mc ON m.major_id=mc.major_id
FULL JOIN courses AS c ON mc.course_id=c.course_id
GROUP BY c.course
HAVING COUNT(s.student_id) = 1
ORDER BY c.course;
```


```
// FULL JOINs
// one-to-one, one-to-many
SELECT columns FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;
	SELECT * FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
	SELECT * FROM characters FULL JOIN sounds ON characters.character_id = sounds.character_id;

// many-to-many
SELECT columns FROM junction_table
FULL JOIN table_1 ON junction_table.foreign_key_column = table_1.primary_key_column
FULL JOIN table_2 ON junction_table.foreign_key_column = table_2.primary_key_column;
	SELECT * FROM character_actions
		FULL JOIN characters ON character_actions.character_id = characters.character_id
		FULL JOIN actions ON character_actions.action_id = actions.action_id;

TRUNCATE <table name> removes all data from the table
```