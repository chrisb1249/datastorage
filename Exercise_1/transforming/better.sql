DROP TABLE BETTER;

CREATE TABLE BETTER(provider string, hosp_name string, city string, state string, measurenm string, better_src int);

INSERT INTO TABLE BETTER select Complications.provider, Complications.hosp_name, Complications.city, Complications.state, Complications.measurenm, 1 from Complications where comptonatl = "Better than the National Rate";

INSERT INTO TABLE BETTER select Infections.provider, Infections.hosp_name, Infections.City, Infections.state, Infections.measurenm, 2 from Infections where comptonatl = "Better than the National Benchmark";

INSERT INTO TABLE BETTER select Readmissions.provider, Readmissions.hosp_name, Readmissions.city, Readmissions.state, Readmissions.measurenm, 3 from Readmissions where comptonatl = "Better than the National Rate";

DROP TABLE WORSE;

CREATE TABLE WORSE(provider string, hosp_name string, city string, state string, measurenm string, worse_src int);

INSERT INTO TABLE WORSE select Complications.provider, Complications.hosp_name, Complications.city, Complications.state, Complications.measurenm, 4 from Complications where comptonatl = "Worse than the National Rate";

INSERT INTO TABLE WORSE select Infections.provider, Infections.hosp_name, Infections.city, Infections.state, Infections.measurenm, 5 from Infections where comptonatl = "Worse than the National Benchmark";

INSERT INTO TABLE WORSE select Readmissions.provider, Readmissions.hosp_name, Readmissions.city, Readmissions.state, Readmissions.measurenm, 6 from Readmissions where comptonatl = "Worse than the National Rate";

DROP TABLE TALLY;

CREATE TABLE TALLY(provider string, hosp_name string, city string, state string, measurenm string, source int, score int);

INSERT INTO TABLE TALLY select Better.provider, Better.hosp_name, Better.city, Better.state, Better.measurenm, Better.better_src, 1);

INSERT INTO TABLE TALLY select Worse.provider, Worse.hosp_name, Worse.city, Worse.state, Worse.measurenm, Worse.worse_src, -1);
