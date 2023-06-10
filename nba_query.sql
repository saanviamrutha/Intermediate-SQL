/*Exercise 4
 1*/
select count(ilkid)
from players
group by position;

/*2*/
create view regular_seasons(year,sum_gp) as
select year,sum(gp) as sum_gp
from player_regular_season
group by year;

create view playoffs(year,sum_gp) as
select year,sum(gp) as sum_gp
from player_playoffs
group by year;

select playoffs.year from regular_seasons,playoffs
where regular_seasons.year=playoffs.year
order by (regular_seasons.sum_gp+playoffs.sum_gp) desc LIMIT 0,5;

/*3
part1*/
ALTER TABLE player_regular_season_career 
ADD eff INT NULL;

UPDATE player_regular_season_career
 SET eff = pts+reb+asts+stl+blk-((fga-fgm)+(fta-ftm)+tumover);

/*part2*/
create view [eff_players] as
select ilkid,sum(gp) as total_gp,sum(eff) as total_eff
from player_regular_season_career
group by ilkid
order by total_eff desc;

select * from [eff_players]
LIMIT 0,10;

/*4*/
create view view1(ilkid,year,sum_gp)as 
select ilkid,year,sum(gp) 
from player_regular_season
group by (ilkid,year);


create view view2(ilkid,year,max_gp) as
select ilkid,year,max(sum_gp)
from view1
group by ilkid;

select count(view1.ilkid) 
from view1,view2     
where view1.ilkid=view2.ilkid and view1.year="1990" and view2.year="1990"and view1.sum_gp=view2.max_gp 
EXCEPT 
select count(view1.ilkid) 
from view1,view2    
where view1.ilkid=view2.ilkid and (view1.year!="1990" or view2.year!="1990")and view1.sum_gp=view2.max_gp

/*5*/
create view v1(gp_max)
as
select max(gp)
from player_regular_season_career;

create view v2(eff_max)
as
select max(eff)
from player_regular_season_career;

select ilkid,firstname,lastname,gp,eff
from player_regular_season_career
where (gp in v1) or (eff in v2)
order by ilkid asc;

