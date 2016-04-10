import psycopg2, sys

conn = psycopg2.connect(database="tcount",user="postgres",password="pass",host="localhost",port="5432")

cur = conn.cursor()

if len(list(sys.argv)) >= 2:
   word = str(sys.argv[1])
   cur.execute("select * from Tweetwordcount where word = '%s'" % word)
   records = cur.fetchall()
   print "%s: %s" % (word, str(records[0][1]))
   conn.commit()
   conn.close()

else:

   cur.execute("select * from Tweetwordcount order by count desc")
   records = cur.fetchall()
   for i in range(0,len(records)):
      print "%s: %s" % (str(records[i][0]),str(records[i][1]))
   conn.commit()
   conn.close()
 
