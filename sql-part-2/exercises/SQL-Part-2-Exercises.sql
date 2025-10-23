# Exercises

To get started with the exercises, go ahead and take a look at RideShareDB. This database was created with data from a dataset on [Kaggle](https://www.kaggle.com/fivethirtyeight/uber-pickups-in-new-york-city). The dataset was made using data obtained from the NYC Taxi and Limosine Commission or TLC. TLC tracks this data by base and even rideshare companies such as Uber and Lyft have assigned bases that each pickup must be attributed to. For the exercises, we will be using the `other_FHV_services_jan_aug_2015` and `lyft` tables in RideShareDB. These tables include the data for each pickup attributed to a few other For-Hire Vehicles (FHV) services and Lyft. These tables do not include any data from Uber.

## String Functions

Write a query that returns the last 3 characters of the base name in other_FHV_services_jan_aug_2015. 
Do you see anything that is a common abbreviation at the end of business names?

use RideShareDB
SELECT 
base_name,
RIGHT(base_name, 3) AS last_three_chars
FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015

The number of trips and the number of pickups are both 
stored as strings in other_FHV_services_jan_aug_2015
This is because the data provided included spaces 
in some of the numbers. Write a query that returns 
the location of spaces in both of these columns.

SELECT 
Number_of_Trips,  
CHARINDEX(' ', Number_of_Trips) AS in_trips,
CHARINDEX(' ', Pick_Up_Date) AS in_pickups
FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015

## Date Functions

For other_FHV_services_jan_aug_2015, display the name of 
month of the pickup date and order in descending order. 
Is the result of this query what you expected? 
No, I expected it to list month as per calendar order.
But it considered it as text and list them in descending order.

SELECT 
DATENAME(month, pick_up_date) AS month_name
FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015
ORDER BY month_name DESC


Using other_FHV_services_jan_aug_2015, write a query that returns the day number 
of the pickup date and month name and orders it in 
ascending order by day number.

SELECT 
DAY(pick_up_date) AS day_num,
DATENAME(MONTH, pick_up_date) AS month_name
FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015
ORDER BY day_num ASC


## Aggregate Functions

Write a query that returns the most easterly Lyft pickup.

SELECT *
FROM RideshareDB.dbo.lyft
WHERE start_lng = (
SELECT MAX(start_lng)
FROM RideshareDB.dbo.lyft
)

Write a query the returns the most northerly Lyft pickup.

SELECT *
FROM RideshareDB.dbo.lyft
WHERE start_lat = (
SELECT MAX(start_lat)
FROM RideshareDB.dbo.lyft
)

Using other_FHV_services_jan_aug_2015, 
write a query that connects the the base number and the 
base name in a string that uses the 
following format: base_number: base_name.

SELECT 
CONCAT(Base_number, ': ', Base_name) AS base_info
FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015
