
set hive.cli.print.header=true;

select weekday,  
sum(total_amount) as total_revenue 
from (select from_unixtime(unix_timestamp(pickup_datetime), 'EEEE') as weekday, total_amount from fare) ff
group by weekday;
