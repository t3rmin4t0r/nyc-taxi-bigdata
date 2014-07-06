nyc-taxi-bigdata
================

NYC Taxi data loading and analysis scripts.

This contains Hive/Hadoop programs to load and analyze data from the NYC Taxi Trip Data dump.

http://chriswhong.com/open-data/foil_nyc_taxi/

This is not a very large amount of data in ORC format

    3.9 G  /apps/hive/warehouse/nyc_taxi_data.db/trips
    1.8 G  /apps/hive/warehouse/nyc_taxi_data.db/fare

I have added some sample queries which follow the data analysis in

http://www.aurumahmad.com/nyc-mta-taxi-some-observations-part-i/

I am working on converting the lat-long data into a hex-tile format so that Tez apps can issue spatial queries on the same data.
