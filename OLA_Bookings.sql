create Database Ola;
use Ola;

#1. Retrive all successful bookings:
create View Successful_Bookings As 
SELECT * FROM bookings 
WHERE Booking_Status = 'Success'; 

SELECT * FROM  Successful_Bookings;

#2. Find the average ride distance for each vehichle type:
create View ride_distance_for_each_vehichle As
SELECT Vehicle_Type, Avg(Ride_Distance)
as avg_distance From bookings
Group By Vehicle_Type;

select * From ride_distance_for_each_vehichle;

#3. Get the total number of canceled rides by customers:
create view canceled_rides_by_customers as
SELECT count(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

select * from canceled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
create view Top_5_customers as
SELECT Customer_ID, count(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides desc limit 5;

select * from Top_5_customers;

#5. Get the number of rides canceled by driver due to personal and car-relates issuse:
create view Ride_Canceled_by_Driver_Persnoal_c_issues as
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Persnoal & car-relates issuse';

select * from Ride_Canceled_by_Driver_Persnoal_c_issues;


#6. find the maximum and minimum deiver raings for Prime Sedean bookings:
create view Driver_Ratings as
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROm bookings WHERE Vehicle_Type = 'Prime Sedan';

select * from  Driver_Ratings;

#7. Retrieve all rides where payment was made using UPI:
create view UPI_payment as
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

select * from UPI_payment;

#8. find the average customer rating per vehicle type:
create view AVG_CUST_Rating as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

select * from AVG_CUST_Rating;

#9. Calculate the total booking value of rides completed successfully:
create view rides_completed_successfully as
SELECT SUM(Booking_Value) as total_successful_value
FROM bookings
WHERE Booking_Status = 'Success';

select * from rides_completed_successfully; 

#10.List all incomplete rides along with the reason:
create view Incomplete_Rides_Reason as
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides ='Yes';

select * from Incomplete_Rides_Reason;