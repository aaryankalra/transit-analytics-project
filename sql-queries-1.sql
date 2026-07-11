create table bookings (
	date TIMESTAMP default null,
	time time default null,
	booking_id varchar(13) default null,
	booking_status varchar(20) default null,
	customer_id varchar(9) default null,
	vehicle_type varchar(12) default null,
	pickup_location text default null,
	drop_location text default null,
	v_tat int default null,
	c_tat int default null,
	canceled_rides_by_customer text default null,
	canceled_rides_by_driver text default null,
	incomplete_rides varchar(3) default null,
	incomplete_rides_reason text default null,
	booking_value int default null,
	payment_method varchar(14) default null,
	ride_distance int default null,
	driver_ratings numeric(2,1) default null,
	customer_rating numeric(2,1) default null,
	vehicle_images text default null
);

-- Now import the dataset (using pgAdmin UI)

select * from bookings;