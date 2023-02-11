


![Qatar_2022_banner](https://github.com/z-bj/fifa_world_cup_DB/blob/master/assets_fwc_db/fifa_world_cup_db.png)

![vim](https://img.shields.io/badge/Vim-019733.svg?style=for-the-badge&logo=Vim&logoColor=white)![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)![postgreSQL](https://camo.githubusercontent.com/281c069a2703e948b536500b9fd808cb4fb2496b3b66741db4013a2c89e91986/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f506f737467726553514c2d3331363139323f7374796c653d666f722d7468652d6261646765266c6f676f3d706f737467726573716c266c6f676f436f6c6f723d7768697465)![image](https://img.shields.io/badge/FIFA-B7312F?style=for-the-badge&logo=fifa&logoColor=white)


# Goal!!!
⤷ Create a Bash script that enters information from World Cup games.csv file into PostgreSQL, then query the database for useful statistics.


## DataBase Building

### Dataset:  <a href="https://github.com/z-bj/fifa_world_cup_DB/blob/master/games.csv"> games.csv </a>


- Build the DB, 'worldcup', and the tables ('teams' and 'games') on PostgreSQL to visualise data from games.csv.

- Added constraints (primary keys and foreign keys) required to relate the tables.

Tables:
- 'games' tracks all matches and scores made by both the winner team and the opponent team (using team_id as the identifier).
- 'teams' lists all teams that played in the matches.

### View: <a href="https://github.com/z-bj/fifa_world_cup_DB/blob/master/initial_state_of_DB.sql"> initial_tables_creation.sql
  </a>

## Data Conceptual Model (DCM)
![worldcup diagram](https://github.com/z-bj/fifa_world_cup_DB/blob/master/assets_fwc_db/FIFA_WORLD_CUP_DCM_DB.jpg)

## PostgreSQL data querying through bash script. 

The script reads games.csv and calls the DB to insert all its content automatically in the waiting table.

Took constraints into consideration when creating the Bash script to insert all winner and opponent teams individually into 'teams' and then into 'games' based on the team_id created.

### <a href="https://github.com/z-bj/fifa_world_cup_DB/blob/master/insert_data.sh"> insert_data.sh
  </a>
  
Finished by writing a Bash script that utilises SQL to query the database and obtain useful values.

### <a href="https://github.com/z-bj/fifa_world_cup_DB/blob/master/queries.sh"> queries.sh
  </a>

DB dump (post insertion): <a href="https://github.com/z-bj/fifa_world_cup_DB/blob/master/worldcup.sql"> worldcup.sql </a>



<img src="https://github.com/z-bj/fifa_world_cup_DB/blob/master/assets_fwc_db/headingparrot.gif" width="36"> 



