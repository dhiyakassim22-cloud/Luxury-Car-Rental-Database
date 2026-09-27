USE luxury_car_rental;

START TRANSACTION;

INSERT INTO PAYMENT
(ReservationID, PaymentDateTime, Amount, PaymentMethod)
VALUES
(1, '2026-09-26 16:00:00', -50.00, 'CreditCard');
ROLLBACK;
START TRANSACTION;

INSERT INTO RESERVATION
(CustomerID, VehicleID, ScheduledPickup, ScheduledReturn,
 AgreedDailyRate, RequiredDepositAmount, ReservationStatus)
VALUES
(1, 1, '2026-11-10 10:00:00', '2026-11-09 10:00:00',
 450.00, 1000.00, 'Confirmed');
 ROLLBACK;
 START TRANSACTION;

INSERT INTO RENTAL_AGREEMENT
(ReservationID, ActualPickup, OdometerOut,
 LicenseVerified, InsuranceVerified)
VALUES
(1, '2026-09-20 10:00:00', 12000, 1, 1);
ROLLBACK;