/* Comments */

		--Comments are in green by default.

		/* There are two ways to make comments. */


		--These are single line
		--comments.


		/*

		These comments can 
		incorporate
		line
		breaks.

		*/


/* The SELECT Clause */

	/* Recall that: 
	1. Every query uses a SELECT clause (i.e., it is required).
	2. SELECT is one of several clauses that modify a query.
	3.Clauses can be required or optional. */

/* Select as a Calculator */

select 1+1

select 4*4

--add field names to output

select 12/2 '12 divided by 2' --option 1 (note the single quote)

select 12/2 [12 divided by 2] --option 2

select 12/2 12_div_by_2 --field names have rules when not using brackets/quotes

select 12/2 div_12_by_2 --option 3

select 12/2 as div_12_by_2 --option 4 (you can be more explicit with names with the AS keyword)

--data types

select 1345/3

select 1345/3.0 --guesses as to why there is a difference?

--select more fields

select 1345/3 [integer_type], 1345/3.0 as 'float'

/* 

You Try #1

Use the SELECT statement to:

1. Add 4 to the product of 5 and 3. Does SQL obey the order of operations?
2. Divide 50 by 100 (with no decimals added). Why can data types cause unexpected issues?
3. Perform the following in a single query and name the returned fields:
	a. Add 5 to 4.5. Create a field name using quotes.
	b. Divide 98 by 2.5. Create a field name using brackets AND the AS keyword.
	c. Multiply 3 by 75.9. Create a field name using neither brackets nor quotes.
4. Divide 1 by 0. What happens?

*/