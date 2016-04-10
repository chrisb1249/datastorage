from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import re
import psycopg2
import string


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
#        self.redis = StrictRedis()

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
        

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        
	exclude = set(string.punctuation)
	word = ''.join(ch for ch in word if ch not in exclude)
	word = word.lower()

	removewrds = [' ','im','just','when','his','its','he','what','so','the','of','and','to','a','in','for','is','on','that','by','this','with','i','you','it','not','or','be','are','from','at','as','your','all','have','new','more','an','was','we','will','home','can','us','about','if','my','page','has','but','our','other','do','no','they','u']

	if word not in removewrds:
	   conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432") 

	   cur = conn.cursor()

	   cur.execute("Select word, count from Tweetwordcount where word = '%s'" % word)

	   records = cur.fetchall()

	   if len(records) > 0:
	
	      pgWord = str(int(records[0][1]) + 1)

	      cur.execute("Update Tweetwordcount set count = %s where word = %s",(pgWord,word))

	      conn.commit()

	   if len(records) == 0:

	      cur.execute("Insert into Tweetwordcount (word,count) values ('%s',1)" % word)

	      conn.commit()

	   conn.close()


	# Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
