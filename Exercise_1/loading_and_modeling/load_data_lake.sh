# script to transform and load hopsital files

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

cp ~/hospital_compare/*.* ~/fwork

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

rm ~/hospital_bak/*.*
cp ~/hospital_compare/*.* ~/hospital_bak

rm ~/hospital_compare/*.*
cp ~/fnoheader/*.* ~/hospital_compare

#1
# load into hdfs


