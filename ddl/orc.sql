set hive.stats.autogather=true;
set hive.stats.dbclass=fs;

use nyc_taxi_data;

DROP TABLE IF EXISTS trips;
DROP TABLE IF EXISTS fare;

CREATE TABLE IF NOT EXISTS trips 
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
CLUSTERED BY (pickup_datetime, medallion)
SORTED BY (pickup_datetime, medallion)
INTO 199 buckets
STORED AS ORC
;

CREATE TABLE IF NOT EXISTS fare
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
CLUSTERED BY (pickup_datetime, medallion)
SORTED BY (pickup_datetime, medallion)
INTO 199 buckets
STORED AS ORC
;

insert overwrite table trips select * from raw_trips 
where medallion NOT IN ("medallion", "CFCD208495D565EF66E7DFF9F98764DA") and 
hack_license != "CFCD208495D565EF66E7DFF9F98764DA" and
medallion is not null and
pickup_datetime is not null
; 
insert overwrite table fare select * from raw_fare 
where medallion NOT IN ("medallion","CFCD208495D565EF66E7DFF9F98764DA") and 
hack_license != "CFCD208495D565EF66E7DFF9F98764DA" and
tip_amount < total_amount and
medallion is not null and
pickup_datetime is not null and
tip_amount < total_amount
; 
