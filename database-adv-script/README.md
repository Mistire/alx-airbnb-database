## README: SQL Joins Practice

### Objective

Practice writing SQL queries using different types of joins to understand how relational data can be combined from multiple tables.

---

### Tasks

#### INNER JOIN – Bookings with Users

Get all bookings along with the users who made them.

```sql
SELECT 
  Booking.booking_id,
  Booking.start_date,
  Booking.end_date,
  User.user_id,
  User.email
FROM Booking
INNER JOIN User ON Booking.user_id = User.user_id;
```

---

#### LEFT JOIN – Properties with Reviews

Get all properties and their reviews. Include properties even if they have no reviews.

```sql
SELECT 
  Property.property_id,
  Property.name,
  Property.location,
  Review.review_id,
  Review.rating
FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id;
```

---

#### FULL OUTER JOIN – All Users and All Bookings

Get all users and all bookings, even if a user has no booking or a booking is not linked to a user (simulated using `UNION` in MySQL).

```sql
SELECT 
  User.user_id,
  User.email,
  Booking.booking_id,
  Booking.start_date,
  Booking.end_date
FROM User
LEFT JOIN Booking ON User.user_id = Booking.user_id

UNION

SELECT 
  Booking.user_id,
  NULL AS email,
  Booking.booking_id,
  Booking.start_date,
  Booking.end_date
FROM Booking
LEFT JOIN User ON User.user_id = Booking.user_id
WHERE User.user_id IS NULL;
```
