DROP TABLE BETTER;

CREATE TABLE BETTER(provider string, hosp_name string, city string, state string, measurenm string, better_count int);

INSERT INTO TABLE BETTER select Complications.provider, Complications.hosp_name, Complications.city, Complications.state, Complications.measurenm, 1 from Complications where comptonatl = "Better than the National Rate";

INSERT INTO TABLE BETTER select Infections.provider, Infections.hosp_name, Infections.City, Infections.state, Infections.measurenm, 2 from Infections where comptonatl = "Better than the National Benchmark";

INSERT INTO TABLE BETTER select Readmissions.provider, Readmissions.hosp_name, Readmissions.city, Readmissions.state, Readmissions.measurenm, 3 from Readmissions where comptonatl = "Better than the National Rate";
