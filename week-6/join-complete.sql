/* The SQL JOIN */

	/* Recall that:
	1. A JOIN merges data from two tables.
	2. An INNER JOIN only returns results when there is a match.
	3. An OUTER JOIN will return all records from one or more tables,
		regardless of whether there is a match.
		a. FULL JOIN: returns all records from both tables.
		b. LEFT/RIGHT JOIN: returns all records from LEFT/RIGHT table only.
	*/

/* Checking JOIN criteria for duplicates 

Table: Person.BusinessEntityAddress

1. Check if there are duplicate values for the BusinessEntityID field.
2. Based on result in 1, can this field be a Primary Key by itself?
3. Select all fields for a BusinessEntityID value that appears in more than one record.
	Where is the non-unique value?
4. Look at the PK and FKs for the Table.
5. Verify that the AddressID field contains only unique values.

*/

		/* Ex 1 */

		select 
		businessentityid,
		count(*) [count]
		from Person.BusinessEntityAddress
		group by BusinessEntityID having count(*) > 1

		/* Ex 2: No because there are not unique values. */

		/* Ex 3 */
		select *
		from Person.BusinessEntityAddress
		where businessentityid = 332

		/* Ex 5 */
		select 
		addressid,
		count(*) [count]
		from Person.BusinessEntityAddress
		group by addressid having count(*) > 1


/* JOIN Example A 

Tables: Person.BusinessEntityAddress & Person.Address

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

	/* Ex 1: AddressID is PK */
	select 
	addressid,
	count(*) [count]
	from Person.[Address]
	group by addressid having count(*) > 1

	/* Ex 2: Not enough information to determine. We need
	to know how many values of AddressID are matched 
	between the two tables. */

	/* Ex 3 */
	select 
	a.BusinessEntityID, a.AddressID, a.AddressTypeID,
	b.AddressID, b.AddressLine1, b.AddressLine2, 
	b.City, b.StateProvinceID, b.PostalCode 
	from Person.BusinessEntityAddress a
	inner join Person.[Address] b
	on a.addressid = b.addressid
	ORDER BY BusinessEntityID
	--19,614

	select 
	a.BusinessEntityID, a.AddressID, a.AddressTypeID,
	b.AddressID, b.AddressLine1, b.AddressLine2, 
	b.City, b.StateProvinceID, b.PostalCode 
	from Person.BusinessEntityAddress a
	full join Person.[Address] b
	on a.addressid = b.addressid
	--where (a.addressid is null or b.addressid is null) 
	--/*the WHERE clause returns unmatched records if they exist*/ 
	ORDER BY BusinessEntityID
	--19,614

	/* Ex 4 */

	select 
	a.BusinessEntityID, a.AddressID, a.AddressTypeID,
	b.AddressLine1, b.AddressLine2, 
	b.City, b.StateProvinceID, b.PostalCode
	into #temp_a --INTO comes before FROM
	from Person.BusinessEntityAddress a
	inner join Person.[Address] b
	on a.addressid = b.addressid
	ORDER BY BusinessEntityID
	--this creates the local temporary table #temp_a

	select top 10 * from #temp_a
	--it can be queried like any other table
	--but when you close your session, the table no longer exists


	/* You cannot run a SELECT [...] INTO more than once
	because it creates a table. Once the table is created 
	once, it can't be created again.

	If you want to append records to a table, you must use
	an INSERT INTO clause. 
	
	This example is shown below. Then the temp table is 
	deleted with a DROP TABLE and recreated with the 
	SELECT [...] INTO */
	
	--insert into #temp_a 
	--select
	--a.BusinessEntityID, a.AddressID, a.AddressTypeID,
	--b.AddressLine1, b.AddressLine2, 
	--b.City, b.StateProvinceID, b.PostalCode
	--from Person.BusinessEntityAddress a
	--inner join Person.[Address] b
	--on a.addressid = b.addressid
	--ORDER BY BusinessEntityID
	----ran multiple times

	--select count(*) from #temp_a
	----Ooops!

	--drop table #temp_a
	----drop table

	--select 
	--a.BusinessEntityID, a.AddressID, a.AddressTypeID,
	--b.AddressLine1, b.AddressLine2, 
	--b.City, b.StateProvinceID, b.PostalCode
	--into #temp_a 
	--from Person.BusinessEntityAddress a
	--inner join Person.[Address] b
	--on a.addressid = b.addressid
	--ORDER BY BusinessEntityID


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

	/* Ex 1 */
	select top 10 * from Person.AddressType

	/* Ex 2: LEFT/RIGHT JOIN */

	/* Ex 3 */

	select 
	a.*, c.[name] as 'addresstype' 
	from #temp_a a
	left join Person.AddressType c
	on a.addresstypeid = c.addresstypeid
	ORDER BY BusinessEntityID

	/* Ex 4 */

	select 
	a.*, c.[name] as 'addresstype' 
	into #temp_final
	from #temp_a a
	left join Person.AddressType c
	on a.addresstypeid = c.addresstypeid
	ORDER BY BusinessEntityID

	select top 10 * from #temp_final

	/* Ex 5 */
	
	select 
	businessentityid,
	count(*) [count]
	into #dup_id 
	from #temp_final
	group by businessentityid having count(*) > 1
	--create temp table with duplicated BusinessEntityID

	select * from #dup_id
	--take a look at it

	select * from #temp_final
	where BusinessEntityID in 
		(select businessentityid from #dup_id) --nested SELECT
	ORDER BY BusinessEntityID, AddressTypeID
	--returns records from the original table with
	--duplicated BusinessEntityID values contained in #dup_id

	/* Ex 6 */
	select * from #temp_final


	select 
	a.BusinessEntityID, a.AddressID, a.AddressTypeID,
	b.AddressLine1, b.AddressLine2, 
	b.City, b.StateProvinceID, b.PostalCode, c.[name] as [AddressType]
	from Person.BusinessEntityAddress a
	
	left join Person.[Address] b
	on a.addressid = b.addressid
	
	left join Person.AddressType c
	on a.addresstypeid = c.addresstypeid
	
	ORDER BY a.BusinessEntityID




/* You Try:

Tables: the temporary table created in JOIN Example B and Person.StateProvince

1. We want to add information to our temporary table #temp_final from Person.StateProvince
	and want to retain all records within #temp_final. 
	What JOIN will be the most appropriate?
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
