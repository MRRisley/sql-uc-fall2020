/* WHERE Clause */

	/* Recall that: 
	1. The WHERE filters records using logic.
	2. It always follows the FROM clause.
	3. You must refer to original field names in the WHERE clause, but it
           is not required in the ORDER BY.
	*/

/* 
NOTE: there are many uses and examples of logic not shown here. But, these examples
cover roughly 85% of the fundamentals of my work queries. 
*/



/* WHERE with equivalance logic.

1. How many records exist in the [Person].[Person] table where the FirstName field is Aaron?
2. How many people received the email promotion coded 2 in the table?
3. What is the alphabetically first last name that received an email promotion coded 0?

*/

	/* Ex 1 */
	select * 
	from adventureworks2017.person.person
	where firstname = 'aaron'

		/* Notes:

		(1) WHERE clause always comes after the FROM clause.
		(2) SQL is not case sensitive by default.
		(3) Strings, or character values, are always enclosed in single quotations.

		*/

	/* Ex 2 */
	select * 
	from adventureworks2017.person.person
	where emailpromotion = 2
	--Will the query work if we treat the number 2 as a string?

	/* Ex 3 */
	select * 
	from adventureworks2017.person.person
	where emailpromotion = 0
	--Where should we put the ORDER BY?





/* WHERE with compound logic.

1. How many people with a first name of Michael received the email promotion coded 2 in the table?
2. How many people with a first name of Michael or Mark received the email promotion coded 2 in the table? 

*/

	/* Ex 1 */
	select * 
	from adventureworks2017.person.person
	where emailpromotion = 2
	and firstname = 'michael'
	--AND means that both conditions must be True.

	/* Ex 2 */
	select * 
	from adventureworks2017.person.person
	where emailpromotion = 2
	and firstname = 'michael'
	or firstname = 'mark'
	--OR means that at least one condition must be True.

	select * 
	from adventureworks2017.person.person
	where firstname = 'michael'
	or firstname = 'mark'
	and emailpromotion = 2
	--Does order matter?

	select * 
	from adventureworks2017.person.person
	where (firstname = 'michael'
	or firstname = 'mark')
	and emailpromotion = 2
	--ALWAYS put quotations around your OR logic!
	--Go through each example to explain why all 3 return something different.
	--This becomes VERY important with NULL values (more later).

	select * 
	from adventureworks2017.person.person
	where firstname in ('michael', 'mark')
	and emailpromotion = 2
	--IN keyword can be a more straightforward solution for most OR logic.





/* WHERE with non-equivalance logic.

1. How many records exist in the [Person].[Person] table where the FirstName field is not Aaron?
2. How many people did not receive the email promotion coded 2 in the table?
3. How many people received the email promotion coded 2 in the table who were not named Michael or Mark? 

*/

	/* Ex 1 */
	select * 
	from adventureworks2017.person.person
	where firstname <> 'aaron'
	-- <> does not equal
	-- != will work as well

	/* Ex 2 */
	select * 
	from adventureworks2017.person.person
	where emailpromotion != 2

	/* Ex 3 */
	select * 
	from adventureworks2017.person.person
	where emailpromotion = 2
	and not (firstname = 'michael' or firstname = 'mark') 
	-- note the parentheses around the OR logic
	-- NOT before the or logic negates it

	select * 
	from adventureworks2017.person.person
	where emailpromotion = 2
	and firstname not in ('michael', 'mark')





/* WHERE with comparison logic.

1. How many records in the [Person].[Person] table have a BusinessEntityID greater than 1000?
2. How many records in the [Person].[Person] table were modified on or after January 1, 2014?
3. How many records in the [Person].[Person] table were modified in 1Q2014?
4. How many records in the [Person].[Person] table were not modified in 1Q2014? Order by last name in ascending order.

*/

	/* Ex 1 */
	select * 
	from adventureworks2017.person.person
	where businessentityid > 1000

	/* Ex 2 */
	select * 
	from adventureworks2017.person.person
	where modifieddate >= '1/1/2014'
	--note: dates use single quotations as well

	/* Ex 3 */
	select * 
	from adventureworks2017.person.person
	where modifieddate >= '1/1/2014'
	and modifieddate < '4/1/2014'

	select * 
	from adventureworks2017.person.person
	where modifieddate between '1/1/2014' and '3/31/2014'
	--between works will with dates

	/* Ex 4 */
	--Complete with class participation.




/* 
You Try

Use the Address table in the Person schema.

1. How many records have a StateProvinceID of 9?
2. How many records have PostalCode of 85004? Note: the PostalCode field is a character field.
3. How many records have a StateProvinceID of 9, 10, or 11?
4. How many records do not have a StateProvinceID less than or equal to 50?

Use the Person table in the Person schema.

5. How many records were modified in either 1Q2014 or 1Q2015?
6. How many records have a value of 'SC' for PersonType and a last name of Adams?
7. How many records have a value of other than 'SC' or 'EM for PersonType and received the email promotion coded with the value 1?
8. Write 3 queries that:
	a. Count the total number of records.
	b. Count the number of records that have a value of 'Mr.' for the field [Title].
	c. Count the number of records that do not have a value of 'Mr.' for the field [Title].
9. Referring to the answers in (8), do the counts in (b) and (c) sum to the total number of records (a)? 
   Browse through values for the field [Title] and provide the best guess of what value is not being counted.

If you finish early: using Google, find the logic/syntax required to count the remaining rows from (8). 
Then, using Google, try to find the data types for the [Person].[Address] table using SQL/SSMS.

*/
