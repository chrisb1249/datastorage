drop table tally_state;

create table tally_state (state string, score int);

insert into table tally_state select tally.state, sum(tally.score) from tally group by state;

drop table hosp_state;

create table hosp_state (state string, hospnum int);

insert into table hosp_state select hospitals.state, count(*) from hospitals group by state;
