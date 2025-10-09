-- Lab 2 - Single Table Select Statements 
-- Begin by making world database your active database. This can be done by double clicking the world database in your schema list on the left or by using issuing this command - USE WORLD;
USE WORLD; 

-- 1. Select all rows and all columns in the City table.
SELECT * FROM CITY; 

-- 2. Select the Name,  CountryCode and Population for each row in the City table, sort the list by population, smallest to largest.
SELECT NAME, COUNTRYCODE, POPULATION
	FROM CITY
		ORDER BY POPULATION ASC; 
			
-- 3. Select the Name, CountryCode and Population for each row in the City table, this time sort the list by CountryCode A-Z and then within each country by Population, largest population to smallest
SELECT NAME, COUNTRYCODE, POPULATION
	FROM CITY
		ORDER BY COUNTRYCODE ASC, POPULATION DESC; 
			

-- 4. Use a LIMIT clause to list the top twenty cities by population. Select all columns from the City table.
SELECT * FROM CITY
	ORDER BY POPULATION DESC
		LIMIT 20; 

-- 5. SELECT all columns from the City table, but only select rows where the population is greater than 500,000. Sort the list by the name of the city, in ascending order. 

SELECT * FROM CITY
	WHERE POPULATION > 500000
		ORDER BY NAME ASC; 
	
-- 6. Select the Code, Name, Continent for all countries in the Country table where the continent is either Africa or Asia;
SELECT CODE, NAME, CONTINENT
    FROM COUNTRY
        WHERE CONTINENT IN ('AFRICA', 'ASIA');
	

-- 7. Select the Code, Name, Continent, and SurfaceArea for all countries in Africa or any country anywhere in the world where the surface area is greater than 500000 sort the list by SurfaceArea largest to smallest;
SELECT CODE, NAME, CONTINENT, SURFACEAREA
	FROM country
		WHERE CONTINENT = 'AFRICA' OR SURFACEAREA > 500000
			ORDER BY SurfaceArea DESC; 


-- 8. Select the Code, Name, Continent, Population, and Region for all countries in Africa that have a population greater than 2,000,000 and is in the Western African region; 
SELECT CODE, NAME, CONTINENT, POPULATION, REGION 
	FROM country
		WHERE Continent = 'AFRICA' AND POPULATION > 2000000 AND REGION = 'WESTERN AFRICA'; 

-- 9. Select all columns from the country table where the continent is not equal to Africa;
SELECT * FROM country
	WHERE Continent <> 'AFRICA'; 

-- 10. SELECT the Code, Name, Population and Continent for any country in the table with a population greater than 10,000,000 that is either in South America or Europe - This is a compound query example, you will need to put parentheses () around some of your code. 
SELECT CODE, NAME, POPULATION, CONTINENT 
	FROM country
		WHERE POPULATION > 10000000 AND CONTINENT IN ('SOUTH AMERICA', 'EUROPE'); 

-- 11. Select all columns from the city table where the city.name starts with 'A' and whose population is greater than 500,000
SELECT * FROM CITY 
	WHERE NAME LIKE 'A%' AND POPULATION > 500000
		ORDER BY POPULATION DESC;


-- 12. Switch to the OM table by either running this command "USE OM" or by double clicking OM in your list of schemas. 
-- List all columns from the items table where the unit_price is between 13.00 and 16.95
USE OM; 
    SELECT * FROM ITEMS
        WHERE UNIT_PRICE BETWEEN 13.00 AND 16.95;


-- 13. List all columns from the items table where the unit_price is greater than 13.00
SELECT * FROM ITEMS
	WHERE UNIT_PRICE > 13.00; 

-- 14. List all columns from the items table where the unit_price is greater than or equal to 13.000
SELECT * FROM ITEMS
	WHERE UNIT_PRICE >= 13.000
		ORDER BY UNIT_PRICE ASC; 


-- 15. List all columns from the customers table, only include rows where the state is on the east coast ('NC', 'MD', 'DC', 'NY', 'NJ') 
USE OM; 
	SELECT * FROM CUSTOMERS
		WHERE CUSTOMER_STATE IN ('NC', 'MD', 'DC', 'NY', 'NJ'); 
	

-- 16. List all of the states in the customers table, but only list each state one time. 
USE OM; 
    SELECT DISTINCT CUSTOMER_STATE FROM CUSTOMERS 
        ORDER BY CUSTOMER_STATE;


-- 17. List all of the artists in the items table where then name of the artist CONTAINS this string of characters 'we' anywhere in the name. 
USE CHINOOK; 
SELECT * FROM ARTIST
    WHERE NAME LIKE '%WE%';

-- 18 For all customers in the customers table, combine the last name and first name, include a comma in the combined column so that the list looks like this last_name, first_name, for example Nelson Mandela would display as Mandela, Nelson
USE CHINOOK; 
    SELECT CONCAT(LASTNAME, ', ', FIRSTNAME) AS FULL_NAME
        FROM CUSTOMERS
        ORDER BY LASTNAME;


-- 19 List all the columns from the orders table where the order has not been shipped, (is null)
USE OM; 
	SELECT * FROM ORDERS
    WHERE SHIPPED_DATE IS NULL; 
    
-- 20 List all the columns from the customers table wher the customer's last name starts with an 'S' or the customer lives in Iowa (IA);
USE OM; 
	SELECT * FROM CUSTOMERS 
		WHERE CUSTOMER_LAST_NAME LIKE 'S%' OR CUSTOMER_STATE ='IA'; 
    


