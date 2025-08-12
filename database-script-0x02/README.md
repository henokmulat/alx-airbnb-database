# AirBnB Database Sample Data

This file contains SQL `INSERT` statements to populate the AirBnB-style database schema with **realistic sample data** for development and testing purposes.  
It complements the schema defined in `schema.sql`.

---

## Overview of Inserted Data

### 1. Users

- Three sample users:
  - **Alice Johnson** – Guest
  - **Bob Smith** – Guest
  - **Carol Williams** – Admin (also a property host)

### 2. Properties

- **Cozy Cabin** – Hosted by Carol, located in Asheville, NC.
- **Downtown Apartment** – Hosted by Carol, located in New York, NY.

### 3. Bookings

- Booking for the **Cozy Cabin** by Alice (confirmed).
- Booking for the **Downtown Apartment** by Bob (pending).

### 4. Reviews

- One completed review (5-star rating for the Cozy Cabin).
- One pending review (for the Downtown Apartment booking).

### 5. Payments

- Payment records for both bookings.

### 6. Messages

- Example messages between guests and host demonstrating inquiry and response.

---

## Usage Instructions

1. Ensure the **schema tables** from `schema.sql` are created in your PostgreSQL database.
2. Run the sample data script:

   ```bash
   psql -U <username> -d <database_name> -f sample_data.sql
   ```
