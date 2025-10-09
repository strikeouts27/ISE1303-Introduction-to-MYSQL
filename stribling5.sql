-- Coding summary queries
-- insert a comment below this one with your name and the date you started the lab. 
-- Andrew Stribling Date Lab Started 07.28.25 

-- TEST YOUR QUERIES BEFORE SUBMITTING!!!!
-- If you don't understand the expected results required of a certain question please contact your instructor before you submit the assignment 
-- Make the world database your active database
USE world; 

--  1. Write a SELECT statement that returns the number of cities in the city table. 
-- SELECT COUNT(city.Name) FROM city; 

--   2. Write a SELECT statements that displays the largest population, the smallest population, the average population, the total population of all of the cities in the  city table group this report by the countrycode. 
-- SELECT CountryCode, max(city.Population), min(city.Population), round(avg(city.Population),2), sum(city.Population)
-- FROM city 
-- GROUP BY CountryCode; 

--  3. Repeat the query for number 2, but this time use column aliases of your choosing for each of these, and round the average population top make it a whole number.
-- SELECT CountryCode,
-- MAX(c.Population), MIN(c.Population), round(AVG(c.Population)), SUM(c.Population)
-- FROM city AS c
-- GROUP BY CountryCode;

--   4. Count each countrycode  that exists in the city table, but only count each code one time.  
-- SELECT COUNT(DISTINCT CountryCode) FROM city; 

--   5. Names of cities, such as San Jose, are listed in more than one country. 
-- Compose a query that lists the name of each city one time and counts the number of times the name occurs in the table. 
-- Sort the report so that the cities with the highest number of occurances in the database are at the top. 
-- SELECT city.Name, COUNT(*)
-- FROM city 
-- GROUP BY NAME
-- ORDER BY COUNT(*) DESC; 
 
--  6. For each country in the database count the number of cities listed in the country. 
-- List the country code and number of cities listed. 
-- Limit your list to the 50 countries with the most cities listed. 

-- SELECT CountryCode, COUNT(*)
-- FROM city 
-- GROUP BY CountryCode;

--   7. Total the population for each continent in the databse. List the continent as well as the total population. 
-- SELECT Continent, SUM(Population)
-- FROM country
-- GROUP BY Continent; 

--   8. In the countrylanguage table languages are listed for each country code. List country codes and the number of languages for each country with more than 5 languages. 

-- SELECT CountryCode, COUNT(*)
-- FROM countrylanguage 
-- GROUP BY CountryCode 
-- HAVING COUNT(*) > 5; 

--  9. The countrylanguage table also estimates what percentage of the population speaks each language. Modify number 8 so that you only count languages where the number of speakers is greater than 5% in countries with more than 5 languages. 

-- SELECT CountryCode, COUNT(*) AS NumberOfLanguages
-- FROM countrylanguage
-- WHERE Percentage > 5
-- GROUP BY CountryCode
-- HAVING COUNT(*) > 5;


--  10. Display the countrycodes and the number of official languages for each country in the countrylanguage table that has more than one official language. 

-- SELECT CountryCode, COUNT(*) AS NumberOfOfficialLanguages
-- FROM countrylanguage
-- WHERE IsOfficial = 'T'
-- GROUP BY CountryCode
-- HAVING COUNT(*) > 1; 






