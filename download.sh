for x in `seq 1 12`; do
	wget -c https://nyctaxitrips.blob.core.windows.net/data/trip_data_$x.csv.zip
	wget -c https://nyctaxitrips.blob.core.windows.net/data/trip_fare_$x.csv.zip
done

