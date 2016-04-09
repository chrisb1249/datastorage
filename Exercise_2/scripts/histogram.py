import psycopg2, sys

if len(list(sys.argv)) > 1:
   if len((list(sys.argv)[1]).split(',')) == 2:
      inpt = str(sys.argv[1])
      n1 = int(inpt.split(',')[0])
      n2 = int(inpt.split(',')[1])
      if n1 > n2:
         print "Your min number is greater than your max number"
      else:
         conn = psycopg2.connect(database="tcount",user="postgres",password="pass",host="localhost",port="5432")
         cur = conn.cursor()
         cur.execute("select word::bigint,sum(count) from Tweetwordcount where word::bigint between %s and %s group by word::bigint order by word asc" % (n1,n2))
         records = cur.fetchall()
         for i in range(0,len(records)):
            print "%s: %s" % (str(records[i][0]),str(records[i],[1]))
         conn.commit()
         conn.close()
   else:
      print "need 2 numbers separated by a comma"
else:
   print "need 2 numbers separated by a comma"

