CREATE DATABASE IF NOT EXISTS nyc_taxi_data;

USE nyc_taxi_data;

CREATE TABLE IF NOT EXISTS raw_trips 
(
 medallion string,
 hack_license string,
 vendor_id string,
 ate_code int,
 store_and_fwd_flag string,
 pickup_datetime TIMESTAMP,
 dropoff_datetime TIMESTAMP,
 passenger_count int,
 trip_time_in_secs int,
 trip_distance DECIMAL(9,6),
 pickup_longitude DECIMAL(9,6),
 pickup_latitude DECIMAL(9,6),
 dropoff_longitude DECIMAL(9,6),
 dropoff_latitude DECIMAL(9,6)
) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED as TEXTFILE 
TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE IF NOT EXISTS raw_fare
(
 medallion string,
 hack_license string,
 vendor_id string,
 pickup_datetime TIMESTAMP,
 payment_type string,
 fare_amount DECIMAL(9,6),
 surcharge DECIMAL(9,6),
 mta_tax DECIMAL(9,6),
 tip_amount DECIMAL(9,6),
 tolls_amount DECIMAL(9,6),
 total_amount DECIMAL(9,6)
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED as TEXTFILE 
TBLPROPERTIES ("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH 'trip_data_1.csv.gz' OVERWRITE INTO TABLE raw_trips;
LOAD DATA LOCAL INPATH 'trip_data_2.csv.gz' INTO TABLE raw_trips;
LOAD DATA LOCAL INPATH 'trip_data_3.csv.gz' INTO TABLE raw_trips;
LOAD DATA LOCAL INPATH 'trip_data_4.csv.gz' INTO TABLE raw_trips;
LOAD DATA LOCAL INPATH 'trip_data_5.csv.gz' INTO TABLE raw_trips;
LOAD DATA LOCAL INPATH 'trip_data_6.csv.gz' INTO TABLE raw_trips;
LOAD DATA LOCAL INPATH 'trip_data_7.csv.gz' INTO TABLE raw_trips;
LOAD DATA LOCAL INPATH 'trip_data_8.csv.gz' INTO TABLE raw_trips;
LOAD DATA LOCAL INPATH 'trip_data_9.csv.gz' INTO TABLE raw_trips;
LOAD DATA LOCAL INPATH 'trip_data_10.csv.gz' INTO TABLE raw_trips;
LOAD DATA LOCAL INPATH 'trip_data_11.csv.gz' INTO TABLE raw_trips;
LOAD DATA LOCAL INPATH 'trip_data_12.csv.gz' INTO TABLE raw_trips;

LOAD DATA LOCAL INPATH 'trip_fare_1.csv.gz' OVERWRITE INTO TABLE raw_fare;
LOAD DATA LOCAL INPATH 'trip_fare_2.csv.gz' INTO TABLE raw_fare;
LOAD DATA LOCAL INPATH 'trip_fare_3.csv.gz' INTO TABLE raw_fare;
LOAD DATA LOCAL INPATH 'trip_fare_4.csv.gz' INTO TABLE raw_fare;
LOAD DATA LOCAL INPATH 'trip_fare_5.csv.gz' INTO TABLE raw_fare;
LOAD DATA LOCAL INPATH 'trip_fare_6.csv.gz' INTO TABLE raw_fare;
LOAD DATA LOCAL INPATH 'trip_fare_7.csv.gz' INTO TABLE raw_fare;
LOAD DATA LOCAL INPATH 'trip_fare_8.csv.gz' INTO TABLE raw_fare;
LOAD DATA LOCAL INPATH 'trip_fare_9.csv.gz' INTO TABLE raw_fare;
LOAD DATA LOCAL INPATH 'trip_fare_10.csv.gz' INTO TABLE raw_fare;
LOAD DATA LOCAL INPATH 'trip_fare_11.csv.gz' INTO TABLE raw_fare;
LOAD DATA LOCAL INPATH 'trip_fare_12.csv.gz' INTO TABLE raw_fare;

ANALYZE TABLE trips COMPUTE STATISTICS noscan; 
ANALYZE TABLE fare COMPUTE STATISTICS noscan; 
