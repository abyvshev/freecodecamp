#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# check if argument was passed
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

# Common SQL query part
ELEMENT_QUERY="
  SELECT e.atomic_number, e.symbol, e.name, 
         p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, 
         t.type 
  FROM elements e 
  INNER JOIN properties p ON e.atomic_number = p.atomic_number 
  INNER JOIN types t ON p.type_id = t.type_id
  WHERE"

# query to find element based on input
if [[ $1 =~ ^[0-9]+$ ]]; then
  ELEMENT_RESULT=$($PSQL "$ELEMENT_QUERY e.atomic_number=$1")
else
  ELEMENT_RESULT=$($PSQL "$ELEMENT_QUERY e.symbol='$1' OR e.name='$1'")
fi

# check if element was found
if [[ -z $ELEMENT_RESULT ]]; then
  echo "I could not find that element in the database."
  exit 0
fi

# parsing the result of a query into the database into individual fields
IFS="|" read -r ELEMENT_ID ELEMENT_SYMBOL ELEMENT_NAME ELEMENT_MASS MELTING_POINT BOILING_POINT TYPE <<< "$ELEMENT_RESULT"

echo "The element with atomic number $ELEMENT_ID is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."