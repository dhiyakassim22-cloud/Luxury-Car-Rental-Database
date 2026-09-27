USE luxury_car_rental;

-- Fictional customers
INSERT INTO CUSTOMER
(CustomerID, FirstName, LastName, Email, Phone,
 LicenseNumber, LicenseIssuer, LicenseExpirationDate)
VALUES
(1, 'Maya', 'Reed', 'maya@example.com', '212-555-0101',
 'DEMO001', 'New York', '2029-06-30'),
(2, 'Daniel', 'Brooks', 'daniel@example.com', '212-555-0102',
 'DEMO002', 'New York', '2028-11-15'),
(3, 'Sofia', 'Chen', 'sofia@example.com', '212-555-0103',
 'DEMO003', 'New Jersey', '2030-03-20');

-- Fictional vehicle identifiers and sample daily rates
INSERT INTO VEHICLE
(VehicleID, VIN, Make, Model, ModelYear,
 CurrentDailyRate, ServiceStatus)
VALUES
(1, 'DEMO0000000000001', 'Porsche', '911', 2025,
 450.00, 'Operational'),
(2, 'DEMO0000000000002', 'Mercedes-Benz', 'S-Class', 2025,
 350.00, 'Operational'),
(3, 'DEMO0000000000003', 'BMW', 'M8', 2024,
 400.00, 'Operational'),
(4, 'DEMO0000000000004', 'Bentley', 'Continental GT', 2025,
 650.00, 'OutOfService');

SELECT * FROM CUSTOMER;
SELECT * FROM VEHICLE;

USE luxury_car_rental;

INSERT INTO RESERVATION
(ReservationID, CustomerID, VehicleID,
 ScheduledPickup, ScheduledReturn,
 AgreedDailyRate, RequiredDepositAmount, ReservationStatus)
VALUES
(1, 1, 1, '2026-09-20 10:00:00', '2026-09-22 10:00:00',
 450.00, 1000.00, 'Completed'),
(2, 2, 2, '2026-09-26 10:00:00', '2026-09-28 10:00:00',
 350.00, 800.00, 'Ongoing'),
(3, 1, 3, '2026-10-05 09:00:00', '2026-10-07 09:00:00',
 400.00, 1000.00, 'Confirmed'),
(4, 3, 1, '2026-10-10 12:00:00', '2026-10-12 12:00:00',
 450.00, 1000.00, 'Canceled');

INSERT INTO RENTAL_AGREEMENT
(RentalID, ReservationID, ActualPickup, ActualReturn,
 OdometerOut, OdometerIn, LicenseVerified, InsuranceVerified)
VALUES
(1, 1, '2026-09-20 10:00:00', '2026-09-22 09:30:00',
 12000, 12320, 1, 1),
(2, 2, '2026-09-26 10:00:00', NULL,
 8500, NULL, 1, 1);

INSERT INTO PAYMENT
(PaymentID, ReservationID, PaymentDateTime, Amount, PaymentMethod)
VALUES
(1, 1, '2026-09-18 14:00:00', 450.00, 'CreditCard'),
(2, 1, '2026-09-20 10:00:00', 450.00, 'CreditCard'),
(3, 2, '2026-09-26 10:00:00', 700.00, 'CreditCard'),
(4, 3, '2026-09-26 15:00:00', 200.00, 'CreditCard');

SELECT 'CUSTOMER' AS TableName, COUNT(*) AS RowCount FROM CUSTOMER
UNION ALL
SELECT 'VEHICLE', COUNT(*) FROM VEHICLE
UNION ALL
SELECT 'RESERVATION', COUNT(*) FROM RESERVATION
UNION ALL
SELECT 'RENTAL_AGREEMENT', COUNT(*) FROM RENTAL_AGREEMENT
UNION ALL
SELECT 'PAYMENT', COUNT(*) FROM PAYMENT;