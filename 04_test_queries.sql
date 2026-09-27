USE luxury_car_rental;

-- 1. Reservations with customer and vehicle details
SELECT
    r.ReservationID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer,
    CONCAT(v.Make, ' ', v.Model) AS Vehicle,
    r.ScheduledPickup,
    r.ScheduledReturn,
    r.ReservationStatus
FROM RESERVATION r
JOIN CUSTOMER c ON r.CustomerID = c.CustomerID
JOIN VEHICLE v ON r.VehicleID = v.VehicleID
ORDER BY r.ReservationID;

-- 2. Total rental payments received per reservation
SELECT
    r.ReservationID,
    r.ReservationStatus,
    COALESCE(SUM(p.Amount), 0) AS TotalPaid
FROM RESERVATION r
LEFT JOIN PAYMENT p ON r.ReservationID = p.ReservationID
GROUP BY r.ReservationID, r.ReservationStatus
ORDER BY r.ReservationID;

-- 3. Rentals that have not been returned
SELECT
    ra.RentalID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer,
    CONCAT(v.Make, ' ', v.Model) AS Vehicle,
    ra.ActualPickup,
    r.ScheduledReturn
FROM RENTAL_AGREEMENT ra
JOIN RESERVATION r ON ra.ReservationID = r.ReservationID
JOIN CUSTOMER c ON r.CustomerID = c.CustomerID
JOIN VEHICLE v ON r.VehicleID = v.VehicleID
WHERE ra.ActualReturn IS NULL;

-- 4. Scheduled availability for a requested period
SET @RequestedPickup = '2026-10-05 09:00:00';
SET @RequestedReturn = '2026-10-07 09:00:00';

SELECT v.VehicleID, v.Make, v.Model, v.CurrentDailyRate
FROM VEHICLE v
WHERE v.ServiceStatus = 'Operational'
  AND NOT EXISTS (
      SELECT 1
      FROM RESERVATION r
      WHERE r.VehicleID = v.VehicleID
        AND r.ReservationStatus IN ('Confirmed', 'Ongoing')
        AND r.ScheduledPickup < @RequestedReturn
        AND r.ScheduledReturn > @RequestedPickup
  )
ORDER BY v.VehicleID;