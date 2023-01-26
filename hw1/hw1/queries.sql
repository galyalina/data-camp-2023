-- 3 --
select count(*) from (SELECT TO_CHAR(lpep_pickup_datetime, 'dd-mm') as trip_date, * FROM green_taxi_trips) t where t.trip_date='15-01';

-- 4--
select TO_CHAR(lpep_pickup_datetime, 'dd-mm') from green_taxi_trips where trip_distance in (select max(trip_distance) as longest_trip from green_taxi_trips);

-- 5--
select count(*) from green_taxi_trips where passenger_count = 2 and TO_CHAR(lpep_pickup_datetime, 'yyyy-dd-mm') = '2019-01-01';
select count(*) from green_taxi_trips where passenger_count = 3 and TO_CHAR(lpep_pickup_datetime, 'yyyy-dd-mm') = '2019-01-01';

-- 6--
SELECT
	*
FROM
	(SELECT
	 	t1.tip_amount, t1."PULocationID" as pickup , t1."DOLocationID" as dropoff, t2."Zone" as pickup_zone, t3."Zone" as dropoff_zone
	 FROM
	 	green_taxi_trips t1
	 LEFT JOIN
		zones t2
	 ON t1."PULocationID"=t2."LocationID"
	 LEFT JOIN
		zones t3
	 ON t1."DOLocationID"=t3."LocationID") t
WHERE pickup_zone = 'Astoria'
ORDER BY tip_amount DESC
limit 1
