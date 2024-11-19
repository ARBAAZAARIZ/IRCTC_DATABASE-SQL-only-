
-- 1 create database irctc
create database irctc2;

-- 2 choose irctc database to do operation
use irctc2;

-- create tables user,train,route,booking

-- to create user we need address table as address will be repeated so normalize address
--  and user table as address does not depend on any entity so its a strong entity 
-- strong entity are those whose table doesnt contain any foreign key 
-- and weak entity are those whose table which contain foreign key as it depends on strong entity 

-- 3 create table city by using DDL command
create table city (
city_id int primary key auto_increment,
city_name varchar(100)
);

-- What is the SQL command to see table schema ?
desc city;

-- 4 Insert the values in city table												------ used DML command 
insert into city(city_name)
values
-- 1          2          3          4           5           6             7
("Mumbai"),("Delhi"),("Nagpur"),("kolkata"),("Chennai"),("Bengaluru"),("Hyderabad");

--  5 What is the SQL command to view the records of the city table?
select * from city;

-- 6 Write SQL query to delete record whose city is nagpur						-------------- ued DMl command
set sql_safe_updates=0;
delete from city where city_name='Nagpur';
select * from city;

insert into city (city_id,city_name)
values
(3,'Nagpur');
select * from city;

-- 7 write a query to update nagpur to Goa
update city set city_name='Goa'where city_name='Nagpur';
select * from city;

-- 8 create table user by using DDL command										---------------- used DDL commnad
create table user(
user_id int primary key,
user_name varchar(100) not null,
user_email varchar(100) not null,
phone_number varchar(10) not null,
user_password varchar(8) not null
);
desc user;
-- 9 write query to drop user table  											---------------- used DDL command
drop table user;
-- re create the user table by using upper query 

-- 10 write a query to add address_id column 									------------ usd DDL command
alter table user add column address_id int ;

-- 11 write a query to rename address_id as city_id									--------------- used DDL command
alter table user rename column address_id to city_id;
desc user;

-- 12 write a query to make address_id as foreign key using address primary key
alter table user add constraint city_id_fk foreign key(city_id) references city(city_id);     -- --- used DDL and foreign key in this question

-- 13 write a query to modify user_password column size from 8 to 15
alter table user modify column user_password varchar(15) not null;

-- 14 insert values into user 															------- used DML to insert data into table 
insert into user 
values
(10,"arbaazaariz","md.rocks788@gmail.com","8591237781","arbaaz7781",1),
(20,"aayanahamed","aayanahamed@gmail.com","1234567801","aayan1234",1), 
(30,"insiyakapsi","insiyakapsi@gmail.com","1231111802","insiya5678",1), 
(40,"tejaskasare","tejaskasare@gmail.com","1232222803","tejas14",5),
(50,"maddy","maddy@gmail.com","9865209476","maddy9912",2),
(60,"shamiakhan","maddy@gmail.com","1212347823","shamia788",3),
(70,"barnali","barnali@gmail.com","2670463901","barnali1256",3),
(80,"vishalShawant","vishalshawat@gmail.com","9988778843","vishal76",7),
(90,"arbaazaheik","arbaaz.aheik@gmail.com","9819187065","arbaazsheik786",4),
(100,"mohdAdil","adil786@gmail.com","9078346319","adilmohd10",5),
(110,"arzooperween","perweenarzoo@gmail.com","8456051186","perweenarzoo56",6),
(120,"kaushikbattiwala","kaushikbatti@gmail.com","9822331091","battiwala112",7);

-- 15 create store procedure to show details of user with threre city using join     -----  used concept ofstore procedure and joins
call show_user_details();

-- 16 write a query to create a table route												----- used DDL to create table
create table route (
route_id int primary key,
source_station varchar(100),
destination_station varchar(100)
); 

-- 17 create store procedure to insert values into route table				---  used concept ofstore procedure to insert data

 call insert_into_route(111,"Chhatrapati Shivaji Maharaj Terminus","Howrah Junction"); -- upp
 call insert_into_route(112,"Howrah Junction","Chhatrapati Shivaji Maharaj Terminus"); -- down 
 
 call insert_into_route(122,"Chennai Central","Secunderabad Junction"); -- up
call insert_into_route(123,"Secunderabad Junction","Chennai Central"); -- down

call insert_into_route(133,"New Delhi Railway Station","Bangalore City Railway Station"); -- up
call insert_into_route(134,"Bangalore City Railway Station","New Delhi Railway Station"); -- down

call insert_into_route(144,"Charbagh Railway Station","Chhatrapati Shivaji Maharaj Terminus"); -- up
call insert_into_route(145,"Chhatrapati Shivaji Maharaj Terminus","Charbagh Railway Station"); -- down

call insert_into_route(222,"Visakhapatnam Railway Station","Vijayawada Junction"); -- up
call insert_into_route(223,"Vijayawada Junction","Visakhapatnam Railway Station"); -- down

call insert_into_route(434,"Chennai Central","Ahmedabad Junction"); -- up
call insert_into_route(435,"Ahmedabad Junction","Chennai Central"); -- down

call insert_into_route(998,"Nagpur Junction","Chhatrapati Shivaji Maharaj Terminus"); -- up
call insert_into_route(999,"Chhatrapati Shivaji Maharaj Terminus","Nagpur Junction"); -- down

-- entering duplicate to see weather constraints are working or not
call insert_into_route(998,"Nagpur Junction","Chhatrapati Shivaji Maharaj Terminus"); -- up
call insert_into_route(999,"Chhatrapati Shivaji Maharaj Terminus","Nagpur Junction"); -- down

