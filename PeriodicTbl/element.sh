#! /bin/bash

# Database connection
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

# Check if argument provided
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

# Determine if input is a number (atomic number) or string (symbol/name)
if [[ $1 =~ ^[0-9]+$ ]]
then
  # Atomic number
  QUERY_CONDITION="e.atomic_number = $1"
else
  # Symbol or name
  QUERY_CONDITION="e.symbol = '$1' OR e.name = '$1'"
fi

# Query database
ELEMENT=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius 
                 FROM elements e 
                 JOIN properties p ON e.atomic_number = p.atomic_number 
                 JOIN types t ON p.type_id = t.type_id 
                 WHERE $QUERY_CONDITION")

# If not found
if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
  exit 0
fi

# Parse result (format: atomic_number|symbol|name|type|atomic_mass|melting|boiling)
IFS="|" read ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$ELEMENT"

# Output formatted message
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."