#!/usr/bin/python3
import requests
import sys
import os
import hashlib
from pymarkovchain import MarkovChain

API_URI = "http://lyrics.wikia.com/api.php?action=lyrics&fmt=realjson"

if __name__ == '__main__':

	if len(sys.argv) != 3:
		raise "Usage: python3 py-simple-lyric-generator \"[Save Slot]\" [number_of_phrases_to_generate]"

	save_slot = sys.argv[1]
	number_of_phrases = sys.argv[2]
	params = {
		'artist': save_slot
	}

	# Generating a Markov Chain Model
	db_name_hashed = "db/" + hashlib.md5(save_slot.lower().encode('utf-8')).hexdigest()
	mc = MarkovChain(db_name_hashed)

	# Checking if the database already exists, if so uses the cache instead another API call
	if not os.path.isfile(db_name_hashed):
		print("No data cached. Please be patient while we search the lyrics of %s." % save_slot)		
		
		# Adding lyrics to a single gigant string
		lyrics = ''

		# Parsing each lyric from this artist.
		# [http://api.wikia.com/wiki/LyricWiki_API]
		response = os.system('cat ' + save_slot + '.txt')
		f = open('/Assistant/extension/Assistant_LiteratureGenerator_Ported/data/artists/' + save_slot + '/' + 'Literature' + '.txt', 'r')
		response = f.readlines()
		#print (response) 
		#lyrics += response.replace('[...]', '') + ' '
		#lyrics = response
		lyrics = ' '.join([line.strip() for line in response])
		#lyrics = 'bulululululul'
		# Generating the database
		mc.generateDatabase(lyrics)
		mc.dumpdb()

	# Printing a string
	os.system("echo a > /Assistant/extension/Assistant_LiteratureGenerator_Ported/final.txt")
	for i in range(0, int(number_of_phrases)):
		print(mc.generateString())
		output=open("/Assistant/extension/Assistant_LiteratureGenerator_Ported/final.txt", "a+")
		output.write(mc.generateString() + "\n")
