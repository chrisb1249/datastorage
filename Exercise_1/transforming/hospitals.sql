
DROP INDEX IDX_Hosp ON Hospitals;
DROP TABLE Hospitals;

CREATE TABLE Hospitals
 AS SELECT * FROM tbhospitals;

CREATE INDEX IDX_Hosp
 ON TABLE Hospitals (provider) AS 'BITMAP' WITH DEFERRED REBUILD;
