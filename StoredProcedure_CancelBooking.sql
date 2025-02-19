DELIMITER $$
CREATE DEFINER=`little_lemon`@`%` PROCEDURE `CancelBooking`(in Booking_id int )
begin
            
	select @cnt:=count(BookingID) from Bookings where BookingID=Booking_id;
    if @cnt>0 then
		delete from Bookings  where BookingID=Booking_id;
		select concat( 'Booking ',Booking_id, ' canceled' ) as Confirmation;
    else
		select concat( 'There isn''t Booking ',Booking_id, ' in Bookings table.' ) as Confirmation;
    end if;
end$$
DELIMITER ;
