import tweepy

consumer_key = "NidkObKFB3dlah75TwKE9FPJX";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "3NyqcYdtSwbxVNCpEMgDE3IboQElAjhgydvW8RGYrNLFbz4qdz";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "715362722314133504-HPtn7NE8EdXzfMmbMPafwMh2O8H0sXB";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "xgejbjGt9dOir9DDSE5ZO9QE3sDlXINBrq2vdytEMvW9V";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



