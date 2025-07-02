-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT
  u.user_id,
  u.email,
  COUNT(b.booking_id) as total_bookings
FROM User u JOIN Booking b ON  u.user_id = b.user_id
GROUP BY u.user_id, u.email
