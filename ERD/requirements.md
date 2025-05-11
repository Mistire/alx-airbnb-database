# Users Table
Table User {
  user_id UUID [pk, unique, note: 'Primary Key']
  first_name VARCHAR [not null]
  last_name VARCHAR [not null]
  email VARCHAR [not null, unique, note: 'Indexed']
  password_hash VARCHAR [not null]
  phone_number VARCHAR
  role ENUM('guest', 'host', 'admin') [not null]
  created_at TIMESTAMP [default: 'now()']
}

# Properties Table
Table Property {
  property_id UUID [pk, unique, note: 'Primary Key']
  host_id UUID [not null, ref: > User.user_id]
  name VARCHAR [not null]
  description TEXT [not null]
  location VARCHAR [not null]
  pricepernight DECIMAL [not null]
  created_at TIMESTAMP [default: 'now()']
  updated_at TIMESTAMP
}

// Bookings Table
Table Booking {
  booking_id UUID [pk, unique, note: 'Primary Key']
  property_id UUID [not null, ref: > Property.property_id]
  user_id UUID [not null, ref: > User.user_id]
  start_date DATE [not null]
  end_date DATE [not null]
  total_price DECIMAL [not null]
  status ENUM('pending', 'confirmed', 'canceled') [not null]
  created_at TIMESTAMP [default: 'now()']
}

# Payments Table
Table Payment {
  payment_id UUID [pk, unique, note: 'Primary Key']
  booking_id UUID [not null, ref: > Booking.booking_id]
  amount DECIMAL [not null]
  payment_date TIMESTAMP [default: 'now()']
  payment_method ENUM('credit_card', 'paypal', 'stripe') [not null]
}

# Reviews Table
Table Review {
  review_id UUID [pk, unique, note: 'Primary Key']
  property_id UUID [not null, ref: > Property.property_id]
  user_id UUID [not null, ref: > User.user_id]
  rating INTEGER [not null, note: 'Must be between 1 and 5']
  comment TEXT [not null]
  created_at TIMESTAMP [default: 'now()']
}

# Messages Table
Table Message {
  message_id UUID [pk, unique, note: 'Primary Key']
  sender_id UUID [not null, ref: > User.user_id]
  recipient_id UUID [not null, ref: > User.user_id]
  message_body TEXT [not null]
  sent_at TIMESTAMP [default: 'now()']
}
