drop table besthosp;

drop table hca2;

drop table hcacomp;

create table besthosp(provider string, hosp_name string, city string, state string, rnk double);

insert into table besthosp select provider, hosp_name, city, state, count(provider) from better
  group by provider, hosp_name, city, state;

create table hca2(provider string, hosp_name string, star double);

insert into table hca2 select provider, hosp_name, avg(star) from hcahps group by provider, hosp_name;

create table hcacomp(provider string, hosp_name string, star double, rank double);

insert into table hcacomp select besthosp.provider, besthosp.hosp_name, hca2.star, besthosp.rnk
   from hca2
   join besthosp
   on hca2.provider = besthosp.provider;
