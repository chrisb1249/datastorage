DROP TABLE hospital;

CREATE EXTERNAL TABLE hospital(provider string, hosp_name CHAR(52), address CHAR(52), city CHAR(22), state CHAR(4), zip CHAR(7), county CHAR(22), phone CHAR(12), hosp_type CHAR(38), ownership CHAR(45), emergency CHAR(5))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
 "separatorChar" = ",",
 "quoteChar" = "",
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';
