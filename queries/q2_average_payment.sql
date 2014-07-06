set hive.cli.print.header=true;

select payment_type, 
avg(total_amount) as average_payment,
avg(fare_amount) as average_fare,
avg(surcharge) as average_surcharge,
avg(mta_tax) as average_tax,
avg(tip_amount) as average_tip,
avg(tolls_amount) as average_toll
from fare
group by payment_type;
