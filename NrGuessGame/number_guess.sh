#!/bin/bash

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# PSQL variable for database queries
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt for username
echo "Enter your username:"
read USERNAME

# Validate username length 
# Query for existing user
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]
then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  GAMES_PLAYED=0
  BEST_GAME=NULL
else
  # Existing user
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start guessing
echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=0

while true
do
  read GUESS

  # Check if input is an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESS_COUNT++))

  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    # Correct guess
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done

# Update user statistics
if [[ $USER_DATA ]]
then
  # Existing user: increment games_played, update best_game if needed
  NEW_GAMES_PLAYED=$((GAMES_PLAYED + 1))
  if [[ -z $BEST_GAME ]] || [[ $GUESS_COUNT -lt $BEST_GAME ]]
  then
    UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED, best_game=$GUESS_COUNT WHERE username='$USERNAME'")
  else
    UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED WHERE username='$USERNAME'")
  fi
else
  # New user: set games_played=1 and best_game=GUESS_COUNT
  UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=1, best_game=$GUESS_COUNT WHERE username='$USERNAME'")
fi