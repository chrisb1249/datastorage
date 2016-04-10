W205 Exercise #2
Chris Bennett
Readme.txt
Step-by-step Instructions on how to run the application
1. Launch an EC2 instance using AMI “UCB W205 Spring Ex 2 Image (ami-4cf9f826)
2. Start an ECB and attach it to the EC2 instance
3. Connect to the EC2 instance as root
4. Enter ‘fdisk -l’ to get disk device name
5. Enter ‘mount -t ext4 (device name) /data’
6. Enter ‘chmod a+rwx /data’
7. Change to the ~/data directory
8. Enter ‘sh start_postgres.sh’ (to start postgres)
9. Enter ‘psql -U postgres’ (to log into postgres)
10. Enter ‘create database tcount’
11. Enter ‘create table tweetwordcount(word text primary key not null, count int not null);’
12. Enter ‘\q’
13. Enter ‘pip install psycopg2’
14. Enter ‘pip intall tweepy’ (to install twitter api)
15. Setup github and test connection
16. Enter ‘git clone git@github.com:chrisb1249/datastorage.git’
17. Change directory to \datastorage\Exercise_2
18. Enter ‘sparse run’
19. To exit, enter <CTL-C>
20. Review data by utilizing \datastorage\Exercise_2\scripts\finalresults.py and histogram.py
