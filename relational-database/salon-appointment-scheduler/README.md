# Salon Appointment Scheduler

This directory contains the solution for the task "Salon Appointment Scheduler" as part of the freeCodeCamp Relational Database Certification.

## Description

The `salon.sql` file is a backup of a relational database designed to store information about salon services, customers, and their appointments. The database schema includes the following tables:

1. **customers**: Stores information about customers.
   - Columns:
     - `customer_id`: Primary key, auto-incrementing.
     - `name`: Name of the customer, not null.
     - `phone`: Phone number of the customer, unique and not null.

2. **services**: Stores information about different services.
   - Columns:
     - `service_id`: Primary key, auto-incrementing.
     - `name`: Name of the service, unique and not null.

3. **appointments**: Stores information about appointments.
   - Columns:
     - `appointment_id`: Primary key, auto-incrementing.
     - `customer_id`: Foreign key referencing the `customer_id` column from the `customers` table, not null.
     - `service_id`: Foreign key referencing the `service_id` column from the `services` table, not null.
     - `time`: Time of the appointment, not null.

## How to Use

1. **Restoring the Database**:
   - To restore the database from the `salon.sql` file, use the following command in your PostgreSQL environment:
     ```sh
     psql -U your_username -d your_database -f salon.sql
     ```

2. **Exploring the Database**:
   - Once the database is restored, you can explore the tables and data using SQL queries. For example:
     ```sql
     SELECT * FROM services;
     ```
3. **Booking an Appointment**:
   - Run the `salon.sh` script to interact with the salon appointment scheduler. This script allows users to view services, book appointments, and manage customer information.

Feel free to explore the database schema and data, and use it as a foundation for further learning and projects related to relational databases.

## Acknowledgements

- [freeCodeCamp](https://www.freecodecamp.org/) - For providing an amazing platform to learn and practice coding skills.
- The open-source community for creating and maintaining the tools and libraries used in these projects.