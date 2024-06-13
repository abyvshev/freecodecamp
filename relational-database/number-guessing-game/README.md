# Number Guessing Game

This directory contains the solution for the task "Number Guessing Game" as part of the freeCodeCamp Relational Database Certification.

## Description

The `number_guess.sql` file is a backup of a relational database designed to store information about users and their guessing game attempts. The database schema includes the following tables:

1. **users**: Stores information about users.
   - Columns:
     - `user_id`: Primary key, SERIAL, not null.
     - `name`: Username, VARCHAR(22), unique and not null.

2. **games**: Stores information about guessing game attempts.
   - Columns:
     - `game_id`: Primary key, SERIAL, not null.
     - `number_of_tries`: Number of tries taken to guess the number, INT, not null.
     - `user_id`: Foreign key referencing the `user_id` column from the `users` table, INT, not null.

## How to Use

1. **Restoring the Database**:
   - To restore the database from the `number_guess.sql` file, use the following command in your PostgreSQL environment:
     ```sh
     psql -U your_username -d your_database -f number_guess.sql
     ```

2. **Exploring the Database**:
   - Once the database is restored, you can explore the tables and data using SQL queries. For example:
     ```sql
     SELECT * FROM users;
     ```

3. **Using the `number_guess.sh` Script**:
   - Run the `number_guess.sh` script to play the number guessing game. This script allows users to guess a randomly generated number between 1 and 1000.
   - To use the script, run it from the terminal:
     ```sh
     ./number_guess.sh
     ```
   - The script will prompt you to enter a username. If the username exists in the database, it will display the user's game history. If the username does not exist, it will welcome the user as a first-time player.
   - You will then be prompted to guess the secret number. The script will give hints whether the guess is higher or lower than the secret number. If the guess is not an integer, it will prompt you to enter a valid number.
   - When the correct number is guessed, the script will display the number of attempts and save the game data to the database.

Feel free to explore the database schema and data, and use it as a foundation for further learning and projects related to relational databases.

## Acknowledgements

- [freeCodeCamp](https://www.freecodecamp.org/) - For providing an amazing platform to learn and practice coding skills.
- The open-source community for creating and maintaining the tools and libraries used in these projects.
