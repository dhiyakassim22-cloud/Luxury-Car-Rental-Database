USE luxury_car_rental;

ALTER TABLE VEHICLE
  ADD CONSTRAINT chk_vehicle_rate
    CHECK (CurrentDailyRate > 0),
  ADD CONSTRAINT chk_vehicle_status
    CHECK (ServiceStatus IN ('Operational', 'OutOfService'));

ALTER TABLE RESERVATION
  ADD CONSTRAINT chk_reservation_dates
    CHECK (ScheduledReturn > ScheduledPickup),
  ADD CONSTRAINT chk_reservation_rate
    CHECK (AgreedDailyRate > 0),
  ADD CONSTRAINT chk_reservation_deposit
    CHECK (RequiredDepositAmount >= 0),
  ADD CONSTRAINT chk_reservation_status
    CHECK (ReservationStatus IN
      ('Confirmed', 'Canceled', 'Ongoing', 'Completed'));

ALTER TABLE RENTAL_AGREEMENT
  ADD CONSTRAINT chk_rental_dates
    CHECK (ActualReturn IS NULL
           OR ActualReturn >= ActualPickup),
  ADD CONSTRAINT chk_odometer_out
    CHECK (OdometerOut >= 0),
  ADD CONSTRAINT chk_odometer_in
    CHECK (OdometerIn IS NULL
           OR OdometerIn >= OdometerOut),
  ADD CONSTRAINT chk_rental_verified
    CHECK (LicenseVerified = 1 AND InsuranceVerified = 1);

ALTER TABLE PAYMENT
  ADD CONSTRAINT chk_payment_amount
    CHECK (Amount > 0);

SELECT TABLE_NAME, CONSTRAINT_NAME, ENFORCED
FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'luxury_car_rental'
  AND CONSTRAINT_TYPE = 'CHECK'
ORDER BY TABLE_NAME, CONSTRAINT_NAME;