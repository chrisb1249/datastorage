# 2/14/16 - Chris Bennett
# script to transform and load hopsital files

rm ~/hospital_compare/*.*
rm ~/fwork/*.*
rm ~/frenamed/*.*
rm ~/fnoheader/*.*

#cleaning out the files and removing directories

rmdir ~/fwork
rmdir ~/frenamed
rmdir ~/fnoheader

#creating directories

mkdir ~/fwork
mkdir ~/frenamed
mkdir ~/fnoheader

#copy rawfiles over

cp ~/fupload/*.* ~/fwork

#remove spaces from filenames

mv ~/fwork/Complications\ -\ Hospital.csv ~/frenamed/complications.csv
mv ~/fwork/HCAHPS\ -\ Hospital.csv ~/frenamed/hcahps.csv
mv ~/fwork/Healthcare\ Associated\ Infections\ -\ Hospital.csv ~/frenamed/infections.csv
mv ~/fwork/Hospital\ General\ Information.csv ~/frenamed/hospitals.csv
mv ~/fwork/Measure\ Dates.csv ~/frenamed/measures.csv
mv ~/fwork/Medicare\ Hospital\ Spending\ per\ Patient\ -\ Hospital.csv ~/frenamed/spendingperpatient.csv
mv ~/fwork/Payment\ -\ Hospital.csv ~/frenamed/payment.csv
mv ~/fwork/Readmissions\ and\ Deaths\ -\ Hospital.csv ~/frenamed/readmissions.csv
mv ~/fwork/Timely\ and\ Effective\ Care\ -\ Hospital.csv ~/frenamed/timelycare.csv
mv ~/fwork/hvbp_ami_05_28_2015.csv ~/frenamed/hvbp.csv

#remove header records

tail -n +2 ~/frenamed/complications.csv > ~/fnoheader/complications.csv
tail -n +2 ~/frenamed/hcahps.csv > ~/fnoheader/hcahps.csv
tail -n +2 ~/frenamed/infections.csv > ~/fnoheader/infections.csv
tail -n +2 ~/frenamed/hospitals.csv > ~/fnoheader/hospitals.csv
tail -n +2 ~/frenamed/measures.csv > ~/fnoheader/measures.csv
tail -n +2 ~/frenamed/spendingperpatient.csv > ~/fnoheader/spendingperpatient.csv
tail -n +2 ~/frenamed/payment.csv > ~/fnoheader/payment.csv
tail -n +2 ~/frenamed/readmissions.csv > ~/fnoheader/readmissions.csv
tail -n +2 ~/frenamed/timelycare.csv > ~/fnoheader/timelycare.csv
tail -n +2 ~/frenamed/hvbp.csv > ~/fnoheader/hvbp.csv

#update files in /hosptital_compare with renamed and trimmed files

cp ~/fnoheader/*.* ~/hospital_compare

# load into hdfs

hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -rm /user/w205/hospital_compare/*.*

hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/complications
hdfs dfs -mkdir /user/w205/hospital_compare/hcahps
hdfs dfs -mkdir /user/w205/hospital_compare/infections
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/spendingperpatient
hdfs dfs -mkdir /user/w205/hospital_compare/payment
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/timelycare
hdfs dfs -mkdir /user/w205/hospital_compare/hvbp

hdfs dfs -rm /user/w205/hospital_compare/hospitals/*.*
hdfs dfs -rm /user/w205/hospital_compare/complications/*.*
hdfs dfs -rm /user/w205/hospital_compare/hcahps/*.*
hdfs dfs -rm /user/w205/hospital_compare/infections/*.*
hdfs dfs -rm /user/w205/hospital_compare/measures/*.*
hdfs dfs -rm /user/w205/hospital_compare/spendingperpatient/*.*
hdfs dfs -rm /user/w205/hospital_compare/payment/*.*
hdfs dfs -rm /user/w205/hospital_compare/readmissions/*.*
hdfs dfs -rm /user/w205/hospital_compare/timelycare/*.*
hdfs dfs -rm /user/w205/hospital_compare/hvbp/*.*

hdfs dfs -put ~/hospital_compare/hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put ~/hospital_compare/complications.csv /user/w205/hospital_compare/complications
hdfs dfs -put ~/hospital_compare/hcahps.csv /user/w205/hospital_compare/hcahps
hdfs dfs -put ~/hospital_compare/infections.csv /user/w205/hospital_compare/infections
hdfs dfs -put ~/hospital_compare/measures.csv /user/w205/hospital_compare/measures
hdfs dfs -put ~/hospital_compare/spendingperpatient.csv /user/w205/hospital_compare/spendingperpatient
hdfs dfs -put ~/hospital_compare/payment.csv /user/w205/hospital_compare/payment
hdfs dfs -put ~/hospital_compare/readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put ~/hospital_compare/timelycare.csv /user/w205/hospital_compare/timelycare
hdfs dfs -put ~/hospital_compare/hvbp.csv /user/w205/hvbp

hdfs dfs -ls /user/w205/hospital_compare/hospitals
hdfs dfs -ls /user/w205/hospital_compare/complications
hdfs dfs -ls /user/w205/hospital_compare/hcahps
hdfs dfs -ls /user/w205/hospital_compare/infections
hdfs dfs -ls /user/w205/hospital_compare/measures
hdfs dfs -ls /user/w205/hospital_compare/spendingperpatient
hdfs dfs -ls /user/w205/hospital_compare/payment
hdfs dfs -ls /user/w205/hospital_compare/readmissions
hdfs dfs -ls /user/w205/hospital_compare/timelycare
hdfs dfs -ls /user/w205/hospital_compare/hvbp
