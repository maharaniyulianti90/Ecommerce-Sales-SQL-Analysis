select 
count (customer_id) as total_customers,
sex 
from customer_details 
where sex in ('Male','Female')
group by sex;

select 
basket_details.customer_id,
sum(basket_details.basket_count)as total_bought,
customer_details.sex
from basket_details 
inner join customer_details on basket_details.customer_id = customer_details.customer_id
group by basket_details.customer_id, customer_details.sex 
order by total_bought desc
limit 10;


select 
basket_details.customer_id,
sum(basket_details.basket_count)as total_bought,
customer_details.sex
from basket_details 
inner join customer_details on basket_details.customer_id = customer_details.customer_id
group by basket_details.customer_id, customer_details.sex 
order by total_bought asc
limit 10;


select
count(customer_id)as total_customer,
basket_date,
sum(basket_count) as total_daily_sales
from basket_details
group by basket_date 
order by total_daily_sales desc;

select 
product_id,
sum(basket_count)as total_quantity
from basket_details
group by product_id 
order by total_quantity desc 
limit 10;

select 
count (customer_id) as total_customers,
sex,
tenure
from customer_details 
where tenure <= 6 and sex in ('Female','Male')
group by customer_details.sex, customer_details.tenure
order by customer_details.tenure desc;
