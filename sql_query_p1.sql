use sql_project_p2
-- Data Cleaning
Select * from [dbo].[SQL - Retail Sales Analysis_utf ] 
	Where 
	transactions_id is null
	OR 
	sale_time is null
	OR
	
	cogs is null
	OR
	total_sale is null
	-- Delete Null _Values from Transactions_Id Column

	Delete from [dbo].[SQL - Retail Sales Analysis_utf ]
	Where 
	transactions_id is null
	OR 
	sale_time is null
	OR
	
	cogs is null
	OR
	total_sale is null

	-- Data exploration

	Select * from [dbo].[SQL - Retail Sales Analysis_utf ]
	-- Total Transaction_id We have
	Select Count(*) from [dbo].[SQL - Retail Sales Analysis_utf ]

	-- How Many sales we have?
	Select SUM(total_sale) AS Total_sales from [dbo].[SQL - Retail Sales Analysis_utf ]

	--How to Get Unique Customer_id

	Select Count(Distinct customer_id) As Customer_id from [dbo].[SQL - Retail Sales Analysis_utf ]
	
	--Check Unique Categories

	Select DISTINCT Category from [dbo].[SQL - Retail Sales Analysis_utf ]

	-- Data Analysis & Buiness Key Problems & Answers

	--Q.1 Write a SQL Query to retrieve all columns for sales made on '2022-11-05'
		Select * from 
		[dbo].[SQL - Retail Sales Analysis_utf ]
		Where sale_date = '2022-11-05'

	--Q.2 Write a SQL Query to retrieve all transactions where the category is 
	--'Clothing' and the quantity sold is more than 3 in the Nov 2022?
		
		

		SELECT * FROM [dbo].[SQL - Retail Sales Analysis_utf ]
		WHERE category = 'Clothing'
		AND quantiy >= 3
		AND FORMAT(sale_date, 'yyyy-MM') = '2022-11';

	--Q.3 Write a SQL Query to calculate the total sales (total_sale) for each category.

		SELECT 
		category,
		SUM(total_sale) AS Total_Sales
		FROM [dbo].[SQL - Retail Sales Analysis_utf]
		GROUP BY category;
		
	--Q.4 Write a SQL Query to find the average age of custmors who purchased items from the 'Beauty' Category.
		SELECT AVG(age) AS Average_Age from [dbo].[SQL - Retail Sales Analysis_utf ]
		WHERE Category = 'Beauty'

	--Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
		Select * from [dbo].[SQL - Retail Sales Analysis_utf ]
		Where total_sale > 1000;
	--Q.6 Write a SQL Query to find the total number of transactions (transaction_id) made by each gender in each category.
		Select 
			Category,
			gender,
			COUNT(*) AS Total_Trans from [dbo].[SQL - Retail Sales Analysis_utf ]
			GROUP BY category,gender


	--Q.7 Write a SQL Query to calculate the average sale for each month.Find out best selling month in each year?

	Select TOP 1
		YEAR(sale_date) AS Sale_year,
		MONTH(sale_date) AS Sale_month,
		AVG(total_sale) AS Average_sale
	from [dbo].[SQL - Retail Sales Analysis_utf ]
	GROUP BY
		Year(sale_date),
		MONTH(sale_date)
	ORDER BY
		Sale_year,
		Sale_Month;
		


	--Q.8 Write a SQL Query to find the top 5 custmors based on the highest total sales?
		
		SELECT TOP 5
		customer_id,
			SUM(total_sale) AS total_sales
		FROM [dbo].[SQL - Retail Sales Analysis_utf ]
			GROUP BY customer_id
			ORDER BY total_sales DESC ;

	--Q.9 Write a SQL Query to find the number of unique customers who purchased items from each category?
			SELECT DISTINCT * 
			SELECT DISTINCT (category) FROM [dbo].[SQL - Retail Sales Analysis_utf ]

			SELECT  
			Category,
			COUNT(DISTINCT customer_id) 
			FROM [dbo].[SQL - Retail Sales Analysis_utf ] 
			GROUP BY Category

	--Q.10 Write a SQL query to create each shift and number of order (Example morning <= 12,Afternoon between 12 & 17, evening > 17)?
				
				WITH Hourly_sale AS (
					Select *,
				CASE
					WHEN DATEPART(HOUR,sale_time) < 12 THEN 'Morning'
					WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
					ELSE 'Evening'
				END AS Shift 
				From [dbo].[SQL - Retail Sales Analysis_utf ]
				)
				
				Select Shift, Count(*) AS total_hours from Hourly_sale
				GROUP BY Shift;



