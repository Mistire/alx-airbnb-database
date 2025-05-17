# Query Optimization Report

## Initial Query

- Joined Booking, User, Property, and Payment tables.
- Retrieved all columns without filters.
- EXPLAIN QUERY PLAN showed full table scans and missing index usage.

## Actions Taken

- Created indexes on foreign key columns used in JOINs.
- Reduced columns selected to only needed fields.
- Added WHERE clause to filter for confirmed bookings.

## Results

- Query execution plan improved: index scans used instead of full scans.
- Execution time reduced by approximately XX% (replace with actual measurement if available).
- Overall performance optimized for typical use cases.
