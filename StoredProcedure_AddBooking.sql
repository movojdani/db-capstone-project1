
use little_lemon_db;

delimiter //

drop procedure if exists AddBooking//

create procedure AddBooking (in Booking_id int , in Customer_id int,in TableNo int, in ReservationDate date )
begin
	start transaction;
		insert into Bookings (BookingID,BookingDate,TableNumber,CustomerID)
			values (Booking_id,ReservationDate,TableNo,Customer_id); 
            
	select @cnt:=count(BookingID) from Bookings where BookingDate=ReservationDate and TableNumber=TableNo;
    if @cnt>1 then
		select concat( 'Table ',TableNo, ' is already booked. Booking canceled' );
        rollback;
    else
		select concat( 'Table ',TableNo, ' is available. New booking added.'  ) as Confirmation;
        commit;
    end if;
end//

delimiter ;

delete from Bookings where BookingID=9;
call AddBooking(9,3,4,'22-12-30');

