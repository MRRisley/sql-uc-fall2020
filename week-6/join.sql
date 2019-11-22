/* The SQL JOIN */

	/* Recall that:
	1. A JOIN merges data from two tables.
	2. An INNER JOIN only returns results when there is a match.
	3. An OUTER JOIN will return all records from one or more tables,
		regardless of whether there is a match.
		a. FULL JOIN: returns all records from both tables.
		b. LEFT/RIGHT JOIN: returns all records from LEFT/RIGHT table only.


/* Checking JOIN criteria for duplicates 

Table: Person.BusinessEntityAdress

1. Check if there are duplicate values for the BusinessEntityID field.
2. Based on result in 1, can this field be a Primary Key by itself?
3. Select all fields for a BusinessEntityID value that appears in more than one record.
	Where is the non-unique value?
4. Look at the PK and FKs for the Table.
5. Verify that the AddressID field contains only unique values.

*/


/* JOIN Example A 

Tables: Person.BusinessEntityAdress & Person.Address

1. Verify the Person.Address table has only unique values for AddressID.
2. Based on the answer to (1) and (5) above, will different records be returned
	depending on the type of join used?
3. Test the answer to (2) by writing two queries, one with an INNER and one with a
	FULL join. Make sure the query has the following properties:
	(a) Include the following in the select list from Person.BusinessEntityAdress:
		- BusinessEntityID, AddressID, AddressTypeID.
	(b) Include the following in the select list from Person.Address:
		- AddressID, AddressLine1, AddressLine2, City, StateProvinceID, PostalCode 
	(c) JOIN on the field AddressID
	(d) ORDER BY BusinessEntityID in ascending order.

4. Use a SELECT [...] INTO in order to copy results from #3 to a temporary table.
	Only retain one AddressID field.
	
*/


/* JOIN Example B

Tables: temporary table from A and Person.AddressType

1. View the table Person.AddressType.
2. We want to add information to our temporary table from Person.AddressType
	about the type of address. What JOIN will be the most appropriate?
3. Write a query that joins the data based on your answer to (2.). Make sure
	the query has the following properties:
	(a) Include all fields from the temporary table.
	(b) Include only the field [Name] from Person.AddressType. Give it an alias. 
	(c) JOIN on the field AddressTypeID.
	(d) ORDER BY BusinessEntityID in ascending order.
4. Dump the results from #3 into another temporary table.
5. Query records from the table in #4 that have more than one record for a 
	value of BusinessEntityID. Return all fields and ORDER BY BusinessEntityID,
	then AddressTypeID.
6. Combine results from A & B into a single query using a multi-table JOIN.
	
*/




/* You Try:

Tables: the temporary table created in JOIN Example B and Person.StateProvince

1. We want to add information to our temporary table from Person.StateProvince
	to identify . What JOIN will be the most appropriate?
2. Write a query that joins the data based on your answer to (1.). Make sure
	the query has the following properties:
	(a) Include all fields from the temporary table.
	(b) Include the fields [Name] and [CountryRegionCode]. Give [Name] 
		an alias of [StateProvince].
	(c) JOIN on the field StateProvinceID.
	(d) ORDER BY BusinessEntityID then AddressTypeID, both in ascending order.
3. Output the results from #2 in a temporary table called #final_data.
4. What is the name of the CountryRegion that has the most Business Entities
	and how many are there? Be sure to only count unique values.
*/
