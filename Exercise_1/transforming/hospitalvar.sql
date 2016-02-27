drop table timelyproc;

drop table procvar;

create table timelyproc(measurenm string, measureid string, score int);

insert into table timelyproc select timelycare.measurenm, timelycare.measureid, timelycare.score from timelycare;

insert into table timelyproc select readmissions.measurenm, readmissions.measureid, readmissions.score from readmissions;

create table procvar(measurenm string, measureid string, var_score double);

insert into table procvar select timelyproc.measurenm, timelyproc.measureid, variance(timelyproc.score) from timelyproc group by timelyproc.measurenm, timelyproc.measureid;
