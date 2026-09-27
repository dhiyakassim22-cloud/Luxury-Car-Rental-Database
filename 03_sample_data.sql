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