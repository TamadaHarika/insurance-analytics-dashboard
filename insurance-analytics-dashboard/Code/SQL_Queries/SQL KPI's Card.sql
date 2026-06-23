USE insurance_db;

##### KPI'S FOR BRANCH PERFORMANCE DASHBOARD

-- 1) No of Invoice by Account Executive

SELECT `Account Executive`, 
		COUNT(invoice_number) AS "Count_of_Invoice"
FROM Invoice
GROUP BY `Account Executive`
ORDER BY Count_of_Invoice DESC ;

-- 2) Yearly Meeting Count

SELECT  
		YEAR(meeting_date) AS Meeting_year, 
		COUNT(global_attendees) As Meeting_Count
FROM meeting
GROUP BY Meeting_year;

-- 3) Cross Sell, renewal & New --Target, Achieve, New Target

SELECT
	(SELECT SUM(`Cross sell bugdet`) FROM individual_budget) AS Target,
    
	(   ROUND(
		(SELECT SUM(Amount) FROM brokerage WHERE income_class = "Cross Sell") 
        + 
        (SELECT SUM(Amount) FROM fees WHERE income_class = "Cross Sell"),0)
	) AS Achieved,
    
    GREATEST(
		(SELECT SUM(`Cross sell bugdet`) FROM individual_budget)
		 -
		 (   ROUND(
			(SELECT SUM(Amount) FROM brokerage WHERE income_class = "Cross Sell") 
			+ 
			(SELECT SUM(Amount) FROM fees WHERE income_class = "Cross Sell"),0)
		 ),0
	) AS New

UNION ALL

SELECT
	(SELECT SUM(`New Budget`) FROM individual_budget) AS Target,
    
	(   ROUND(
		(SELECT SUM(Amount) FROM brokerage WHERE income_class = "New") 
        + 
        (SELECT SUM(Amount) FROM fees WHERE income_class = "New"),0)
	) AS Achieved,
    
    GREATEST(
		(SELECT SUM(`New Budget`) FROM individual_budget)
		 -
		 (   ROUND(
			(SELECT SUM(Amount) FROM brokerage WHERE income_class = "New") 
			+ 
			(SELECT SUM(Amount) FROM fees WHERE income_class = "New"),0)
		 ),0
	) AS New
    
UNION ALL

SELECT
	(SELECT SUM(`Renewal Budget`) FROM individual_budget) AS Target,
    
	(   ROUND(
		(SELECT SUM(Amount) FROM brokerage WHERE income_class = "Renewal") 
        + 
        (SELECT SUM(Amount) FROM fees WHERE income_class = "Renewal"),0)
	) AS Achieved,
    
    ( GREATEST(
					(SELECT SUM(`Renewal Budget`) FROM individual_budget)
					 -
					 (   ROUND(
						(SELECT SUM(Amount) FROM brokerage WHERE income_class = "Renewal") 
						+ 
						(SELECT SUM(Amount) FROM fees WHERE income_class = "Renewal"),0)
					 ),0
			  )
	) AS New;
    
-- 4) Stage Funnel by Revenue

SELECT stage, SUM(revenue_amount) AS revenue_amount
FROM opportunity
GROUP BY stage ;

-- 5) No of meetings By Account Exe

SELECT `Account Executive`, COUNT(global_attendees) AS Count_Meetings
FROM meeting
GROUP BY `Account Executive`;

-- 6) Open Opportunity Top-5 by Revenue

SELECT 
	opportunity_name, 
    stage, 
    revenue_amount 
FROM opportunity
WHERE stage IN ("Qualify Opportunity" ,"Propose Solution")
ORDER BY revenue_amount DESC
LIMIT 5;

-- 7) Open Opportunities

SELECT COUNT(stage) AS Open_Opportunities
FROM opportunity
WHERE stage IN ("Qualify Opportunity" ,"Propose Solution");

-- 8) Closed Opportunities

SELECT COUNT(stage) AS Closed_Opportunities
FROM opportunity
WHERE stage NOT IN ("Qualify Opportunity" ,"Propose Solution");

-- 9) Total Opportunities

SELECT COUNT(stage) AS Total_Opportunities
FROM opportunity;

-- 10) Conversion ratio

SELECT
		CONCAT(
				ROUND(
						((SELECT COUNT(stage)
						FROM opportunity
						WHERE stage NOT IN ("Qualify Opportunity" ,"Propose Solution"))
						/
						(SELECT COUNT(stage) FROM opportunity)) *100
					,2 )
			   ,"%")
 AS Conversion_Ratio;

