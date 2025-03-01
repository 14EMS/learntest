#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

MAIN_MENU() {
  #intro
  echo -e "\n Quoi ou veu espèce la po ?\n"
  #list services
  SERVICE_LIST=$($PSQL "SELECT * FROM services")
  echo -e "$SERVICE_LIST" | while IFS='|' read ID SERVICE
  do
    echo -e "$ID) $SERVICE"
  done
  read SERVICE_ID_SELECTED
  #check existence SERVICE_ID_SELECTED
  SEXIST=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
  if [[ -z $SEXIST ]]
  then
    #if doesn't exist, go back
    MAIN_MENU
  else
    #else enter phone number CUSTOMER_PHONE
    echo -e "\nDonne out téléphone PD"
    read CUSTOMER_PHONE
    #if doesn't exist, create customer CUSTOMER_NAME
    CEXIST=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CEXIST ]]
    then
      #record customer name CUSTOMER_NAME
      echo -e "\nComment ou appelle troudki ?"
      read CUSTOMER_NAME
      INSERTUN=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    else
      #get customer name CUSTOMER_NAME
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #get time SERVICE_TIME
    echo -e "\nQuelle heure ou vien?"
    read SERVICE_TIME
    #record appointment
    INSERDE=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
    #write I have put you down for a <service> at <time>, <name>.
    echo -e "I have put you down for a $SEXIST at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU
