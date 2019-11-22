/* CREATE TABLE */

	create table #loan_info
		(acct_num int primary key,
		loan_amt float,
		loan_term int)

	insert into #loan_info
	values	(1, 13398.66, 36),
			(2, 26370.63, 39),
			(3, 21109.77, 60),
			(5, 115000, 48)

	select * from #loan_info

	create table #vehicle_make
		(acct_num int primary key,
		vehicle_make char(50))

	insert into #vehicle_make
	values	(1, 'TOYOTA'),
			(3, 'FORD'),
			(4, 'FORD'),
			(5, 'TESLA')

	select * from #vehicle_make


/* INNER JOIN: EXAMPLE 1 FROM PPT */

	select *
	from #loan_info a
	inner join #vehicle_make b
	on a.acct_num = b.acct_num
	order by a.acct_num


/* FULL JOIN: EXAMPLE 2 FROM PPT */

	select isnull(a.acct_num, b.acct_num) as [acct_num]				
	,a.loan_amt				
	,a.loan_term				
	,b.vehicle_make				
	from #loan_info a				
	full join #vehicle_make b				
	on a.acct_num = b.acct_num				
	order by [acct_num]				


/* LEFT/RIGHT JOIN: EXAMPLE 3 FROM PPT */
	
	select loan.acct_num			
	,loan.loan_amt			
	,loan.loan_term			
	,make.vehicle_make			
	from #loan_info as [loan]			
	left join #vehicle_make as [make]			
	on loan.acct_num = make.acct_num			
	order by loan.acct_num			

	select loan.acct_num			
	,loan.loan_amt			
	,loan.loan_term			
	,make.vehicle_make			
	from #vehicle_make as [make] 			
	right join #loan_info as [loan]		
	on loan.acct_num = make.acct_num			
	order by loan.acct_num		


