-- Sample Data Insertion Script for AirBnB Schema

-- Insert Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
  ('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_password_1', '555-1234', 'guest', NOW()),
  ('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_password_2', '555-5678', 'guest', NOW()),
  ('33333333-3333-3333-3333-333333333333', 'Carol', 'Williams', 'carol@example.com', 'hashed_password_3', '555-8765', 'admin', NOW());

-- Insert Properties
INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '33333333-3333-3333-3333-333333333333', 'Cozy Cabin', 'A small cozy cabin in the woods.', 'Asheville, NC', 120.00, NOW(), NOW()),
  ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 'Downtown Apartment', 'Modern apartment in the city center.', 'New York, NY', 250.00, NOW(), NOW());

-- Insert Bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
  ('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-09-01', '2025-09-05', 480.00, 'confirmed', NOW()),
  ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '22222222-2222-2222-2222-222222222222', '2025-08-15', '2025-08-20', 1250.00, 'pending', NOW());

-- Insert Reviews
INSERT INTO Reviews (review_id, booking_id, rating, review_text, review_date) VALUES
  ('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 5, 'Amazing stay, very cozy and clean.', NOW()),
  ('ccccccc2-cccc-cccc-cccc-ccccccccccc2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', NULL, NULL, NULL);  -- Pending booking, no review yet

-- Insert Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_date) VALUES
  ('ddddddd1-dddd-dddd-dddd-dddddddddddd1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 480.00, NOW()),
  ('ddddddd2-dddd-dddd-dddd-dddddddddddd2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 1250.00, NOW());

-- Insert Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
  ('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 'Hi, I am interested in your cabin for September.', NOW()),
  ('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2', '33333333-3333-3333-3333-333333333333', '11111111-1111-1111-1111-111111111111', 'Hello Alice, the cabin is available then!', NOW()),
  ('eeeeeee3-eeee-eeee-eeee-eeeeeeeeeee3', '22222222-2222-2222-2222-222222222222', '33333333-3333-3333-3333-333333333333', 'Is the downtown apartment pet-friendly?', NOW());
