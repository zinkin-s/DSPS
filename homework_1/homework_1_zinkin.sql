create database db1;

drop table goods;
drop table customers cascade;
drop table customer_address cascade;
drop table transactions cascade;


create table goods (
	goods_id integer primary key
	,brand text
	,product_id integer
	,product_line varchar(20)
	,product_class varchar(20)
	,product_size varchar(20)
	,list_price float
	,standard_cost float
);

create table customers(
	customer_id integer primary key
	,first_name text
	,last_name text
	,gender varchar(20)
	,DOB date
	,job_title text
	,job_industry_category text
	,wealth_segment text
	,deceased_indicator varchar(20)
	,owns_car varchar(20)
	,property_valuation integer
	,address_id integer
	,constraint fk_customer_address
		foreign key (address_id)
			references customer_address(address_id)
);

create table customer_address (
	address_id integer primary key
	,postcode integer
	,country text
	,state text
	,address text
);

create table transactions (
	transaction_id integer primary key
	,goods_id integer
	,customer_id integer
	,transaction_date date
	,online_order boolean
	,order_status varchar(30)
	,constraint fk_goods
		foreign key (goods_id)
			references goods(goods_id)
	,constraint fk_customers
		foreign key (customer_id)
			references customers(customer_id)
); 
