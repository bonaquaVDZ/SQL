/* Challenge 1:
1. Create a pastries table
	- It should include two columns: name and quantity
	- Name is 50 characters max
2. Inspect your table/columns in the CLI
3. Delete your table!
*/

-- 1. Creating Pastries Table
CREATE TABLE pastries(
name VARCHAR(50),
quantity INT
);

-- 2. Inspecting Tables/Columns
SHOW TABLES;
SHOW COLUMNS FROM pastries;
DESC pastries;

-- 3. Deleting Table
DROP TABLE pastries;