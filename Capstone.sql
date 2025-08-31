create database Capstone;
use capstone;

#1.Fix the table and columns names.

alter table `cleaned financial dataset`
rename to cleaned_data;
alter table cleaned_data
change column ï»¿Segment Segment varchar(50);

#2.Show all data.
select * from cleaned_data; 

#3.select all distinct countries from cleaned_data.
select distinct country
from cleaned_data;

#4.Find the total number of units sold across all products
select sum(`units sold`) as 'Total_Units_Sold'
from cleaned_data;


#5.List all unique products available in the dataset.
select distinct product
from cleaned_data;


#6.Show the top 10 rows ordered by highest sales.
select *
from cleaned_data
order by sales desc
limit 10;





#7.Calculate total sales per country.
select country,sum(sales) as 'Total_Sales'
from cleaned_data
group by Country
order by 'Total_Sales' desc;


#8.Find the average units sold per segment.
select segment,round(avg(`units sold`),0) as Avg_Units_Sold
from cleaned_data
group by Segment
order by Avg_Units_Sold;

#9.Get the sum of gross sales for each product.
select Product,sum(`Gross Sales`) as 'Total_Gross_Sales'
from cleaned_data
group by Product;



#10.Show the maximum and minimum sale price of each product.
select product,max(`sale price`) as max_price,min(`sale price`) as min_price
from cleaned_data group by product;


#11.Count how many transactions (rows) each segment has.
select segment,count(Sales) as Total_Transction
from cleaned_data
group by segment;


#12.Find all records where sales are greater than 50,000.
select*
from cleaned_data
where sales>50000;

#13.Retrieve sales records only for Germany and France.
select country,sales
from cleaned_data
where country In('Germany','France')
order by country;

#14.Show details of transactions where discount is not zero.
select *
from cleaned_data
where Discounts>0;


#15.List all products sold in the "Government" segment.
select Product
from cleaned_data
where Segment='Government';


#16.Find sales where COGS > 20,000.
select *
from cleaned_data
where COGS>20000;

#17.Calculate profit per country.
select country,round(sum(profit),0) as Total_Profit
from cleaned_data
group by Country
order by Total_Profit desc;


#18.Find the product with the highest total profit.
select product,sum(profit) as max_profit 
from cleaned_data
group by Product
order by max_profit desc
limit 1;


#19.Show average sales per product in each segment.
select segment,product,avg(sales) as avg_sales
from cleaned_data
group by Segment,product;

#20.Rank countries by their total gross sales (use RANK() or DENSE_RANK()).
SELECT Country,SUM(`Gross Sales`) AS Total_Gross_Sales,
RANK() OVER (ORDER BY SUM(`Gross Sales`) DESC) AS Sales_Rank
FROM Cleaned_Data
GROUP BY Country
ORDER BY Sales_Rank;

#21.Find the top 3 countries with the highest units sold.
select country,sum(`units sold`) as Total_units_sold
from cleaned_data
group by country
order by Total_units_Sold desc
limit 3;
























































