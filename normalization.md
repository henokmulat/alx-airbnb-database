# Database Normalization Explanation for AirBnB Schema

## Step 1: Understand the Schema Entities and Attributes

### User

- Attributes: `user_id` (PK), `first_name`, `last_name`, `email` (Unique), `password_hash`, `phone_number`, `role` (ENUM: guest, admin), `created_at`
- Comments: Well-structured; no repeating groups or partial dependencies. Unique email enforces data integrity.

### Property

- Attributes: `property_id` (PK), `host_id` (FK -> User.user_id), `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`
- Comments: Attributes relate directly to the property. Host reference is appropriate with no redundancy.

### Booking

- Attributes: `review_id` (PK), `property_id` (PK), `user_id` (FK -> User.user_id), `start_date`, `end_date`, `total_price`, `status` (ENUM), `created_at`
- Comments:
  - The composite primary key (`review_id`, `property_id`) is problematic.
  - `review_id` is unrelated and belongs to the Review entity, not Booking.
  - Bookings require a unique identifier, typically `booking_id`.
  - Foreign key `user_id` correctly references User.

### Review

- Attributes: `payment_id` (PK), `booking_id` (FK), other review details
- Comments:
  - Using `payment_id` as PK is unusual and creates an incorrect dependency.
  - Reviews should have their own unique `review_id` primary key.
  - Reviews relate to bookings, not payments, so FK should be `booking_id`.

### Payment

- Attributes: `payment_id` (PK), `booking_id` (PK), amount, payment_date, unclear or misplaced attributes like `message_body`
- Comments:
  - Composite PK of (`payment_id`, `booking_id`) is redundant if `payment_id` is unique.
  - `message_body` field seems misplaced and irrelevant to Payment entity.

### Message

- Attributes: `message_id` (PK), `sender_id`, `recipient_id`, `message_body`, `sent_at`
- Comments: Well-structured with clear PK and relevant fields.

---

## Step 2: Identify Normalization Issues

| Issue                       | Explanation                                                          |
| --------------------------- | -------------------------------------------------------------------- |
| Booking PK                  | Composite PK with `review_id` is incorrect and confusing             |
| Review PK and FK            | Using `payment_id` as PK and linking review to payment is wrong      |
| Payment PK and Attributes   | Composite PK redundant; contains unclear or misplaced fields         |
| Review-Booking Relationship | Review should link to Booking via `booking_id`                       |
| Attribute Typos/Incomplete  | Fields like `payment_c...` and `message_body` in Payment are unclear |

---

## Step 3: Normalization Steps and Adjustments

| Step                  | Solution                                                       |
| --------------------- | -------------------------------------------------------------- |
| Booking PK            | Introduce `booking_id` as unique PK instead of `review_id`     |
| Review Table          | Add `review_id` as PK; link Review to Booking via `booking_id` |
| Payment Table         | Use unique `payment_id` as PK; remove unrelated fields         |
| Review-Booking Link   | Ensure Review FK is `booking_id`, not `payment_id`             |
| Attribute Corrections | Fix typos and clarify incomplete attribute names               |

---

## Step 4: Updated Schema (Summary)

### User (unchanged)

- `user_id` (PK), `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`

### Property (unchanged)

- `property_id` (PK), `host_id` (FK), `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`

### Booking (updated)

- `booking_id` (PK, UUID)
- `property_id` (FK)
- `user_id` (FK)
- `start_date`
- `end_date`
- `total_price`
- `status`
- `created_at`

### Review (updated)

- `review_id` (PK, UUID)
- `booking_id` (FK)
- `rating` or `review_text`
- `review_date`

### Payment (updated)

- `payment_id` (PK, UUID)
- `booking_id` (FK)
- `amount`
- `payment_date`

### Message (unchanged)

- `message_id` (PK)
- `sender_id`
- `recipient_id`
- `message_body`
- `sent_at`

---

## Summary of 3NF Compliance

- Each table has a single, well-defined primary key; composite keys mixing unrelated entities are removed.
- All attributes are fully functionally dependent on the primary key (no partial dependencies).
- No transitive dependencies: e.g., review details depend only on `review_id`, not through another foreign key.
- Redundancies and ambiguous attributes removed (e.g., in Payment and Booking).
- Foreign key relationships are clear and correctly represent real-world dependencies, maintaining referential integrity.

---

_This normalization ensures a clean, efficient, and logically consistent database schema ready for reliable operations and easy maintenance._
