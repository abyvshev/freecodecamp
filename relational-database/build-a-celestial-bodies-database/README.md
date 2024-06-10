# Build a Celestial Bodies Database

This directory contains the solution for the task "Build a Celestial Bodies Database" as part of the freeCodeCamp relational database certification.

## Description

The `universe.sql` file is a backup of a relational database designed to store information about galaxies, stars, planets, and moons. The database schema includes the following tables:

1. **galaxy**: Stores information about different galaxies.
   - Columns:
     - `galaxy_id`: Primary key, auto-incrementing.
     - `name`: Name of the galaxy, unique and not null.
     - `description`: Description of the galaxy.
     - `distance_from_earth`: Distance from Earth in light years, numeric type and not null.
     - `has_life`: Boolean indicating if the galaxy has life.
     - `galaxy_type_id`: Foreign key referencing the `galaxy_type` table.

2. **galaxy_type**: Stores information about types of galaxies.
   - Columns:
     - `galaxy_type_id`: Primary key, auto-incrementing.
     - `name`: Name of the galaxy type, unique and not null.
     - `description`: Description of the galaxy type.

3. **star**: Stores information about stars within galaxies.
   - Columns:
     - `star_id`: Primary key, auto-incrementing.
     - `name`: Name of the star, unique and not null.
     - `galaxy_id`: Foreign key referencing the `galaxy` table.
     - `star_type`: Type of the star.
     - `luminosity`: Luminosity of the star, numeric type and not null.
     - `has_planets`: Boolean indicating if the star has planets.

4. **planet**: Stores information about planets orbiting stars.
   - Columns:
     - `planet_id`: Primary key, auto-incrementing.
     - `name`: Name of the planet, unique and not null.
     - `star_id`: Foreign key referencing the `star` table.
     - `diameter_km`: Diameter of the planet in kilometers, integer and not null.
     - `has_life`: Boolean indicating if the planet has life.
     - `distance_from_star`: Distance from the star in astronomical units, numeric type.

5. **moon**: Stores information about moons orbiting planets.
   - Columns:
     - `moon_id`: Primary key, auto-incrementing.
     - `name`: Name of the moon, unique and not null.
     - `planet_id`: Foreign key referencing the `planet` table.
     - `diameter_km`: Diameter of the moon in kilometers, integer and not null.
     - `has_life`: Boolean indicating if the moon has life.
     - `orbital_period`: Orbital period in days, numeric type.

6. **comet**: Stores information about comets.
   - Columns:
     - `comet_id`: Primary key, auto-incrementing.
     - `name`: Name of the comet, unique and not null.
     - `galaxy_id`: Foreign key referencing the `galaxy` table.
     - `composition`: Composition of the comet.
     - `diameter_km`: Diameter of the comet in kilometers, integer and not null.
     - `orbital_period`: Orbital period in years, numeric type.
     - `is_active`: Boolean indicating if the comet is active.

## How to Use

1. **Restoring the Database**:
   - To restore the database from the `universe.sql` file, use the following command in your PostgreSQL environment:
     ```sh
     psql -U your_username -d your_database -f universe.sql
     ```

2. **Exploring the Database**:
   - Once the database is restored, you can explore the tables and data using SQL queries. For example:
     ```sql
     SELECT * FROM galaxy;
     ```

Feel free to explore the database schema and data, and use it as a foundation for further learning and projects related to relational databases.

## Acknowledgements

- [freeCodeCamp](https://www.freecodecamp.org/) - For providing an amazing platform to learn and practice coding skills.
- The open-source community for creating and maintaining the tools and libraries used in these projects.
