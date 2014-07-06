set hive.cli.print.header=true;

select payment_type, 
sum(total_amount) as total,
sum(fare_amount)/sum(total_amount) as fare_pct,
sum(surcharge)/sum(total_amount) as surcharge_pct,
sum(mta_tax)/sum(total_amount) as tax_pct,
sum(tip_amount)/sum(total_amount) as tip_pct,
sum(tolls_amount)/sum(total_amount) as toll_pct
from fare
group by payment_type;
