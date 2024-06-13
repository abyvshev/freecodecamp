#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

# Function to display the main menu
MAIN_MENU() {
  if [[ -z $1 ]]
  then
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  else
    echo -e "\n$1\n"
  fi
  

  # Select all services
  SERVICES_RESULT=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  # Print out all services
  echo "$SERVICES_RESULT" | while read SERVICE_ID RDS SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # Read the selected service id
  read SERVICE_ID_SELECTED

  # Check if the service exists
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  SERVICE_NAME=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')
  if [[ -z $SERVICE_NAME ]]
  then
    # If the service does not exist
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # The service has been found
    CUSTOMER_DETAILS $SERVICE_ID_SELECTED $SERVICE_NAME
  fi
}

# Function to get customer details
CUSTOMER_DETAILS() {
  SERVICE_ID_SELECTED=$1
  SERVICE_NAME=$2

  # Read the customer's phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # Find the customer in the database
  CUSTOMER_RESULT="$($PSQL "SELECT customer_id, name FROM customers WHERE phone='$CUSTOMER_PHONE'")"
  read -r CUSTOMER_ID RDS CUSTOMER_NAME <<< "$CUSTOMER_RESULT"
  CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')

  if [[ -z $CUSTOMER_ID ]]
  then
    # Customer not found

    # Read the customer's name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # Insert new customer into the customers table
    CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")"
    if [[ -z $CUSTOMER_ID ]]
    then
      echo "Can't create record in customers table"
      exit 1
    fi
  fi

  # Read the appointment time
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # Create an appointment
  APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  if [[ $APPOINTMENT_RESULT == "INSERT 0 1" ]]
  then
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    echo "Can't create record in appointments table"
    exit 1
  fi
}
MAIN_MENU