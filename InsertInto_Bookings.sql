use little_lemon_db;

insert into Customers (CustomerID,CustomerName,CustomerNumber,Email)
	values   (1,'John Lee' ,'8181211234','J_mail1@gmail.com')
			,(2,'Sue zaki' ,'3102101234','S_mail2@gmail.com')
            ,(3,'Tony shad','8185411234','T_mail3@gmail.com')
            ,(4,'Adam gol' ,'2152584321','A_mail4@gmail.com')
            ,(5,'Sina zah' ,'5623651234','S_mail5@gmail.com');

insert into Bookings (BookingID,BookingDate,TableNumber,CustomerID)
	values   (1,'2022-10-10',5,1)
			,(2,'2022-11-12',3,3)
            ,(3,'2022-10-11',2,2)
            ,(4,'2022-10-13',2,1);

select * from Bookings