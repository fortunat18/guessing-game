#!/bin/bash
PSQL="psql -U freecodecamp -d number_guess -t -c"
COUNTER=0
GUESSED_IT=false
echo Enter your username:
read USERNAME
RANDOM_NUM=$( shuf -i 1-1000 -n 1 )
NAME_QUERY_RESULT=$($PSQL "SELECT name FROM data WHERE name='$USERNAME';")
if [[ -z $NAME_QUERY_RESULT ]]
then
MESSAGE="Welcome, $USERNAME! It looks like this is your first time here."
echo $MESSAGE
INSERT_NEW_USER_RESULT=$($PSQL "INSERT INTO data(name) VALUES('$USERNAME')") 
else 
BEST_GAME=$($PSQL "SELECT best_game FROM data WHERE name='$USERNAME'";)
GAMES_PLAYED=$($PSQL "SELECT games_played FROM data WHERE name='$USERNAME'";)
MESSAGE="Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
echo $MESSAGE
fi
echo Guess the secret number between 1 and 1000: 
while ! $GUESSED_IT
do
read ANSWER
((COUNTER = COUNTER + 1 ))
if [[ ! $ANSWER =~ ^[0-9]+$ ]]
then 
echo That is not an integer, guess again:
elif [[ $ANSWER < $RANDOM_NUM ]]
then
echo "It's higher than that, guess again:"
elif [[ $ANSWER > $RANDOM_NUM ]]
then
echo "It's lower than that, guess again:"
elif [[ $ANSWER == $RANDOM_NUM ]]
then
(( GAMES_PLAYED=GAMES_PLAYED + 1 ))
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE data SET games_played=$GAMES_PLAYED WHERE name='$USERNAME'")
if [[ -z $BEST_GAME || $COUNTER < $BEST_GAME ]]
then
UPDATE_BEST_GAME=$($PSQL "UPDATE data SET BEST_GAME=$COUNTER WHERE name='$USERNAME'")
fi
GUESSED_IT=true
END_MESSAGE="You guessed it in $COUNTER tries. The secret number was $RANDOM_NUM. Nice job!"
fi
done
echo $END_MESSAGE
#don't know what happened to main branch