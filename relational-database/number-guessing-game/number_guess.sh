#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"

# Generate random number from 1 to 1000
RANDOM_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))

# Prompt for username
echo "Enter your username:"
read USERNAME

# Retrieve user data
USER_DATA_RESULT=$($PSQL "SELECT MIN(number_of_tries), COUNT(*), user_id FROM games INNER JOIN users USING(user_id) WHERE name='$USERNAME' GROUP BY user_id")
IFS="|" read -r MIN_NUMBER_OF_TRIES NUMBER_OF_GAMES USER_ID <<< "$USER_DATA_RESULT"

# Check if user exists
if [[ -z $USER_ID ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME! You have played $NUMBER_OF_GAMES games, and your best game took $MIN_NUMBER_OF_TRIES guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"

NUMBER_OF_TRIES=0
GUESS=0
while true
do
  read GUESS
  
  # Check if the input is an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  NUMBER_OF_TRIES=$(( NUMBER_OF_TRIES + 1 ))

  # Check if the guess is correct
  if [[ $GUESS == $RANDOM_NUMBER ]]; then
    echo "You guessed it in $NUMBER_OF_TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    
    # Insert user if not exists
    if [[ -z $USER_ID ]]; then
      USER_INSERT_RESULT=$($PSQL "INSERT INTO users(name) VALUES ('$USERNAME')")
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
    fi
    
    # Insert game result
    if [[ -n $USER_ID ]]; then
      GAME_INSERT_RESULT=$($PSQL "INSERT INTO games(number_of_tries, user_id) VALUES ($NUMBER_OF_TRIES, $USER_ID)")
    fi
    break
  else
    # Give hint if the guess is too high or too low
    if [[ $GUESS < $RANDOM_NUMBER ]]; then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
  fi
done
