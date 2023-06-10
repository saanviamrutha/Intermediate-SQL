# Intermediate-SQL
This code was written as a part of my assignment in the course DBMS-2.
Here, CSV folder contains all the data used in this assignment.

Each sql file contains intermediate sql and is used to do different work.
1)**nba_create_table.sql**: This contains the code to create the tables for each CSV file given. 
2)**nba_load_data.sql**: This file contains the code to load the CSV data into the corresponding tables.
3)**nba_query.sql**: This file is used to executue some basic queries which are explained below:
  **query-1**: To find the count of the number of players in each position using players table.
  **query-2**: To find the top-5 most productive years, which is determined based on the total number of games played (gp) by all the players, including both     regular seasons and playoffs, for each year. And Solves ties by preferring chronologically older years, and print only the years.
  **query-3**: To add a new column eff (efficiency rating) in the table player_regular_season_career, which is defined as follows:
  eff = (pts + reb + ast + stl + blk − ((fga − fgm) + (fta − ftm) + turnover))
  To find the top-10 most efficient players Among the players who have played more than 500 games. 
  **query-4**: To find the number of players who have played more regular season games in the year 1990 than regular season games in any other year in their       career. 
  **query-5**: To find All time-best players from the table player_regular_season_career. Here all time-best players refers to the set of players P, so that
  each player in P is not dominated by any other player in the table player_regular_season_career. Also here, For two players p1 and p2, we define that p1 
  dominates p2 if and only if p1 has a higher gp (games played) and eff (efficiency rating) value than p2.
4)**nba_delete_all.sql**: Deletes all the tables and views created on executing the above codes.
5)**Result.pdf**: It contains all the results of the queries from nba_query.sql file.

