# World Cup Database Project

This directory contains the solution for the task "World Cup Database Project" as part of the freeCodeCamp Relational Database Certification.

## Description

The `worldcup.sql` file is a backup of a relational database designed to store information about World Cup games and teams. The database schema includes the following tables:

1. **games**: Stores information about different games.
   - Columns:
     - `game_id`: Primary key, auto-incrementing.
     - `year`: Year of the game, not null.
     - `round`: Round of the game, not null.
     - `winner_id`: Foreign key referencing the `teams` table, not null.
     - `opponent_id`: Foreign key referencing the `teams` table, not null.
     - `winner_goals`: Goals scored by the winning team, not null.
     - `opponent_goals`: Goals scored by the opponent team, not null.

2. **teams**: Stores information about teams.
   - Columns:
     - `team_id`: Primary key, auto-incrementing.
     - `name`: Name of the team, unique and not null.

## How to Use

1. **Restoring the Database**:
   - To restore the database from the `worldcup.sql` file, use the following command in your PostgreSQL environment:
     ```sh
     psql -U your_username -d your_database -f worldcup.sql
     ```

2. **Exploring the Database**:
   - Once the database is restored, you can explore the tables and data using SQL queries. For example:
     ```sql
     SELECT * FROM games;
     ```
3. **Inserting Data to the Database**:
   - Run the `insert_data.sh` script to populate the database with data from `games.csv`. This script reads the CSV file and inserts the data into the `games` and `teams` tables.

4. **Query the Database**:
   - Execute the `queries.sh` script to run predefined queries and produce the desired outputs. This script contains SQL queries to extract specific information from the database.

Feel free to explore the database schema and data, and use it as a foundation for further learning and projects related to relational databases.

## Acknowledgements

- [freeCodeCamp](https://www.freecodecamp.org/) - For providing an amazing platform to learn and practice coding skills.
- The open-source community for creating and maintaining the tools and libraries used in these projects.