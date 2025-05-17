-- Step 1: Drop the original Booking table (if exists)
DROP TABLE IF EXISTS Booking CASCADE;

-- Step 2: Create partitioned Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions by year
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Re-add foreign keys on each partition (PostgreSQL doesn't inherit FKs automatically)
ALTER TABLE Booking_2023
    ADD CONSTRAINT fk_booking_2023_property FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE;
ALTER TABLE Booking_2023
    ADD CONSTRAINT fk_booking_2023_user FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE;

ALTER TABLE Booking_2024
    ADD CONSTRAINT fk_booking_2024_property FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE;
ALTER TABLE Booking_2024
    ADD CONSTRAINT fk_booking_2024_user FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE;

ALTER TABLE Booking_2025
    ADD CONSTRAINT fk_booking_2025_property FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE;
ALTER TABLE Booking_2025
    ADD CONSTRAINT fk_booking_2025_user FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE;

-- Step 5: Create indexes on partitions if needed (optional)
CREATE INDEX idx_booking_2023_property ON Booking_2023(property_id);
CREATE INDEX idx_booking_2023_user ON Booking_2023(user_id);

CREATE INDEX idx_booking_2024_property ON Booking_2024(property_id);
CREATE INDEX idx_booking_2024_user ON Booking_2024(user_id);

CREATE INDEX idx_booking_2025_property ON Booking_2025(property_id);
CREATE INDEX idx_booking_2025_user ON Booking_2025(user_id);

-- Step 6: Example Insert (should go to the correct partition automatically)
INSERT INTO Booking (
    booking_id,
    property_id,
    user_id,
    start_date,
    end_date,
    total_price,
    status
) VALUES (
    gen_random_uuid(),
    (SELECT property_id FROM Property LIMIT 1),
    (SELECT user_id FROM "User" LIMIT 1),
    '2024-07-15',
    '2024-07-20',
    1250.00,
    'confirmed'
);

-- Step 7: Test query with EXPLAIN ANALYZE to see partition pruning
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
