-- LAB 4 - Changing Data

-- Insert a comment with your name and the date submitted below this line. 
-- ANDREW STRIBLING 07.15.2025 

-- 1. Create a new table in World database called Lab4 that contains all of the cities in the United States
USE world; 
-- DROP TABLE IF EXISTS Lab4;

-- Create table Lab4 as (Select * from city where countrycode = 'USA');

-- After creating the table run the following statement to set the primary key and auto_increment the od. If you do not do this, you may have trouble with some of the later queries. 
-- ALTER TABLE Lab4 CHANGE id  id INT primary key NOT NULL AUTO_INCREMENT;

-- You may need to change a system setting in your server to complete the lab. This will allow you to update and delete records as instructed. 
SET SQL_SAFE_UPDATES = 0;

-- 2. Update Akron, Ohio in the lab4 table to set the population to 500,000.

UPDATE world.lab4
SET Population = 500000
WHERE lab4.Name = 'Akron'; 

-- 3. Update all cities in Ohio change the district to Pandora;

 UPDATE world.lab4 
 SET District = 'Pandora'
 WHERE District = 'Ohio';

-- 4. Change San Antonio to reflect the following values:
-- District = the state you would like to visit most
-- ID = 99999
-- Population = your current age

UPDATE world.lab4 
SET District = 'Hawaii'
WHERE District = 'San Antonio'; 

UPDATE world.lab4 
SET ID = '99999'
WHERE ID = '3801';

UPDATE world.lab4 
SET Population = '34'
WHERE Population = '1144646';
 

-- 5.  Add a record to the lab4 table with the following information
--   ID = 9999
--   Name =  your last name
--   CountryCode=  XYZ
--  District = your first name
--  Population = 300

-- INSERT INTO world.lab4 (id, name, CountryCode, District, Population) 
-- VALUES (9999, 'Stribling', 'XYZ', 'Andrew', 300);

-- 6. Notice above that we made id an auto increment field when we made it the primary key in the table. 
-- This means that we don't have to assign a new record an id, the server will. 
-- Add a record to lab4 with the following values and don't specify the new record's id. 
-- There are several ways to code for the auto incremented primary key. Any that works will get you credit. 

-- Name = your last name
-- CountryCode = ABC
-- District = your first name
-- Population = 600

-- insert into world.lab4
-- values ('stribling', 'ABC', 'philip', 600); 

-- -- 7. Use a single query to add the following 3 cities to lab4
-- --   Name	            CountryCode	District	 Population
-- --   Oz	      			YBR         Kansas		 -6
-- --   Mordor	      		LOR	        Middle Earth 50
-- --   Bajor	       		DS9         Wormhole	 1000

-- INSERT INTO world.lab4(Name, CountryCode, District, Population)
-- VALUES ('Oz', 'YBR', 'Kansas', -6),
-- ('Mordor', 'LOR', 'Middle Earth', 50), 
-- ('Bajor', 'DS9', 'Wormhole', 1000); 


-- 8. Delete all cities in lab4 with a population greater than 200000;

DELETE FROM world.lab4 
WHERE lab4.Population > 200000;

-- 9. Delete the Boise City from lab4;
DELETE FROM world.lab4
WHERE world.lab4.Name = 'Boise City';

-- 10. Delete all the cities in California whose name starts with the letter 'O';
DELETE FROM world.lab4 WHERE District = 'California' AND Name LIKE 'O%'; 
-- When you are done with this lab, you can get rid of the RockTrack table by running this query:

-- DROP table lab4;