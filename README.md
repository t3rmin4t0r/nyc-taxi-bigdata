nyc-taxi-bigdata
================

NYC Taxi data loading and analysis scripts.

This contains Hive/Hadoop programs to load and analyze data from the NYC Taxi Trip Data dump.

http://chriswhong.com/open-data/foil_nyc_taxi/

This is not a very large amount of data in ORC format (most of my queries take ~20-24s with Hive/Tez).

    3.9 G  /apps/hive/warehouse/nyc_taxi_data.db/trips
    1.8 G  /apps/hive/warehouse/nyc_taxi_data.db/fare

I am working on a fun project to figure out where a NYC Taxi driver should wait to get the best chance of a high fare passenger, given an hour of day, day of week, and month of year.

By converting the whole city map into a sequence of hexagon tiles, an analysis of the pick/drop off points can be arrived at.

Uber has a similar visualization, which I intend to apply on somewhat cleaner data.

http://bradleyvoytek.appspot.com/hoods.html

If you are trying to JOIN the fare/trips data, the unique JOIN keys are `medallion, pickup_datetime`.

If you have additional queries you want to contribute, please send in a pull-request. 

To get this started with, I have added some sample queries which follow the data analysis in

http://www.aurumahmad.com/nyc-mta-taxi-some-observations-part-i/
