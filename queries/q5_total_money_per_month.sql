set hive.cli.print.header=true;

select mm as month, 
sum(total_amount) as total_revenue 
from (select month(pickup_datetime) as mm, total_amount from fare) ff
group by mm
order by mm;
