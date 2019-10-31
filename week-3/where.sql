/* WHERE Clause */

	/* Recall that: 
	1. The WHERE filters records using logic.
	2. You must refer to original field names in the WHERE clause, but it
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

select top 10 city
from adventureworks2017.person.address
order by city desc


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
3. What are the first 10 records alphabetically for the FirstName field? Return only the FirstName field in the output.
4. What does the result in (3.) tell us about "typical" data?
5. Copy/paste the query from (3.). Edit the query to select the first 100 records and add the LastName field to the output. 
6. Referring to the output from the query in (5.), is the LastName field sorted in the output? Should we expect it to be?
7. Copy/paste the query from (5.). Edit the query to order first by LastName and then by FirstName. 

If you finish early: using Google, try to find if the [Person].[Person] table is indexed and on what fields.

*/
