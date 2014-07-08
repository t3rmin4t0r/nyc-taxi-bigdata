set hive.cli.print.header=true;

-- travel more than 2 miles to arrive at a destination less than 1/2 mile away.
select count(1) as possible_roundtrips from 
-- use 6371 for kms
(select *, 3959 * acos( 
      cos(radians( pickup_latitude ))
    * cos(radians( dropoff_latitude ))
    * cos(radians( pickup_longitude ) - radians( dropoff_longitude ))
    + sin(radians( pickup_latitude )) 
    * sin(radians( dropoff_latitude ))
  ) as haversine_distance 
from trips) tt
WHERE haversine_distance <= 0.5
AND trip_distance > 4*haversine_distance
;
