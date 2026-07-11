-- KPI-BASED QUESTIONS

-- 1. Which vehicle type generated the highest total revenue?
select * from vehicle_type_highest_total_revenue;

-- 2. What is the total booking value for each vehicle type?
select * from vehicle_type_total_booking_value;

-- 3. Which payment method generated the highest revenue?
select * from payment_method_highest_revenue;

-- 4. What is the average booking value for each vehicle type?
select * from vehicle_type_avg_booking_value;

-- 5. Which 10 customers have spent the most money?
select * from top_10_customer_most_spent;

-- 6. What is the overall booking success rate?
select * from overall_booking_success_rate;

-- 7. Which hour of the day has the highest number of bookings?
select * from hour_of_day_most_bookings;

-- 8. Which day has the highest number of bookings?
select * from day_most_bookings;

-- 9. Which pickup location receives the highest number of bookings?
select * from pickup_location_most_bookings;

-- 10. Which pickup-drop route is the most popular?
select * from popular_pickup_drop_route;

-- 11. What is the cancellation rate?
select * from cancellation_rate;

-- 12. Which vehicle type has the highest cancellation rate?
select * from vehicle_type_highest_cancellation_rate;

-- 13. What are the top 5 customer cancellation reasons?
select * from top_5_customer_cancellation_reasons;

-- 14. What are the top 5 driver cancellation reasons?
select * from top_5_driver_cancellation_reasons;

-- 15. Which pickup locations have the highest number of cancelled rides?
select * from pickup_location_most_cancelled_rides;

-- 16. Which customers booked the most rides?
select * from customer_most_rides_booked;

-- 17. Which customers have the highest average booking value?
select * from customer_highest_avg_booking_value;

-- 18. Which vehicle type has the highest average customer rating?
select * from vehicle_type_highest_avg_customer_rating;

-- 19. Which vehicle type has the highest average driver rating?
select * from vehicle_type_highest_avg_driver_rating;

-- 20. Retrieve all successful bookings:
select * from successful_bookings;

-- 21. Find the average distance for each vehicle type
select * from avg_distance_vehicle_type;

-- 22. Find the total number of cancelled rides by customers
select * from total_cancelled_rides_customer;

-- 23. List the top 5 customers who booked the highest number of rides
select * from top_5_customer_most_rides;

-- 24. Get the number of rides cancelled by drivers due to personal or car-related issues
select * from cancelled_by_driver_due_to_personal_car_issue;

-- 25. Find the maximum and minimum driver ratings for Prime Sedan bookings
select * from max_min_driver_rating_prime_sedan;

-- 26. Retrieve all rides where payment was made using UPI
select * from rides_upi;

-- 27. Find the average customer rating per vehicle type
select * from avg_customer_rating_vehicle_type;

-- 28. Calculate the total booking value of rides completed successfully
select * from total_booking_value_successfull_rides;

-- 30. List all incomplete rides along with the reason
select * from incomplete_rides_reason;