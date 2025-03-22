#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if an argument is provided
if [ $# -eq 0 ]; then
  echo "Please provide an element as an argument."
  exit 0
fi

# Store the argument in a variable
ARG=$1

# Query the database and retrieve the element details
ELEMENT_INFO=$($PSQL"
  SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius
  FROM elements
  JOIN properties USING(atomic_number)
  JOIN types USING(type_id)
  WHERE atomic_number::TEXT = '$ARG' OR symbol = '$ARG' OR name = '$ARG';
")

# Check if the query returned any results
if [[ -z $ELEMENT_INFO ]]; then
  echo "I could not find that element in the database."
else
  # Parse and format the output
  echo "$ELEMENT_INFO" | while IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT; do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
fi
#febouraou pd lamoukate gratteur dki