# Periodic Table Database

This directory contains the solution for the task "Periodic Table Database" as part of the freeCodeCamp Relational Database Certification.

## Description

The `periodic_table.sql` file is a backup of a relational database designed to store information about chemical elements, their properties, and types. The database schema includes the following tables:

1. **elements**: Stores information about chemical elements.
   - Columns:
     - `atomic_number`: Primary key, integer, not null.
     - `symbol`: Symbol of the element, unique and not null.
     - `name`: Name of the element, unique and not null.

2. **properties**: Stores information about the properties of elements.
   - Columns:
     - `atomic_number`: Foreign key referencing the `atomic_number` column from the `elements` table, not null.
     - `atomic_mass`: Atomic mass of the element, not null.
     - `melting_point_celsius`: Melting point of the element in Celsius, not null.
     - `boiling_point_celsius`: Boiling point of the element in Celsius, not null.
     - `type_id`: Foreign key referencing the `type_id` column from the `types` table, not null.

3. **types**: Stores information about the types of elements.
   - Columns:
     - `type_id`: Primary key, integer, not null.
     - `type`: Type of the element, not null.

## How to Use

1. **Restoring the Database**:
   - To restore the database from the `periodic_table.sql` file, use the following command in your PostgreSQL environment:
     ```sh
     psql -U your_username -d your_database -f periodic_table.sql
     ```

2. **Exploring the Database**:
   - Once the database is restored, you can explore the tables and data using SQL queries. For example:
     ```sql
     SELECT * FROM elements;
     ```

3. **Using the `element.sh` Script**:
   - Run the `element.sh` script to interact with the periodic table database. This script allows users to retrieve information about elements by their atomic number, symbol, or name.
   - To use the script, provide an argument in the form of an atomic number, symbol, or name of an element. For example:
     ```sh
     ./element.sh 1
     ./element.sh H
     ./element.sh Hydrogen
     ```

Feel free to explore the database schema and data, and use it as a foundation for further learning and projects related to relational databases.

## Acknowledgements

- [freeCodeCamp](https://www.freecodecamp.org/) - For providing an amazing platform to learn and practice coding skills.
- The open-source community for creating and maintaining the tools and libraries used in these projects.
