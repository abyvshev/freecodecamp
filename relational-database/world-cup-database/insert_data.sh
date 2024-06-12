#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR -ne year ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $WINNER_ID ]]
    then
      INSERTED_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
      if [[ $INSERTED_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted team $WINNER"
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      else
        echo "Failed to create database entry for team $WINNER"
      fi
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]
    then
      INSERTED_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      if [[ $INSERTED_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted team $OPPONENT"
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      else
        echo "Failed to create database entry for team $OPPONENT"
      fi
    fi

    if [[ -n $WINNER_ID && -n $OPPONENT_ID ]]
    then
      GAME=$($PSQL "SELECT * FROM games WHERE winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID AND year=$YEAR AND round='$ROUND'")
      if [[ -z $GAME ]]
      then
        INSERTED_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
        if [[ $INSERTED_GAME_RESULT == "INSERT 0 1" ]]
        then
          echo "Inserted game of $YEAR year, $ROUND: $WINNER - $OPPONENT = $WINNER_GOALS : $OPPONENT_GOALS"
        fi
      fi
    fi
  fi
done
