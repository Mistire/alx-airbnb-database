--Aggregation Query: COUNT + GROUP BY
SELECT
u.user_id,
u.first_name,
u.last_name,
COUNT(b.booking_id) as total_bookings

FROM "User" u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name

--Window Function Query: Rank Properties by Number of Bookings
WITH property_bookings as (
  SELECT
  p.property_id,
  p.name,
  COUNT(b.booking_id) as booking_count
  FROM Property p
  LEFT JOIN Booking b ON p.property_id = b.property_id
  GROUP BY p.property_id, p.name
)

SELECT
property_id,
name,
booking_count,
ROW_NUMBER() OVER(ORDER BY booking_count DESC) as row_num,
RANK() OVER(ORDER BY booking_count DESC) as rank
FROM property_bookings
ORDER BY booking_count;
