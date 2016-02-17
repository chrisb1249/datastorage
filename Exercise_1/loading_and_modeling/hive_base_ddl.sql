DROP TABLE hospitals;

CREATE EXTERNAL TABLE hospitals(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, hosp_type string, ownership string, emergency string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

DROP TABLE hcahps;

CREATE EXTERNAL TABLE hcahps(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, measureid string, question string, ans_desc string, star string, star_foot string, ans_percent string, ans_foot string, lin_mean string, completed string, completed_foot string, resp_rate string, resp_foot string, measure_start string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hcahps';

DROP TABLE complications;

CREATE EXTERNAL TABLE complications(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, measurenm string, measureid string, comptonatl string, denom string, score string, lower string, higher string, foot string, measure_start string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/complications';

DROP TABLE readmissions;

CREATE EXTERNAL TABLE readmissions(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, measurenm string, measureid string, comptonatl string, denom string, score string, lower string, higher string, foot string, measure_start string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

DROP TABLE infections;

CREATE EXTERNAL TABLE infections(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, measurenm string, measureid string, comptonatl string, score string, foot string, measure_start string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/infections';

DROP TABLE measures;

CREATE EXTERNAL TABLE measures(measurenm string, measureid string, measureqtr_start string, measure_start string, measureqtr_end string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';


DROP TABLE timelycare;

CREATE EXTERNAL TABLE timelycare(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, condition string, measureid string, measurenm string, score string, sample string, foot string, measure_start string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/timelycare';
