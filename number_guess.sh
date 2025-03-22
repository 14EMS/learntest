#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Get username
echo "Enter your username:"
read USERNAME

# Fetch username in the database
GAMESPLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE username = '$USERNAME'")
BESTSCORE=$($PSQL "SELECT MIN(score) FROM games WHERE username = '$USERNAME'")

# Say hello
if [[ $GAMESPLAYED -gt 0 ]]
then
  echo "Welcome back, $USERNAME! You have played $GAMESPLAYED games, and your best game took $BESTSCORE guesses."
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

# Generate random number
THENUMBER=$((1 + RANDOM % 1000)) # Random number between 1 and 1000
SCORE=0

# Tell the user to guess
echo "Guess the secret number between 1 and 1000:"
read GUESS

# Loop until the correct number is guessed
until [[ $GUESS -eq $THENUMBER ]]
do
  if [[ $GUESS =~ ^[0-9]+$ ]] && [[ $GUESS -gt $THENUMBER ]]
  then
    echo "It's lower than that, guess again:"
    SCORE=$((SCORE + 1)) # Increment score
  elif [[ $GUESS =~ ^[0-9]+$ ]] && [[ $GUESS -lt $THENUMBER ]]
  then
    echo "It's higher than that, guess again:"
    SCORE=$((SCORE + 1)) # Increment score
  else
    echo "That is not an integer, guess again:"
  fi
  read GUESS
done

# When the guess is correct
SCORE=$((SCORE + 1)) # Include the correct guess in the score
echo "You guessed it in $SCORE tries. The secret number was $THENUMBER. Nice job!"

#Record game into database
RECORDING=$($PSQL"INSERT INTO games(username, score) VALUES('$USERNAME',$SCORE);")

#lebon la non ?