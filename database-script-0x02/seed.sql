-- Insert sample users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('uuid-guest-001', 'Alice', 'Wonderland', 'alice@example.com', 'hashed_pw1', '251900000001', 'guest'),
('uuid-host-001', 'Bob', 'Builder', 'bob@example.com', 'hashed_pw2', '251900000002', 'host'),
('uuid-admin-001', 'Clara', 'Oswald', 'clara@example.com', 'hashed_pw3', '251900000003', 'admin');

-- Insert sample properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES 
('prop-001', 'uuid-host-001', 'Sunny Apartment', 'A bright and spacious apartment in the city center.', 'Addis Ababa', 75.00),
('prop-002', 'uuid-host-001', 'Cozy Cottage', 'Quiet and cozy cottage for a weekend getaway.', 'Bahir Dar', 50.00);

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
('book-001', 'prop-001', 'uuid-guest-001', '2025-06-01', '2025-06-05', 300.00, 'confirmed'),
('book-002', 'prop-002', 'uuid-guest-001', '2025-07-10', '2025-07-12', 100.00, 'pending');

-- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES 
('pay-001', 'book-001', 300.00, 'credit_card'),
('pay-002', 'book-002', 100.00, 'paypal');

-- Insert sample reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES 
('rev-001', 'prop-001', 'uuid-guest-001', 5, 'Amazing place! Very clean and central.'),
('rev-002', 'prop-002', 'uuid-guest-001', 4, 'Nice cottage but a bit far from town.');

-- Insert sample messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES 
('msg-001', 'uuid-guest-001', 'uuid-host-001', 'Hi, is the Sunny Apartment available for next weekend?'),
('msg-002', 'uuid-host-001', 'uuid-guest-001', 'Yes, it is available. Let me know if you have any questions.');