call insert_into_route(287,"New Delhi Railway Station","Secunderabad Junction"); -- down
call insert_into_route(288,"Secunderabad Junction","New Delhi Railway Station"); -- down
 

select * from route;

-- 18 wrrite a query to create table train									--------      used DDL to create table
create table train(
train_number int primary key,
train_name varchar(100),
train_route_id int 
);
-- 19 write query to add column train_departure										----     used DDL to alter table
alter table train add column train_departure time not null;
desc train;


-- 20 write a query to insert records or data into train table                          -- used DML to insert
insert into train
values
(12101,'Jnaneswari Super Deluxe Express',111,'19:45:00'),
(22759,'Duronto Express',122,'13:50:00'),
(12262,'Duronto Express',133,'08:15:00'),
(12869,'CSMT Howrah Weekly Superfast Express',111,'11:05:00'),
(22760,'Duronto Express',123,'18:10:00'),
(12102,'Jnaneswari Super Deluxe Express',112,'01:35:00'),
(12860,'Vande Bharat Express',112,'03:35:00'),
(12261,'Duronto Express',133,'05:45:00'),
(22552,'Vande Bharat Express',144,'01:45:00'),
(12951,'Rajdhani Express',134,'17:20:00'),
(12603,'Vande Bharat Express',434,'16:15:00'),
(22691,'Vande Bharat Express',287,'14:00:00'),
(12240,'Duronto Express',998,'05:45:00'),
(22290,'Duronto Express',111,'08:15:00');

select * from train;

-- 21 count train and group by train name														-- group by claus used
select count(train_number),train_name from train group by train_name;

-- 22 how many vande bharat trains are introduce till now 									--- aggrigate function used 
select count(train_number) from train where train_name='Vande Bharat Express';

-- 23 write a query to show trains and there route                                               -- used inner join
select train.train_number,train.train_name,
route.source_station,route.destination_station
from train inner join route
on																		
train.train_route_id=route.route_id;

-- 24 update route where train number is 12261 by using sub query                 used sub query to get route id so it 
																					-- makes query dynamic, DML used 
update train set train_route_id=(select route_id from route where 
source_station='Bangalore City Railway Station' and
destination_station='New Delhi Railway Station')
where train_number=12261;

show tables;

-- 25 create table booking 															-- used DDL to create table
create table booking(
booking_id int primary key ,
user_id int not null,
train_id int  not null,
date_of_journey date not null,
price int not null
);

alter table booking rename column train_id to train_number;
describe booking;
-- 26 insert the records into booking table 										--	used DML query to insert
insert into booking(booking_id,user_id,train_number,date_of_journey,price) -- 2024
values
(1234,10,12101,"2014-01-13",2780),(9076,10,12101,"2024-01-13",1200),(6565,20,22759,"2024-10-24",6500),
(5678,10,12262,"2024-01-01",2500),(9077,40,12869,"2024-09-13",1098),(1111,30,12869,"2024-04-04",07),
(2036,20,22760,"2024-11-28",6889),(7866,30,12102,"2024-05-18",9077),(3300,40,12860,"2024-11-16",2430),
(2450,40,12860,"2024-11-16",2430),(9812,10,12261,"2024-12-01",3208),(7610,50,22552,"2024-05-30",3208),
(4021,70,12301,"2024-03-12",7689),(1076,50,12301,"2024-06-27",8090),(3785,90,12951,"2024-06-20",1076),
(8056,100,12603,"2024-07-07",2240),(6320,110,12102,"2024-04-07",7653),(8810,90,22691,"2024-05-15",10000),
(4245,120,12240,"2024-01-15",5493),(9912,100,22290,"2024-01-01",9087);

select * from booking;

-- 27 calculate average monrey collected in 2024												-- aggrigate function used

select ceil(avg(price)) as average_price from booking where date_of_journey = '2024-01-01' ;      


-- 28 write a query to show details of user who atleast booked one ticket from irctc    ---------    combined 3 tables by using join
--    																							         group by , alising  
select  user.user_name as user_name,
user.user_email as user_email,
user.phone_number as user_phone_number,
city.city_name as city
from user inner join booking
on user.user_id = booking.user_id
inner join city
 on user.city_id = city.city_id 
 group by booking.user_id;


-- 29 write a query to show numbers of tickets booked by each user,            	-------     aggrigate function,join concept
-- put that user on first and so on who bought most number of tickets			------		order by , group by
select count(booking_id) as Numbers_of_ticked_booked ,
user.user_name as user_name from booking inner join user
on user.user_id = booking.user_id group by booking.user_id order by count(booking_id) desc ;


-- 30 write a query to get total money collected by irctc by using ------------   			   by using user made function,
-- 																								aggrigate function	
select sum_of_price();

-- 31 write a query to get user from booking department
select user.user_name from user where user_id in(select distinct(user_id) from booking);
select booking.user_id from booking;

 -- 32 create a view to show data who have an account but havent booked ticked
create view user_not_book as select user.user_name from user where user_id not in(select booking.user_id from booking) ; 

-- 32 drop this view (user_not_book)
drop view user_not_book;

select * from user_not_book;

create table avg_price_recorder(avg_price int);
desc avg_price_recorder;
insert into avg_price_recorder select avg(price) from booking;

select avg(price) from booking;

-- 34 create a trigger to update avg price if user book ticket and store it into different table
create trigger update_avg_price
after insert on booking
for each row 																					-- used trigger,dml
update avg_price_recorder 
set avg_price=(select avg(price) from booking);

select * from avg_price_recorder;  -- 4633

set sql_safe_updates=0;
insert into booking(booking_id,user_id,train_number,date_of_journey,price) 
values
(8889,100,12101,"2024-01-13",10890);

select * from avg_price_recorder;  -- 4931 

 
