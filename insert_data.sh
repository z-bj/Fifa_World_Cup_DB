#! /bin/bash

# Check if running tests and set appropriate database credentials
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Use the PSQL variable above to query the database.

# Empty the rows in the games and teams tables so we can rerun the file
echo $($PSQL "TRUNCATE TABLE games, teams")

# Read the games.csv file using cat and apply a while loop to read row by row
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  # INSERT DATA INTO TEAMS TABLE

    # Get the name of the winning team
      # Exclude the column names row
      if [[ $WINNER != "winner" ]]
        then
          # Get the team name
          TEAM1_NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
            # If team name is not found we need to insert a new team into the table
            if [[ -z $TEAM1_NAME ]]
              then
              # Insert the new team
              INSERT_TEAM1_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
                # Echo call to let us know team was inserted
                if [[ $INSERT_TEAM1_NAME == "INSERT 0 1" ]]
                  then
                    echo Inserted team $WINNER
                fi
            fi
      fi

    # Get the name of the opponent team
      # Exclude the column names row
      if [[ $OPPONENT != "opponent" ]]
        then
          # Get the team name
          TEAM2_NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
            # If team name is not found we need to insert a new team into the table
            if [[ -z $TEAM2_NAME ]]
              then
              # Insert the new team
              INSERT_TEAM2_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
                # Echo call to let us know team was inserted
                if [[ $INSERT_TEAM2_NAME == "INSERT 0 1" ]]
                  then
                    echo Inserted team $OPPONENT
                fi
            fi
      fi

  # INSERT DATA INTO GAMES TABLE

    # We don't want the column names row so exclude it
    if [[ YEAR != "year" ]]
      then
        # Get the winner's team ID
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        # Get the opponent's team ID
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        # Insert a new row into the games table
        INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
          # Echo call to let us know what was added
          if [[ $INSERT_GAME == "INSERT 0 1" ]]
            then
              echo New game added: $YEAR, $ROUND, $WINNER_ID VS $OPPONENT_ID, score $WINNER_GOALS : $OPPONENT_GOALS
          fi

    fi
    
done
