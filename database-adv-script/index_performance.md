# Index Performance Report – Airbnb Clone

## Introduction

This report summarizes the performance impact of adding indexes to the most frequently queried columns in the Airbnb Clone database. Indexes were added to columns commonly used in JOINs, WHERE, and ORDER BY clauses.

---

## Indexed Columns and Reasoning

| Table     | Column        | Reason for Indexing                          |
|-----------|---------------|----------------------------------------------|
| Booking   | user_id       | Used in JOINs and WHERE clauses              |
| Booking   | property_id   | Used in JOINs with Property table            |
| Review    | property_id   | Used in JOINs with Property table            |
| Property  | location      | Frequently filtered during searches          |
| Booking   | created_at    | Often sorted or filtered by booking date     |

