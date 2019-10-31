/* ORDERY BY and WHERE Clauses */

	/* Recall that: 
	1. An ORDER BY sorts records in ascending order by default.
	2. The WHERE filters records using logic.
	3. You must refer to original field names in the WHERE clause, but it
     is not required in the ORDER BY.
	*/





/* ORDER BY: ASCENDING 

1. What is the first City alphabetically in Person.Address?

*/

select *
from adventureworks2017.person.address
order by city

select top 1 city
from adventureworks2017.person.address
order by city

select top 10 city, *
from adventureworks2017.person.address
order by city 
--note the error with ORDER BY! 
--"ambiguous column" means that there is more than one field that shares the same name

select top 10 city 'dup_city_field', *
from adventureworks2017.person.address
order by dup_city_field 

select top 10 city 'dup_city_field', *
from adventureworks2017.person.address
order by city
--what field is used to sort?
--what happens if we remove * from the select field?

select top 10 AddressID
from adventureworks2017.person.address
order by city
--will this work?





/* ORDER BY: DESCENDING 

1. What is the last City alphabetically in Person.Address?

*/




/* ORDER BY: Multi-Level Sort
*/

select top 100 city, postalcode, addressline1
from AdventureWorks2017.person.[address]
order by city, postalcode

select top 100 city, postalcode, addressline1
from AdventureWorks2017.person.[address]
order by city, postalcode, addressline1

select top 100 city, postalcode, addressline1
from AdventureWorks2017.person.[address]
order by city desc, postalcode desc, addressline1
--what is the sort order for addressline1?





/* 
You Try

Use the Person table in the Person schema.

1. How many records does the table contain?
2. How many fields does the table contain?
3. What are the first 10 records alphabetically for the FirstName field? 
4. What does the result in (3.) tell us about "typical" data?
5. 


What kind of data does it contain?
4. Write a query to select the top 10 records for all fields.
5. Write a query to return all records for the following fields:
	a. BusinessEntityID re-named to pk
	b. NationalIDNumber re-named to natnl_id
	c. Gender
	d. HireDate re-named to start_date
6. Write a query to return the minimum and maximum hire date.
7. From 6, what is the practical implication of these two dates?

*/