-- 11) Total Target

SELECT
	(SELECT SUM(`New Budget`) FROM individual_budget)
	+ 
    (SELECT SUM(`Cross sell bugdet`) FROM individual_budget) 
	+ 
    (SELECT SUM(`Renewal Budget`) FROM individual_budget) AS TOTAL_TARGET;

-- 12) Total Revenue (Brokerage + Fees)	

SELECT
	(SELECT SUM(AMOUNT) FROM BROKERAGE)
	+
	(SELECT SUM(AMOUNT) FROM FEES) AS Total_Revenue;
    
-- 13) Invoice sales

SELECT SUM(amount) AS Invoice_sales
FROM Invoice ;

-- 14) Percentage of Achievement

SELECT
CONCAT(
	ROUND(
		 (SELECT
			(SELECT SUM(AMOUNT) FROM BROKERAGE)
			+
			(SELECT SUM(AMOUNT) FROM FEES)
		)    
		/
		(SELECT
			(SELECT SUM(`New Budget`) FROM individual_budget)
			+ 
			(SELECT SUM(`Cross sell bugdet`) FROM individual_budget) 
			+ 
			(SELECT SUM(`Renewal Budget`) FROM individual_budget)
		) * 100
		,2)
   ,"%") AS Percentage_of_Achievement;


#### Kpi's for Insurance policy dashboard

# 1) Total Policy

SELECT DISTINCT COUNT(`Policy ID`) AS Total_Policy_Count
FROM policy_details;

# 2) Total Customers

SELECT DISTINCT COUNT(`Customer ID`) AS Total_Customers
FROM customer_information;

# 3) Age Bucket Wise Policy Count

SELECT COUNT(DISTINCT `Policy ID`) AS Policy_count,
	CASE
		WHEN DATEDIFF(`Policy End Date`, `Policy Start Date`) <= 365 THEN '0-1 year'
        WHEN DATEDIFF(`Policy End Date`, `Policy Start Date`) <= 1095 THEN '0-3 year'
        WHEN DATEDIFF(`Policy End Date`, `Policy Start Date`) <= 1825 THEN '0-5 year'
        ELSE '5+ years'
	END AS Age_Buckets
FROM policy_details
GROUP BY Age_Buckets;

# 4) Gender Wise Policy Count

SELECT 
    Gender,
    COUNT(DISTINCT `Policy ID`) AS Policy_Count
FROM customer_information JOIN policy_details USING(`Customer ID`)
GROUP BY Gender;

# 5) Policy Type Wise Policy Count

SELECT 
    `Policy Type`,
    COUNT(DISTINCT `Policy ID`) AS Policy_Count
FROM policy_details
GROUP BY `Policy Type`;

# 6) Policy Expire This Year

SELECT YEAR(`Policy End Date`) AS Policy_Expire_in,
       COUNT( DISTINCT `Policy ID`) AS Policy_Count
FROM policy_details
WHERE YEAR(`Policy End Date`) = YEAR(NOW())
GROUP BY YEAR(`Policy End Date`)
ORDER BY YEAR(`Policy End Date`) DESC;

# 7) Premium Growth Rate

SELECT
    Year,
    premium_amount,
    ROUND(LAG(premium_amount, 1) OVER (ORDER BY Year),2) AS Py_PA,
    CONCAT(
        ROUND(
            (
                (premium_amount -
                 LAG(premium_amount, 1) OVER (ORDER BY Year))
                /
                 LAG(premium_amount, 1) OVER (ORDER BY Year)
            ) * 100,
            2
        ),
        '%'
    ) AS Growth_Rate
FROM
(
    SELECT
        YEAR(`Policy Start Date`) AS Year,
        ROUND(SUM(`Premium Amount`),2) AS premium_amount
    FROM policy_details
    GROUP BY YEAR(`Policy Start Date`)
) t1;

# 8) Claim Status Wise Policy Count

SELECT 
    `Claim Status`,
    COUNT(DISTINCT `Policy ID`) AS Policy_Count
FROM claims
GROUP BY `Claim Status`;

# 9) Payment Status Wise Policy Count

SELECT 
    `Payment Status`,
    COUNT(DISTINCT `Policy ID`) AS Policy_Count
FROM payment_history
GROUP BY `Payment Status`;

# 10) Total Claim Amount

SELECT SUM(`Claim Amount`) AS Total_Claim_Amount
FROM claims;














