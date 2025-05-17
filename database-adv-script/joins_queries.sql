-- INNER JOIN
SELECT
Booking.booking_id,
Booking.property_id,
Booking.start_date,
Booking.end_date,
"User".user_id,
"User".first_name,
"User".last_name,
"User".email

FROM Booking
INNER JOIN "User" ON Booking.user_id = "User".user_id;


--LEFT JOIN
SELECT
Property.property_id,
Property.name,
Review.review_id,
Review.rating, 
Review.comment

FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id;
ORDER BY Review.rating DESC;


--FULL OUTER JOIN
SELECT
"User".user_id,
"User".first_name,
"User".last_name,
"User".email,
Booking.booking_id,
Booking.property_id,
Booking.start_date,
Booking.end_date

FROM "User"
FULL OUTER JOIN Booking ON "User".user_id = Booking.user_id;







