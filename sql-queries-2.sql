-- KPI-BASED QUESTIONS

-- 1. Which vehicle type generated the highest total revenue?
create view vehicle_type_highest_total_revenue as
select vehicle_type, sum(booking_value) as total_value
from bookings
where booking_status = 'Success'
group by vehicle_type
order by total_value desc
limit 1;

-- 2. What is the total booking value for each vehicle type?
create view vehicle_type_total_booking_value as
select vehicle_type, sum(booking_value) as total_booking_value
from bookings
where booking_status = 'Success'
group by vehicle_type;

-- 3. Which payment method generated the highest revenue?
create view payment_method_highest_revenue as
select payment_method, sum(booking_value) as total_value
from bookings
where booking_status = 'Success'
group by payment_method
having payment_method != 'null'
order by total_value desc
limit 1;

-- 4. What is the average booking value for each vehicle type?
create view vehicle_type_avg_booking_value as
select vehicle_type, round(avg(booking_value), 2) as avg_value
from bookings
where booking_status = 'Success'
group by vehicle_type;

-- 5. Which 10 customers have spent the most money?
create view top_10_customer_most_spent as
select customer_id, sum(booking_value) as total_spent
from bookings
where booking_status = 'Success'
group by customer_id
order by total_spent desc
limit 10;

-- 6. What is the overall booking success rate?
create view overall_booking_success_rate as
select round(count(case when booking_status = 'Success' then 1 end)*100.0/count(*),2) as success_rate
from bookings;

-- 7. Which hour of the day has the highest number of bookings?
create view hour_of_day_most_bookings as
select extract(hour from time) as hour_of_day, count(*) as total_bookings
from bookings
group by hour_of_day
order by total_bookings desc 
limit 1;

-- 8. Which day has the highest number of bookings?
create view day_most_bookings as
select date(date) as booking_date, count(*) as total_bookings
from bookings
group by booking_date
order by total_bookings desc
limit 1;

-- 9. Which pickup location receives the highest number of bookings?
create view pickup_location_most_bookings as
select pickup_location, count(*) as total_bookings
from bookings
group by pickup_location
order by total_bookings desc
limit 1;

-- 10. Which pickup-drop route is the most popular?
create view popular_pickup_drop_route as
select pickup_location, drop_location, count(*) as total_bookings
from bookings
group by pickup_location, drop_location
order by total_bookings desc
limit 1;

-- 11. What is the cancellation rate?
create view cancellation_rate as
select round(count(case when booking_status in 
				('Canceled by Customer', 'Canceled by Driver') 
				then 1 end)*100.0/count(*), 2) as cancellation_rate
from bookings;

-- 12. Which vehicle type has the highest cancellation rate?
create view vehicle_type_highest_cancellation_rate as
select vehicle_type, round(count(case when booking_status in 
				('Canceled by Customer', 'Canceled by Driver') 
				then 1 end)*100.0/count(*), 2) as cancellation_rate
from bookings
group by vehicle_type
order by cancellation_rate desc
limit 1;

-- 13. What are the top 5 customer cancellation reasons?
create view top_5_customer_cancellation_reasons as
select canceled_rides_by_customer as reason, count(*) as total_count
from bookings
group by reason
having canceled_rides_by_customer != 'null'
order by total_count desc
limit 5;

-- 14. What are the top 5 driver cancellation reasons?
create view top_5_driver_cancellation_reasons as
select canceled_rides_by_driver as reason, count(*) as total_count
from bookings
group by reason
having canceled_rides_by_driver != 'null'
order by total_count desc
limit 5;

-- 15. Which pickup locations have the highest number of cancelled rides?
create view pickup_location_most_cancelled_rides as
select pickup_location, count(*) as cancelled_rides
from bookings
where booking_status in ('Canceled by Customer', 'Canceled by Driver')
group by pickup_location
order by cancelled_rides desc
limit 10;

-- 16. Which customers booked the most rides?
create view customer_most_rides_booked as
select customer_id, count(*) as total_bookings
from bookings
group by customer_id
order by total_bookings desc
limit 10;

-- 17. Which customers have the highest average booking value?
create view customer_highest_avg_booking_value as
select customer_id, round(avg(booking_value), 2) as avg_booking_value
from bookings
group by customer_id
order by avg_booking_value desc
limit 10;

-- 18. Which vehicle type has the highest average customer rating?
create view vehicle_type_highest_avg_customer_rating as
select vehicle_type, round(avg(customer_rating), 2) as avg_customer_rating
from bookings
group by vehicle_type
order by avg_customer_rating desc;

-- 19. Which vehicle type has the highest average driver rating?
create view vehicle_type_highest_avg_driver_rating as
select vehicle_type, round(avg(driver_ratings), 2) as avg_driver_rating
from bookings
group by vehicle_type
order by avg_driver_rating desc;

-- 20. Retrieve all successful bookings:
create view successful_bookings as
select * from bookings
where booking_status = 'Success';

-- 21. Find the average distance for each vehicle type
create view avg_distance_vehicle_type as
select vehicle_type, round(avg(ride_distance), 2) as avg_distance
from bookings
group by vehicle_type;

-- 22. Find the total number of cancelled rides by customers
create view total_cancelled_rides_customer as
select count(*) as total_cancelled_rides
from bookings
where booking_status = 'Canceled by Customer';

-- 23. List the top 5 customers who booked the highest number of rides
create view top_5_customer_most_rides as
select customer_id, count(customer_id) as count
from bookings
group by customer_id
order by count desc
limit 5;

-- 24. Get the number of rides cancelled by drivers due to personal or car-related issues
create view cancelled_by_driver_due_to_personal_car_issue as
select count(*)
from bookings
where canceled_rides_by_driver = 'Personal & Car related issue';

-- 25. Find the maximum and minimum driver ratings for Prime Sedan bookings
create view max_min_driver_rating_prime_sedan as
select max(driver_ratings) as maximum_rating, min(driver_ratings) as minimum_rating
from bookings
where vehicle_type = 'Prime Sedan';

-- 26. Retrieve all rides where payment was made using UPI
create view rides_upi as
select * from bookings
where payment_method = 'UPI';

-- 27. Find the average customer rating per vehicle type
create view avg_customer_rating_vehicle_type as
select vehicle_type, round(avg(customer_rating), 2) as avg_customer_rating
from bookings
group by vehicle_type;

-- 28. Calculate the total booking value of rides completed successfully
create view total_booking_value_successfull_rides as
select sum(booking_value) as total
from bookings
where incomplete_rides != 'Yes';

-- 30. List all incomplete rides along with the reason
create view incomplete_rides_reason as
select booking_id, incomplete_rides_reason as reason
from bookings
where incomplete_rides = 'Yes';