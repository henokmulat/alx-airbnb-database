# AirBnB Database Schema

This repository contains the SQL `CREATE TABLE` statements for a normalized AirBnB-style database schema. The schema is designed following the principles of Third Normal Form (3NF) to ensure data integrity, eliminate redundancy, and improve maintainability.

---

## Overview of Entities

- **Users**: Stores user information including guests and admins.
- **Properties**: Contains data about rental properties listed by hosts.
- **Bookings**: Records reservations made by users for properties.
- **Reviews**: Stores reviews linked to bookings.
- **Payments**: Records payments related to bookings.
- **Messages**: Handles communication between users.

---

## Schema Design Highlights

- **Primary Keys**: Each table has a unique `UUID` primary key generated automatically.
- **Foreign Keys**: Proper referential integrity is enforced with foreign key constraints.
- **Data Types**: Appropriate SQL data types such as `UUID`, `VARCHAR`, `NUMERIC`, `TIMESTAMP`, and `TEXT` are used.
- **Constraints**:
  - Enum-like constraints with `CHECK` enforce valid values for roles, statuses, and ratings.
  - Date constraints ensure booking dates are logical (start date before end date).
  - Amount and price fields have non-negative checks.
- **Indexes**: Created on foreign keys and commonly queried columns to optimize query performance.
- **Cascading Deletes**: Foreign keys use `ON DELETE CASCADE` to maintain data consistency when parent records are deleted.

---

## Usage

1. Ensure you are using a PostgreSQL database with the `pgcrypto` extension enabled for UUID generation:

   ```sql
   CREATE EXTENSION IF NOT EXISTS "pgcrypto";
   ```
