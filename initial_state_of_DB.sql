/* create database */
CREATE DATABASE worldcup

/* connect to database */
USE worldcup

/* create table 'game' to store the games information */

CREATE TABLE games (
    game_id integer NOT NULL identity(1,1),
    year integer NOT NULL,
    round character varying(40) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);

/* create table 'teams' to store the teams information 
includes winners and opponents*/

CREATE TABLE teams (
    team_id integer NOT NULL identity(1,1),
    name character varying(40) NOT NULL
);

/* add unique constraint on team names */

ALTER TABLE teams
    ADD UNIQUE (name);

/* add primary key constraints */

ALTER TABLE games
    ADD PRIMARY KEY (game_id);

ALTER TABLE teams
    ADD PRIMARY KEY (team_id);

/* add foreign keys */

ALTER TABLE games
    ADD FOREIGN KEY (opponent_id) 
	REFERENCES teams(team_id);

ALTER TABLE games
    ADD FOREIGN KEY (winner_id) 
	REFERENCES teams(team_id);

/* data will be inserted by running the script insert_data.sh */
