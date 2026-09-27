# Luxury Car Rental Database

**Author:** Dhiya Kassim  
**Course:** CIS 344  
**Tools:** MySQL Workbench and MySQL Server 8.0.46

## Overview

This project models a luxury car rental business. The database manages customers, vehicles, reservations, rental agreements, and payments.

## Database Design

The `luxury_car_rental` schema contains five tables:

- **CUSTOMER:** Customer contact and driver’s license information.
- **VEHICLE:** Vehicle details, unique VINs, daily rates, and service status.
- **RESERVATION:** Customer and vehicle bookings, scheduled dates, agreed rates, deposits, and status.
- **RENTAL_AGREEMENT:** Actual rental dates, odometer readings, and verification details.
- **PAYMENT:** Payments associated with reservations.

Primary keys, foreign keys, unique constraints, and 11 CHECK constraints maintain data integrity. Each reservation can have multiple payments and at most one rental agreement.

## Project Files

- `luxury_car_rental.mwb` — MySQL Workbench model.
- `LuxuryCarRental_v2.sql` — Creates the schema and five tables.
- `02_business_rules.sql` — Adds 11 CHECK constraints.
- `03_sample_data.sql` — Inserts fictional sample records.
- `04_test_queries.sql` — Demonstrates reservation details, payment totals, active rentals, and scheduled availability.
- `05_constraint_tests.sql` — Tests rejection of invalid records.
- Supporting documents — Project report, Chen ER diagram, Workbench UML diagram, and testing screenshots.

## How to Run

Use MySQL Server 8.0.46 to reproduce the tested environment.

1. Open MySQL Workbench and connect to your server.
2. Start with a fresh environment where `luxury_car_rental` does not already exist.
3. Open and execute these scripts in order:
   1. `LuxuryCarRental_v2.sql`
   2. `02_business_rules.sql`
   3. `03_sample_data.sql`
   4. `04_test_queries.sql`
4. Refresh the Schemas panel to view the database.

For each setup script, select the entire script and choose **Query → Execute All or Selection**. Run the setup and sample-data scripts once; repeated execution can produce duplicate constraint or record errors.

The CHECK constraints are added by `02_business_rules.sql`, so running only the original schema script does not install all business rules.

## Constraint Tests

Run `05_constraint_tests.sql` one transaction block at a time after loading the sample data.

These tests intentionally produce errors:

- A negative payment violates `chk_payment_amount`.
- A scheduled return before pickup violates `chk_reservation_dates`.
- A second rental agreement for reservation 1 violates the unique constraint on `ReservationID`.

Execute the corresponding `ROLLBACK` after each test, including when Workbench stops at the expected error. These errors demonstrate that the constraints are working.

## Limitations

The availability query detects scheduled conflicts, but the database does not yet automatically prevent overlapping bookings.

Vehicle service status and reservation-to-rental status consistency require separate checks. Refund processing and deposit returns are outside the project scope.

## References

- CIS 344 Project 1 assignment.
- CIS 344 Chapter 3 and Chapter 4 lecture slides.
- [Enterprise: Requirements for Renting an Exotic Car](https://www.enterprise.com/en/car-rental-faqs/us-exotic-car-rental/requirements-for-renting-an-exotic-car.html)
- [MySQL 8.0 Reference Manual](https://dev.mysql.com/doc/refman/8.0/en/)
- [MySQL Workbench Manual](https://dev.mysql.com/doc/workbench/en/)
