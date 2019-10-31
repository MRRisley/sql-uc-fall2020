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


/* TOP 

1. selects specified number of records
2. safest

*/

select top 10 *
from AdventureWorks2017.person.[address]






/* The SELECT list 

1. can be fields

*/

select top 10 
	addressid,
	addressline1,
	city,
	stateprovinceid
from AdventureWorks2017.person.[address]
--select top 10 records for fields in the select list
--note these are not the same records from the prior query
--without specifying the order, SQL does not guarantee the order of results

select top 10 
	addressid,
	addressline1,
	city,
	stateprovinceid
from AdventureWorks2017.person.[address]
order by addressid


select 
	addressid,
	addressline1,
	city,
	stateprovinceid
from AdventureWorks2017.person.[address]
--select all records for fields in the select list




/* The SELECT list 

2. Can change the field names. 

Note that this does not change the underlying table/structure. 
It is simply what is returned in the output.

*/

select 
	addressid as pk,
	addressline1 as [address],
	city,
	stateprovinceid 'state_code'
from AdventureWorks2017.person.[address]





/* The SELECT list 

3. Can transform records. 

Note that this does not change the underlying table/structure. 
It is simply what is returned in the output.

*/

select top 50
left(addressid, 1) 
from AdventureWorks2017.person.[address]
--note that a modification of a field returns no field name.

select
left(addressid, 1) as pk_first_digit,
*
from AdventureWorks2017.person.[address]
--note that this is a record-by-record modification
--you can include * in the select list in addition to other fields



/* The SELECT list 

4. Can use functions over/across records. 

*/

select
max(addressid) as pk_max
from AdventureWorks2017.person.[address]
--how many records will be returned?
--can we add * to the select list? Why, why not?


/* 
You Try

Use the Employee table in the HumanResources schema.

1. How many records does the table contain?
2. How many fields does the table contain?
3. What kind of data does it contain?
4. Write a query to select the top 10 records for all fields.
5. Write a query to return all records for the following fields:
	a. BusinessEntityID re-named to pk
	b. NationalIDNumber re-named to natnl_id
	c. Gender
	d. HireDate re-named to start_date
6. Write a query to return the minimum and maximum hire date.
7. From 6, what is the practical implication of these two dates?

*/
