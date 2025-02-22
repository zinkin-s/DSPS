create database homework_2;

create table customer_20250217 (
	customer_id int4 primary key
	,first_name varchar(50)
	,last_name varchar(50)
	,gender varchar(30)
	,dob varchar(50)
	,job_title varchar(50)
	,job_industry_category varchar(50)
	,wealth_segment varchar(50)
	,decesed_indicator varchar(50)
	,owns_car varchar(30)
	,address varchar(50)
	,postcode varchar(30)
	,state varchar(30)
	,country varchar(30)
	,property_valuation int4
);

create table transaction_20250217 (
	transaction_id int4 primary key
	,product_id int4
	,customer_id int4
	,transaction_date varchar(30)
	,online_order varchar(30)
	,order_status varchar(30)
	,brand varchar(30)
	,product_line varchar(30)
	,product_class varchar(30)
	,product_size varchar(30)
	,list_price float4
	,standart_cost float4
);

select distinct brand
from transaction_20250217
where standart_cost > 1500


select *
from transaction_20250217
where to_date(transaction_date, 'DD.MM.YYYY') between '2017-04-01' and '2017-04-09'
and order_status = 'Approved'
order by to_date(transaction_date, 'DD.MM.YYYY') desc;

select distinct job_title
from customer_20250217
where job_industry_category in ('IT', 'Financial Services') and job_title like 'Senior_%';

select distinct brand
from transaction_20250217 t 
join customer_20250217 c on c.customer_id = t.customer_id 
where c.job_industry_category = 'Financial Services';

select c.customer_id, c.first_name, c.last_name, t.brand, t.online_order    
from customer_20250217 c 
join transaction_20250217 t on t.customer_id = c.customer_id 
where t.brand in ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles') and t.online_order::bool is true limit 10;

select distinct c.customer_id, c.first_name, c.last_name, t.transaction_id 
from customer_20250217 c 
left join transaction_20250217 t on t.customer_id = c.customer_id
where t.transaction_id is null;

select transaction_id, customer_id
    from transaction_20250217
    where customer_id in (852, 869, 1373, 2074, 2660, 3667, 3668)

with max_cost as (
	select *
	from transaction_20250217 t 
	where t.standart_cost = (select max(standart_cost) from transaction_20250217)
)
select *
from customer_20250217 c 
join max_cost m on m.customer_id = c.customer_id 
where c.job_industry_category = 'IT';

with transact as (
	select *
	from transaction_20250217 t 
	where to_date(t.transaction_date, 'DD.MM.YYYY') between '2017-07-07' and '2017-07-17'
)
select c.customer_id, c.first_name, c.last_name , c.job_industry_category, tr.transaction_date, tr.order_status  
from customer_20250217 c 
join transact tr on tr.customer_id = c.customer_id 
where c.job_industry_category in ('IT', 'Health') and tr.order_status = 'Approved';




