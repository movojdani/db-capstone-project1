
-- In the task, there are two parameters for the stored procedure, and it is required that the INSERT statement adds
-- a new booking record using the input parameter values. However, CustomerID is missing, and without it,
-- the INSERT statement will raise an error.

use little_lemon_db;

delimiter //

drop procedure if exists AddValidBooking//

create procedure AddValidBooking ( in ReservationDate date,in TableNo int , in Customer_id int )
begin
	start transaction;
		insert into Bookings (BookingDate,TableNumber,CustomerID)
			values (ReservationDate,TableNo,Customer_id); 
            
	select @cnt:=count(BookingID) from Bookings where BookingDate=ReservationDate and TableNumber=TableNo;
    if @cnt>1 then
		select concat( 'Table ',TableNo, ' is already booked. Booking canceled' ) as 'Booking status';
        rollback;
    else
		select concat( 'Table ',TableNo, ' is available.'  ) as 'Booking status';
        commit;
    end if;
end//

delimiter ;

call AddValidBooking('22-11-12',3,1);

-- call AddValidBooking('22-11-13',2,5);
