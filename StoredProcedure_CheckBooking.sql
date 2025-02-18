use little_lemon_db;

delimiter //

drop procedure if exists CheckBooking//

create procedure CheckBooking ( in ReservationDate date,in TableNo int )
begin
	select @cnt:=count(BookingID) from Bookings where BookingDate=ReservationDate and TableNumber=TableNo;
    select concat( 'Table ',TableNo, if( @cnt>0 , ' is already booked.' , ' is available.' ) )  as 'Booking status';
end//

delimiter ;

call CheckBooking('22-11-12',3);

-- call CheckBooking('22-11-13',2);


