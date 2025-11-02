-- LAB 7: Data Types and Functions.  
-- Start with the ex database. 

-- 1.Write a SELECT statement that returns the department_name from the departments table and the last_name and first_name from the employees table. Use the concat function so that the report looks like this
-- Department - Last_Name, First_Name. Sort the report by this concatentated column so that the employees are listed by department A-Z.  Give the column header an alias called 'Combined'. Here's a tip - you can sort your report by your column alias name and save some typing! 

SELECT CONCAT(d.department_name, ' - ', e.last_name, ', ', e.first_name) AS Combined
FROM departments d
JOIN employees e ON d.dept_number = e.department_number
ORDER BY Combined;

-- 2.Write a SELECT statement that returns vendor_id and average invoice_total from the active_invoices  table for each vendor.  Round the averages to 2 digits.  Give this rounded average column an alias of your choosing. 

SELECT vendor_id, ROUND(AVG(invoice_total), 2) AS Average_Invoice
FROM active_invoices 
GROUP BY vendor_id;

-- 3. Add a CONCAT function to your solution in number 2 to insert a $ sign into the report. Use a different column alias for the formatted averages. And sort the report so that the highest averages are shown first. There is a trick to the order by clause.

SELECT vendor_id, CONCAT('$', ROUND(AVG(invoice_total), 2)) AS Formatted_Average
FROM active_invoices 
GROUP BY vendor_id
ORDER BY AVG(invoice_total) DESC;

-- 4. Finally use the LPAD function to add 15 spaces to your report from number 3. This will make your column appear right justified. Use a different column alias for this report. 

SELECT vendor_id, LPAD(CONCAT('$', ROUND(AVG(invoice_total), 2)), 15, ' ') AS Right_Justified_Average
FROM active_invoices
GROUP BY vendor_id
ORDER BY AVG(invoice_total) DESC;

-- 5. Display the first initial, last name, and phone number of each customer in the customers table.

SELECT LEFT(customer_first_name, 1) AS First_Initial, customer_last_name, customer_phone
FROM customers;

-- 6. Return these columns from the customer table, customer_id, last_name and customer_phhone. Use the substr and lpad functions to render the phone number like this: *********9999, where 9999 is the last four numbers of the customer's phone number.

SELECT customer_id, customer_last_name, LPAD(SUBSTR(customer_phone, -4), 13, '*') AS Masked_Phone
FROM customers;

-- 7. use the concat_ws function to render to display the customer lastname and firstname in this manner: Lackey, Toby. Only display customers whose last name is longer than 5 characters.

SELECT CONCAT(customers.customer_last_name, ', ', customers.customer_first_name) AS Full_Name
FROM customers
WHERE LENGTH(customers.customer_last_name) > 5;


-- Switch to the Sakila Database. 


-- 8. Look at the Film table. The title column is the name of our films. They are all two words. Use the Substring_Index function to split the column into two columns. Name the columns "First Word" and "Second Word"

SELECT 
    SUBSTRING_INDEX(title, ' ', 1) AS 'First Word',
    SUBSTRING_INDEX(title, ' ', -1) AS 'Second Word'
FROM film;

-- 9. For each row in the payment table, display the amount, the amount rounded to 1 decimal place, amount truncated to 1 decimal place, the nearest integer <= the  amount, the nearest integer >= the amount, and a random number between 1 and 10 using the payment_id as a seed. 

SELECT 
    amount,
    ROUND(amount, 1) AS Rounded_1_Decimal,
    TRUNCATE(amount, 1) AS Truncated_1_Decimal,
    FLOOR(amount) AS Floor_Amount,
    CEILING(amount) AS Ceiling_Amount,
    ROUND(RAND(payment_id) * 9) + 1 AS Random_1_to_10
FROM payment;

-- 10. Use now and curtime functions to display these values on your system

SELECT NOW() AS Current_DateTime, CURTIME() AS Current_Time;

-- 11. Count the number of payments grouped by the day of the week using the payment_date in the payments table. 

SELECT 
    DAYNAME(payment_date) AS Day_of_Week,
    COUNT(*) AS Payment_Count
FROM payment
GROUP BY DAYNAME(payment_date)
ORDER BY DAYOFWEEK(payment_date);

-- 12. Display all columns and rows from the payment table where the payment_date is in the second quarter of 2005. Hint you will need to use two functions in the WHERE clause, YEAR and QUARTER

SELECT *
FROM payment
WHERE YEAR(payment_date) = 2005 AND QUARTER(payment_date) = 2;

-- 13. Use a date function to return the customer_id, payment_date and the amount for all payments in the payment table  that were placed on the 14th day of any month. 

SELECT customer_id, payment_date, amount
FROM payment
WHERE DAY(payment_date) = 14;

-- 14. Use a case function to display the following information from the Film table. The title, the replacement cost and a column that says 'Must be locked' if the rating for the fim is NC-17 or R, and 'Should be locked' if the rating is 'PG-13', or 'Unlocked' if the rating is G or PG. Name this column 'Store Placement'.

SELECT 
    title,
    replacement_cost,
    CASE 
        WHEN rating IN ('NC-17', 'R') THEN 'Must be locked'
        WHEN rating = 'PG-13' THEN 'Should be locked'
        WHEN rating IN ('G', 'PG') THEN 'Unlocked'
    END AS 'Store Placement'
FROM film;

-- 15.. Use the date format function to format the last_update column in the film table so that the date displays like this  MM/DD/YY. Use a column alias of your choice for the formatted date. For this  report display the film_id, the title, and the formatted last_update data. Also display the data in special_features column, but replace the commas with periods. 

SELECT 
    film_id,
    title,
    DATE_FORMAT(last_update, '%m/%d/%y') AS Formatted_Date,
    REPLACE(special_features, ',', '.') AS Modified_Features
FROM film;

-- 16. Use an IF statement to display the film_id, title, the description, the replacement cost,  and the words "High Cost" for any film whose replacement_cost is > 15.00 and the words "Low Cost if the film's replacement cost is <= 15.00 for all the films in the film table. Name the column with the IF condition, 'Theft Rating' Your report should only include films that have a description whose 2nd word is 'Thoughtful'. Note that all descriptions begin with the word 'A' so the second word always starts in position 3.

SELECT 
    film_id,
    title,
    description,
    replacement_cost,
    IF(replacement_cost > 15.00, 'High Cost', 'Low Cost') AS 'Theft Rating'
FROM film
WHERE SUBSTR(description, 3, 10) = 'Thoughtful';










