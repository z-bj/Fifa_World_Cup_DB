![Qatar_2022_banner](https://github.com/z-bj/fifa_world_cup_DB/blob/master/assets_fwc_db/fifa_world_cup_db.png)

![vim](https://img.shields.io/badge/Vim-019733.svg?style=for-the-badge&logo=Vim&logoColor=white)![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)![postgreSQL](https://camo.githubusercontent.com/281c069a2703e948b536500b9fd808cb4fb2496b3b66741db4013a2c89e91986/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f506f737467726553514c2d3331363139323f7374796c653d666f722d7468652d6261646765266c6f676f3d706f737467726573716c266c6f676f436f6c6f723d7768697465)![image](https://img.shields.io/badge/FIFA-B7312F?style=for-the-badge&logo=fifa&logoColor=white)



PostgreSQL database that stores information on Fifa World Cup games played, along with a Bash script for inserting data into the database and another script for querying the database.

## Goal

 > The goal of this project is to create a Bash script that can enter information from the World Cup games.csv file into the PostgreSQL database, and then query the database for useful statistics.


## Dataset

The data used in this project is sourced from the [games.csv](https://github.com/z-bj/Fifa_World_Cup_DB/blob/master/games.csv) file available in this repository.

## Database Building

The PostgreSQL database called 'worldcup' was created to store the data from games.csv. It contains two tables - 'games' and 'teams'. Primary and foreign keys were added as constraints to relate the tables.

The 'games' table tracks all matches and scores made by both the winner team and the opponent team using the team_id as the identifier. The 'teams' table lists all teams that played in the matches.

### View

You can view the initial_tables_creation.sql file to see how the database was created.

View: [initial_tables_creation.sql](https://github.com/z-bj/Fifa_World_Cup_DB/blob/master/initial_state_of_DB.sql)

## Data Conceptual Model (DCM)

The FIFA World Cup Data Conceptual Model (DCM) is shown in the image below.

![worldcup diagram](https://github.com/z-bj/fifa_world_cup_DB/blob/master/assets_fwc_db/FIFA_WORLD_CUP_DCM_DB.jpg)

## PostgreSQL Data Querying Through Bash Script

The [insert_data.sh](https://github.com/z-bj/Fifa_World_Cup_DB/blob/master/insert_data.sh) script reads the games.csv file and inserts all its content automatically into the waiting table by calling the database. The Bash script inserts all winning and opponent teams individually into the 'teams' table and then into the 'games' table based on the team_id created.


The [queries.sh](https://github.com/z-bj/Fifa_World_Cup_DB/blob/master/queries.sh) script utilizes SQL to query the database and obtain useful values.

The script reads data from a CSV file called `games.csv` and inserts the data into a PostgreSQL database. The script uses an `if` loop to determine whether to use the test database or the production database.

The script starts by emptying the `games` and `teams` tables in the database. It then reads each row from the `games.csv` file using the `cat` command and applies a `while` loop to read each row of the CSV file.

For each row of data, the script first checks if the team names already exist in the `teams` table. If not, it inserts the new team name into the table. It then gets the IDs of the winner and opponent teams from the `teams` table and inserts the game data into the `games` table.

The script includes `echo` calls to provide information on what is being inserted into the database. This is useful for monitoring the progress of the script and checking that everything is working correctly.

Overall, the script is a useful tool for automating the process of inserting data into a PostgreSQL database from a CSV file. It can be customized to work with different CSV files and database structures.


## Resources

A [DB dump](https://github.com/z-bj/Fifa_World_Cup_DB/blob/master/worldcup.sql) (post-insertion) is available in the worldcup.sql file.


<img src="https://github.com/z-bj/fifa_world_cup_DB/blob/master/assets_fwc_db/headingparrot.gif" width="36"> 
