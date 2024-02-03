create database zomato_case;
select * from zomato;
select* from countrytable;

/*1) Help Zomato in identifying the cities with poor Restaurant ratings*/

select city,rating from zomato order by rating asc;

/*2) Mr.roy is looking for a restaurant in kolkata which provides online 
delivery. Help him choose the best restaurant*/

select restaurantid, city, has_online_delivery, rating 
from zomato
where city like "Kolkata" and Has_Online_delivery = "yes"
order by rating desc
limit 1;

/*3) Help Peter in finding the best rated Restraunt for Pizza in New Delhi.*/

select restaurantid,res_identify, city, cuisines, rating 
from zomato
where city ="new delhi" and
cuisines like "%pizza%"
order by rating desc;

/*4)Enlist most affordable and highly rated restaurants city wise.*/

select city,restaurantid, res_identify,price_range, rating
from zomato 
order by rating desc; 

/*5)Help Zomato in identifying the restaurants with poor offline services*/

select * from zomato;
select restaurantid, res_identify, city, has_online_delivery, rating
from zomato
where Has_Online_delivery = "NO"
order by rating asc;

/*6)Help zomato in identifying those cities which have atleast 3 restaurants with ratings >= 4.9
  In case there are two cities with the same result, sort them in alphabetical order.*/
  
  select city
  from zomato
  where rating >=4.9 
  group by city
  having count(city)>= 3 ;

/*7) What are the top 5 countries with most restaurants linked with Zomato?*/

select * from zomato;
select distinct(c.country), count(c.country) as Cnt from countrytable c inner join zomato z using(countrycode)
group by c.country
order by count(c.country) desc
limit 5;

/*8) What is the average cost for two across all Zomato listed restaurants?*/

select avg(average_cost_for_two) as Average_cost
from zomato;


/*9) Group the restaurants basis the average cost for two into: 
Luxurious Expensive, Very Expensive, Expensive, High, Medium High, Average. 
Then, find the number of restaurants in each category. */

select * from zomato order by Average_Cost_for_two desc;
select 
case when Average_Cost_for_two >=50000 then "Luxurious Expensive"
when Average_Cost_for_two between 15000 and 49999 then "Very Expensive"
when Average_Cost_for_two between 7000 and 14999 then "Expensive"
when Average_Cost_for_two between 2000 and 6999 then "High"
when Average_Cost_for_two between 500 and 1999 then "Medium High"
else "Average"
end as Average_Cost
from zomato
group by 
case when Average_Cost_for_two >=50000 then "Luxurious Expensive"
when Average_Cost_for_two between 15000 and 49999 then "Very Expensive"
when Average_Cost_for_two between 7000 and 14999 then "Expensive"
when Average_Cost_for_two between 2000 and 6999 then "High"
when Average_Cost_for_two between 500 and 1999 then "Medium High"
else "Average"
end 
order by Average_Cost_for_two desc;

/*10) List the two top 5 restaurants with highest rating with maximum votes. */

select * from zomato;
select Res_identify, rating, votes
from zomato 
order by votes desc;