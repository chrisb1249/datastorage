DROP TABLE tbhospitals;

CREATE EXTERNAL TABLE tbhospitals(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, hosp_type string, ownership string, emergency string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

DROP TABLE tbhcahps;

CREATE EXTERNAL TABLE tbhcahps(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, measureid string, question string, ans_desc string, star string, star_foot string, ans_percent string, ans_foot string, lin_mean string, completed string, completed_foot string, resp_rate string, resp_foot string, measure_start string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hcahps';

DROP TABLE tbcomplications;

CREATE EXTERNAL TABLE tbcomplications(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, measurenm string, measureid string, comptonatl string, denom string, score string, lower string, higher string, foot string, measure_start string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/complications';

DROP TABLE tbreadmissions;

CREATE EXTERNAL TABLE tbreadmissions(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, measurenm string, measureid string, comptonatl string, denom string, score string, lower string, higher string, foot string, measure_start string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

DROP TABLE tbinfections;

CREATE EXTERNAL TABLE tbinfections(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, measurenm string, measureid string, comptonatl string, score string, foot string, measure_start string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/infections';

DROP TABLE tbmeasures;

CREATE EXTERNAL TABLE tbmeasures(measurenm string, measureid string, measureqtr_start string, measure_start string, measureqtr_end string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';


DROP TABLE tbtimelycare;

CREATE EXTERNAL TABLE tbtimelycare(provider string, hosp_name string, address string, city string, state string, zip string, county string, phone string, condition string, measureid string, measurenm string, score string, sample string, foot string, measure_start string, measure_end string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "escapeChar" = "\\")
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/timelycare';
