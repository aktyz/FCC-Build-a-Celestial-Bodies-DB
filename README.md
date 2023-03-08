# FCC-Build-a-Celestial-Bodies_DB
One of the projects to complete [FreeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-database/)

## My notes from the tutorials completed up to this point:

### PostGres Commands
```
psql --username=freecodecamp --dbname=postgres
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
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
```