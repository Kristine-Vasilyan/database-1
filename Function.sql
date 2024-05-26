create Function Cus_Trip_Price(@ID int )
returns table 
as 
return
select Customer.Cus_ID,Cus_Name,Passport.Pass_Number,Dep_day,Trip.Country,Trip.Visa_type,
(Day_price*Day_count + Transport_price + Visa.Price) as Trip_Price,
(Day_price*Day_count + Transport_price + Visa.Price)*1.18 as Trip_Price_as_Tax
from Customer join Passport on Customer.Cus_ID = @ID and Customer.Cus_ID = Passport.Cus_ID
join Trip on Passport.Pass_Number = Trip.Pass_ID 
join Visa on Trip.Country = Visa.Country and Trip.Visa_type = Visa.Visa_type

select *
from dbo.Cus_Trip_Price(3)
select *
from dbo.Cus_Trip_Price(1)
select *
from dbo.Cus_Trip_Price(2)
select *
from dbo.Cus_Trip_Price(4)


