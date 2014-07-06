set hive.cli.print.header=true;

select h24 as hour, 
sum(total_amount) as total_revenue 
from (select hour(pickup_datetime) as h24, total_amount from fare) ff
group by h24
order by h24;
