import re
import os, time
import speech_recognition as sr
import sounddevice as sd
import soundfile as sf
import sqlite3
import pocketsphinx
import speech_recognition as sr
from collections import Counter
from string import punctuation
from math import sqrt
from langdetect import detect
import wolframalpha
import string
import pocketsphinx
import smtplib
from os import path
import keyboard
import urllib
import urllib2
import random
import json
from HTMLParser import HTMLParser
import sys
import time
import shutil
import datetime
from time import gmtime, strftime
from random import randint
#import progressbar
from time import sleep
#import RPi.GPIO as GPIO
#import pyttsx3
#import tflearn
#import speech_data

#learningrate














# Deeadline 18 September 2018 Haarus udh di link extensionnya (Novel,Art,Music)
#Team Multimedia Interactive PIC ( Raaditya, Saamudro)








#Work on Typing sound before The computer answers
#Looks like its done


#link maruchisupichi to the main neuralprocessing (replaces espeak with more less robotic sound)





os.system("alias sudo=''")
#initializes RPI3 ACTIVITY LED
# connector pin number, and the LED GPIO isn't on the connector
#GPIO.setmode(GPIO.BCM)
# set up GPIO output channel
#GPIO.setup(16, GPIO.OUT)

#Uses as fallback If it doesnt work
#initialized ACT LED as GPIO
#os.system("echo gpio | tee /sys/class/leds/led0/trigger")
#os.system("echo gpio | tee /sys/class/leds/led1/trigger")
#engine = pyttsx3.init() #initialize robotic voice
#engine.setProperty('voice', voice.id)

#Adjusts LED brightness
#on
#os.system("echo 1 | tee /sys/class/leds/led0/brightness")
##time.sleep(1)
#os.system("echo 0 | tee /sys/class/leds/led0/brightness")
#print('runtimedbg>ledpass')
##time.sleep(2)
#os.system("clear")
os.system('echo a > /Assistant/output0.wav')
os.system('echo a > /Assistant/output.wav')
#os.system('dmesg -w &')
#shorttermmemorystart
#text_file = open("/Assistant/recieve.txt", "a")
#text_file.write('NAN') #tbh i confuse how to integrate it xd
#text_file.close()
#os.system("umount /Assistant/execmem")
#os.system("rm -rf /Assistant/execmem")
#os.system("mkdir /Assistant/execmem")
#os.system("mount -t tmpfs -o size=64m tmpfs /Assistant/execmem")
os.system("mkdir /Assistant/execmem")
os.system("play /Assistant/sfx/r2d2.wav ")
os.system("echo meow > /Assistant/execmem/voice.txt")
os.system("chmod -R 777 /Assistant/execmem")

#Html stripper-outer used to format some responses received when online
class MLStripper(HTMLParser):
    def __init__(self):
        self.reset()
        self.fed = []
    def handle_data(self, d):
        self.fed.append(d)
    def get_data(self):
        return ''.join(self.fed)

def strip_tags(html):
    s = MLStripper()
    s.feed(html)
    return s.get_data()



# A really poor way of doing things I know but it was just to test out an idea and I haven't updated it all yet
# Incoming lists - Remember they need to be in lower case
# also match the output of the voice recognizer


# however this will soon be deprecated and replaced with NLP intent (this is only use for prototyping purposes)
# the reason why this is quickly deprecated is : when you doing some conversation there are vairety (rip engrish) language slang that floating around people mind so when it happen and hit one of the phrase it will intrepet it wrongly
# aand of course later on this engine will be deprecated quickly due to the simplistic learning sequence 'Im sorry jez whitworth it was a really good concept'

name = ['what is your name?', 'what are you called', 'what are you called?', 'what is your name', 'whats your name', 'whats your name?', "what's your name", "what's your name?", 'who are you?', 'whats your name', 'what is your name', 'your full name?', 'what is your identity']
helpme = ['help', 'help.']
jez = ['who is jez whitworth?', 'who is jez whitworth', 'who is jez?', 'who is jez', 'tell me about jez', 'tell me about jez whitworth', 'jez whitworth', 'jez whitworth?']
questandachievement = ['who is quest?', 'who is quest', 'who is quest', 'who is questandachievement', 'tell me about quest', 'tell me about quest', 'quest', 'quest?']
game = ['play a game', 'play with me', 'play game', 'hangman', 'hang man']
made = ['who made you?', 'who wrote you?', 'who wrote you', 'who made you', 'who created you?', 'who created you', 'when were you made?', 'when were you made', 'when were you born?', 'when were you born', 'when is your birthday?', 'when is your birthday', 'when is it your birthday?', 'when is it your birthday']
swear = ['shit'] #add this swwear worrd lisst so it will block any woord thhat is detected
note = ['take note.', 'take a note', 'note this', 'listen']
noteread = ['read note.', 'read note', 'read me a book', 'read', ]
greetalpha = ['hello alpha.', 'hi alpha.', 'hello alpha', 'hi alpha']
#greetalpha = 'iygaufolaisg'
thanks = ['thanks.', 'thanks', 'thank you.', 'thank you', 'thnaks', 'thnaks.', 'thank', 'thank.']
#greetorion = ['hello orion.', 'hi orion.', 'hello orion', 'hi orion', 'hello', 'hi', 'say hi']
greetorion = ['99809uj99']
selectall = ['select all']
copy = ['copy']
paste = ['paste']
delete = ['delete', 'remove']
deleteall = ['remove all', 'delete all']
resetall = ['delete everything']
shutdown = ['shutdown', 'shut down', 'power off', 'bye', 'see ya', 'see you']
reboot = ['reboot', 're start', 'restart']
zoomin = ['zoom in']
zoomout = ['zoom out']
callout = ['orion']
fullscreen = ['fullscreen', 'full screen']
exit = ['exit', 'close program', 'close']
switchapp = ['switch apps', 'switch program', 'another program', 'next program', 'previous program', 'switch task' ,'alt tab']
efullscreen = ['exit fullscreen', 'exit full screen', 'exit full-screen']
voldown = ['decrease volume', 'decrease', 'decrease the volume', 'lower the volume', 'lower']
volup = ['increase volume', 'increase', 'increase the volume', 'higher']
suspend = ['sleep', 'suspend', 'take a rest', 'orion rest']
timenow = ['what time is now', 'time now', 'time now', 'time is now', 'current time', 'what time is it', 'what time it']
identity = ['who are you?', 'whats your name', 'what is your name', 'your full name?', 'what is your identity']
mycroftcall = ['hey mycroft', 'hey Microsoft', 'hey Michael']
questions = ['what is', 'whats', 'who is', 'whos', 'apa itu', 'siapa', 'kenapa', 'dimana', 'why do']
#Voice Recognition
AUDIO_FILE = "/Assistant/output.wav"
#MaruchiTarento segment
prayertime = ['prayer time', 'check prayer time', 'maghrib', 'isya', 'zuhur', 'subuh', 'ashar']
musicGAN = ['generate music', 'make me music', 'create music', 'create me a music', 'make me a music', 'piece of music', 'generate me a music', 'compose me a music', 'make a piece of music']
ArtistGenerate = ['do new painting', 'you have new art idea', 'a painting you make', 'can you paint', 'use your painting talent', 'your newest drawing']
ArtistRead = ['you make art', 'can you do art', 'me a painting you make', 'can you paint', 'painting talent', 'your drawing']
learnmusicGAN = ['learn my music', 'the music that i gave you', 'master your music skill', 'can you learn music']
ChemGAN = ['generate drug', 'find new herb', 'create medicine', 'create me a new idea for medicine']
LiteratureGenerator = ['generate story', 'find new story','make me a poem', 'create a poem', 'create a poetry', 'make me a poetry', 'make a philosophy', 'generate a philosphy' , 'create story', 'create me a new idea for story', 'tell me a story', 'tell story', 'me a story', 'story idea','make me a lyric', 'you make a lyric', 'new literature', 'please new story', 'create lyric']
musicassistGAN = ['assist me on music','assist me on creating music','help me on music' ,'help music', 'help me compose','compose using my idea', 'compose music using my idea']



#This will prevent bad word from circulating around the database
##time.sleep(randint(1, 2))
#f0 = open('/Assistant/memory/badword.txt','r')
#KEYBOARD = raw_input('[User] ').strip()
#badword = f0.read()
#f0.close()
badword = ['ngentot', 'kontol', 'fuck', 'goblok', 'bajingan', 'shit', 'hentai', 'fak', 'masturbasi', 'coli', 'Message cannot be sent', 'bitch', 'asshole', 'motherfucker', 'cunt', 'dick', 'oi anji']
lang = 'id'
trigger = '0'
Blast = '87a9sbd5t7789'

# the reason that commented variable above due to nature of the natural neural learning
#taking advantages of interaction
#swear = 'iysgfasoi7tgfoas7so8f7tsdfoa7sf'
#note = swear
#name = note
#helpme = name
#game = helpme
#made = game
#jez = made
#noteread = jez
#greetalpha = noteread
#thanks = greetalpha
# Outgoing lists - Remember they need to be in lower case
howdy = ['Hi.', 'Hello.', 'Hi there.', "Hello, it's good to see you.", 'Howdy.', 'Greetings.', 'hello again']
thanksreply = ['No problem.', 'No worries.', "You're welcome.", 'My pleasure.', 'always welcome']


# Wolfram Alpha credentials - needed for general knowledge questions when online
appid = 'WEGUG2-V8Y8X9794K' # <--- Insert your free Wolfram Alpha token here - https://developer.wolframalpha.com/portal/apisignup.html
client = wolframalpha.Client(appid)

# Connection details for the conversation database. If there is no file present or the location is referenced
# incorrectly then a new blank conversation file will be produced automatically in the location you set below.
connection = sqlite3.connect('/Assistant/memory/textlogicneuralnetwork.sqlite') # <--- Just reference the location of the conversation file here
cursor = connection.cursor()

try:
    # Create the table containing the words
    cursor.execute('''
        CREATE TABLE words (
            word TEXT UNIQUE
        )
    ''')
    # Create the table containing the sentences
    cursor.execute('''
        CREATE TABLE sentences (
            sentence TEXT UNIQUE,
            used INT NOT NULL DEFAULT 0
        )''')
    # Create association between weighted words and the next sentence
    cursor.execute('''
        CREATE TABLE associations (
            word_id INT NOT NULL,
            sentence_id INT NOT NULL,
            weight REAL NOT NULL)
    ''')
except:
    pass

def get_id(entityName, text):
    """Retrieve an entity's unique ID from the database, given its associated text.
    If the row is not already present, it is inserted.
    The entity can either be a sentence or a word."""
    tableName = entityName + 's'
    columnName = entityName
    cursor.execute('SELECT rowid FROM ' + tableName + ' WHERE ' + columnName + ' = ?', (text,))
    row = cursor.fetchone()
    if row:
        return row[0]
    else:
        cursor.execute('INSERT INTO ' + tableName + ' (' + columnName + ') VALUES (?)', (text,))
        return cursor.lastrowid

def get_words(text):
    """Retrieve the words present in a given string of text.
    The return value is a list of tuples where the first member is a lowercase word,
    and the second member the number of time it is present in the text."""
    wordsRegexpString = '(?:\w+|[' + re.escape(punctuation) + ']+)'
    wordsRegexp = re.compile(wordsRegexpString)
    wordsList = wordsRegexp.findall(text.lower())
    return Counter(wordsList).items()

os.system("play /Assistant/sfx/beep_open.wav >/dev/null &")

os.system("play /Assistant/sfx/beep_close.wav >/dev/null  &")

os.system("clear")
H = 'hello'
MOODcurr = '10.0'
HUD = '[OrionMK2]'
B = '\n Orion questandachievement7mk2\n Jez Withworth & Methieu Rodic Woggle Core \n Mycoft espeak -k 20 -f voice \n Open Assistant Andrew Vavrek, Jezra, Clayton G Hobbs, Jonathan Kulp\n PocketSphinx CMU team \n Google Voice Recognition Alphabet Inc \n Tensorflow Engine \n Online.. \n\n\n\n'
print(B)
A = '      Sample Prototyping Port By questandachievement7'
print(A)
a = '      Version Mark 2 Codename Project MaruchiTarento\n'
print(a)
a = '      Port From RPI3 Orion Sample Device\n \n'
os.system("uname -a")
os.system("uptime")
os.system("cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq")
os.system("ls -l /Assistant/memory/textlogicneuralnetwork.sqlite")
#os.system("clear")
#Comment DEEE line for disable the demoo mode
text_file = open("/Assistant/send.txt", "w")
text_file.write("") #tbh i confuse how to integrate it xd
text_file.close()
DEE = ' Sekolah Global Mandiri Project MaruchiTarento Demo \n Dimodifikasi oleh questandachievement7'
print(DEE)
r = sr.Recognizer()
#print('[OrionSense]: Adjusting Microphone for better Intrepetation')
#with sr.Microphone() as source:
    #r.adjust_for_ambient_noise(source, duration=10)
os.system("zenity --info --text='MaruchiTarento Central Server has booted sucessfully' &")
while True:
    #Thinking LED off
    #os.system("echo 0 | tee /sys/class/leds/led0/brightness ")
    # ask for user input; if a blank line, then exit
    TIME = strftime("%Y-%m-%d %H:%M:%S", gmtime())
    ##time.sleep(randint(0, 1))
   # USERHUD = TIME '[You]:'
    print('neuraldbg>' + MOODcurr )
    if MOODcurr < '75' :
        #UnderClockingPowerSaving
        #NVM
        #os.system("echo 0 | tee /sys/class/leds/led1/brightness ")
        #KEYBOARD = raw_input('[User]: ').strip()

# obtain audio from the microphone
        #print('obnixious debug message')
        print('[Ketik pesan di bawah inii]')
        #os.system('bash /Assistant/cliui.sh')

        #H# = raw_input('> ').strip()
    #UISTART

    #UISTOP
    #FileRead
    #$ f = open('helloworld.txt','r')
        #message = f.read()
        #print(message)
        #f.close() //
        #f = open('/Assistant/send.txt','r')
        #text_file = open("/Assistant/send.txt", "w")
        #text_file.write(H) #tbh i confuse how to integrate it xd
        #text_file.close()
        #time.sleep(randint(1, 2))
        msg0 = open('/Assistant/send.txt','r')
        #KEYBOARD = raw_input('[User] ').strip()
        KEYBOARD = msg0.read()
        H = re.sub("[^0-9a-zA-Z]", " ", KEYBOARD)
        #print(H)
        msg0.close()
        #os.system("play /Assistant/sfx/edgenetworksfx.wav ")
    #H = re.sub("[^0-9a-zA-Z]", " ", KEYBOARD)
    #os.system("echo 1 | tee /sys/class/leds/led1/brightness ")
        #len(H.split())
    else :
        print('neuraldbg> bypass user interaction Simulating Human Multiple Replies : ' + MOODcurr )
        H = B
        MOODcurr = str(round(randint(1, 1213), 2))
    #word Dissamblercexit
    string.split(H, '\n')  # --> ['Line 1', 'Line 2', 'Line 3']
    #print( 'neuraldbg> splitting' + H )
    #H = s #Neural Feedback
    #WORDCOUNT = len(s.split()) #code is not ready for Launch yet BUG ERROR
    #print( 'neuraldbg> WordCount' + WORDCOUNT )
    #word Dissasembler END


#Thinking Led Activation
    os.system("echo 1 | tee /sys/class/leds/led0/brightness ")
        #print (H )
   # print(TIME)
    HLower = H.lower()

   #selflearningline
    Shutdown = randint(0, 14512)
    #print(Shutdown)
    if any(HLower.find(s)>=0 for s in swear):
        print('asodjhaofuhaofahofauighfisauhjf')
    if H == 'refresh' :
        print( Shutdown )
        ##time.sleep(1)
        os.system("python /home/pi/neuralprocessing.py")
        break
    # virtualassistantpartition(open program)
    question = H.lower() # Lowercase
    firstword = question.partition(' ')[0] # Gets first word
    if firstword in ['open', 'launch', 'fire']:
        query = question.split(' ',1)[1] # Removes first word
        B = query
        C = 'okay'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(C) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        ##lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        os.system("echo meow > /Assistant/execmem/appexec.sh")
        text_file = open("/Assistant/execmem/appexec.sh", "w")
        text_file.write(B)
        text_file.close()
        os.system("bash /Assistant/execmem/appexec.sh")
        #print(query)
    # Volume Control mute
    if firstword in ['silent', 'shuush', 'mute' , 'quiet']:
        os.system("amixer -D pulse sset Master 0%")
    # Volume control max (earrape)
    if firstword in ['loud', 'fortisimo']:
        #os.system("amixer -D pulse sset Master 100%")
        os.system("pamixer --allow-boost --set-volume 150")
    # Wolframalpha
    question = H.lower() # Lowercase
    firstword = question.partition(' ')[0] # Gets first word
    if firstword in ['wgasdaf']:
        query = question.split(' ',1)[1] # Removes first word
        res = client.query(query)
        answer = next(res.results).text
        print(answer)
        B = re.sub("[^0-9a-zA-Z]", " ", answer)
        #B = answer
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        text_file = open("/Assistant/send.txt", "w")
        text_file.write('aaaaaaaasdaf') #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write('NAN') #tbh i confuse how to integrate it xd
        text_file.close()
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    # End Wolframalpha
    # natural language wolfram Alphaa
    elif any(HLower.find(s)>=0 for s in ['aaaa']):
        query = question.split(' ',1)[1] # Removes first word
        res = client.query(query)
        answer = next(res.results).text
        print(answer)
        B = re.sub("[^0-9a-zA-Z]", " ", answer)
        #B = answer
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        #end wolframalpha
    elif any(HLower.find(s)>=0 for s in badword):
    #elif re.search(re.escape(Hlower), badword, re.I):
    #elif HLower in swear:
        os.system("zenity --warning --text='Bad word cannot be tollerated'")
        print 'neuraldbg> badword has been detected and prevented from circulating the net'
    elif any(HLower.find(s)>=0 for s in volup):
    #elif HLower in volup:
        os.system('pamixer --increase 5')
    elif any(HLower.find(s)>=0 for s in voldown):
    #elif HLower in voldown:
        os.system('pamixer --decrease 5')
    elif any(HLower.find(s)>=0 for s in selectall):
    #elif HLower in selectall:
        keyboard.press_and_release('ctrl+a')
        B = 'all successfully selected'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    elif any(HLower.find(s)>=0 for s in mycroftcall):
        os.system("play /Assistant/sfx/start_listening.wav ")
        print("oh cool you found mycroft hidden secrets")
    elif any(HLower.find(s)>=0 for s in timenow):
    #elif HLower in selectall:
        #os.system('')
        #currtime = strftime("%Y-%m-%d %H:%M:%S")
        currtime = strftime("%H:%M")
        B = re.sub("[^0-9a-zA-Z]", " ", currtime)
        print(B)
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    elif any(HLower.find(s)>=0 for s in copy):
    #elif HLower in copy:
        keyboard.press_and_release('ctrl+c')
        B = 'copied'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    elif any(HLower.find(s)>=0 for s in paste):
    #elif HLower in paste:
        keyboard.press_and_release('ctrl+v')
        B = 'pasted'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    elif any(HLower.find(s)>=0 for s in callout):
    #elif HLower in callout:
        B = 'Orion, At your service'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        print('Orion Development Phase 2')
    elif any(HLower.find(s)>=0 for s in switchapp):
    #elif HLower in switchapp:
        keyboard.press_and_release('alt+tab')
        B = 'switching'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        print('Orion Development Phase 2')
    elif any(HLower.find(s)>=0 for s in prayertime):
        os.system('python2 /Assistant/extension/Assistant_prayertime/PrayerTime.py')
        B = 'Showing you current prayer time in your location'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    elif any(HLower.find(s)>=0 for s in ArtistRead):
        B = 'Doing some composing stuff'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        os.system('bash /Assistant/extension/Assistant_Artist/bootloader.sh read & ')
        text_file = open("/Assistant/send.txt", "w")
        text_file.write('NAN') #tbh i confuse how to integrate it xd
        text_file.close()
    elif any(HLower.find(s)>=0 for s in questions):
        B = 'Okay let me think first okay if you dont recieve any answer please wait for a while i am learning now'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        #remove what is and what not
        #stackoverflow as always
        #https://stackoverflow.com/questions/25346058/removing-list-of-words-from-a-string
        H = re.sub('|'.join(re.escape(r) for r in questions), '', H)
        print( 'KUCING:' + H)
        #end
        os.system('bash /Assistant/extension/Assistant_knowledge/bootloader.sh "'  + H + '"')
        text_file = open("/Assistant/send.txt", "w")
        text_file.write('hello') #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write('NAN') #tbh i confuse how to integrate it xd
        text_file.close()
        B = 'NAN'
    elif any(HLower.find(s)>=0 for s in ArtistGenerate):
        B = 'Doing some composing stuff'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        os.system('bash /Assistant/extension/Assistant_Artist/bootloader.sh generate &')
        text_file = open("/Assistant/send.txt", "w")
        text_file.write('hello') #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write('NAN') #tbh i confuse how to integrate it xd
        text_file.close()
    elif any(HLower.find(s)>=0 for s in LiteratureGenerator):
        B = 'Doing some composing stuff'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        os.system('bash /Assistant/extension/Assistant_LiteratureGenerator/bootloader.sh read &')
        text_file = open("/Assistant/send.txt", "w")
        text_file.write('hello') #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write('NAN') #tbh i confuse how to integrate it xd
        text_file.close()
    elif any(HLower.find(s)>=0 for s in LiteratureGenerator):
        B = 'Doing some composing stuff'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        os.system('bash /Assistant/extension/Assistant_LiteratureGenerator/bootloader.sh generate &')
        text_file = open("/Assistant/send.txt", "w")
        text_file.write('hello') #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write('NAN') #tbh i confuse how to integrate it xd
        text_file.close()
    elif any(HLower.find(s)>=0 for s in musicGAN):
        B = 'Doing some composing stuff'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        text_file = open("/Assistant/send.txt", "w")
        text_file.write('hello') #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write('NAN') #tbh i confuse how to integrate it xd
        text_file.close()
        os.system('bash /Assistant/extension/Assistant_Composer/bootloader.sh read &')
    elif any(HLower.find(s)>=0 for s in musicassistGAN):
        B = 'Doing some composing stuff'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        text_file = open("/Assistant/send.txt", "w")
        text_file.write('hello') #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write('NAN') #tbh i confuse how to integrate it xd
        text_file.close()
        os.system('bash /Assistant/extension/Assistant_midicomposeassist/bootloader.sh &')
    elif any(HLower.find(s)>=0 for s in learnmusicGAN):
        B = 'Okay Please wait while i learn your music, it may take 2 hours on average to do this'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        text_file = open("/Assistant/send.txt", "w")
        text_file.write('hello') #tbh i confuse how to integrate it xd
        text_file.close()
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        os.system('bash /Assistant/extension/Assistant_Composer/bootloader.sh generate & ')
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write('NAN') #tbh i confuse how to integrate it xd
        text_file.close()
    elif any(HLower.find(s)>=0 for s in exit):
    #elif HLower in exit:
        keyboard.press_and_release('alt+f4')
        B = 'exiting program'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        print('Orion Development Phase 2')
    elif any(HLower.find(s)>=0 for s in suspend):
    #elif HLower in suspend:
        B = 'going into full suspend mode'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        os.system("systemctl suspend")
        H = 'okk'
        print('Orion Development Phase 2')
    elif any(HLower.find(s)>=0 for s in delete):
    #elif HLower in delete:
        keyboard.press_and_release('ctrl+w')
        B = 'a part have been removed'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    elif any(HLower.find(s)>=0 for s in deleteall):
    #elif HLower in deleteall:
        keyboard.press_and_release('ctrl+u')
        B = 'a part have been removed'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    elif any(HLower.find(s)>=0 for s in resetall):
    #elif HLower in resetall:
        keyboard.press_and_release('ctrl+a','ctrl+u')
        B = 'a part have been removed'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    elif any(HLower.find(s)>=0 for s in fullscreen):
    #elif HLower in fullscreen:
        keyboard.press_and_release('f11')
    elif any(HLower.find(s)>=0 for s in efullscreen):
    #elif HLower in efullscreen:
        keyboard.press_and_release('f11')
    elif any(HLower.find(s)>=0 for s in zoomin):
    #elif HLower in zoomin:
        keyboard.press_and_release('ctrl + shift + plus')
    elif any(HLower.find(s)>=0 for s in zoomout):
    #elif HLower in zoomout:
        keyboard.press_and_release('ctrl + minus')
    elif any(HLower.find(s)>=0 for s in shutdown):
    #elif HLower in shutdown:
        B = 'I wont be powering down'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        #os.system("systemctl poweroff -i")
    elif any(HLower.find(s)>=0 for s in reboot):
    #elif HLower in reboot:
        B = 'restarting please wait while, i will come back'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
        os.system("reboot")
    elif any(HLower.find(s)>=0 for s in identity):
    #elif HLower in name:
        print '[OrionMK2] My name is Orion .'
    elif any(HLower.find(s)>=0 for s in made):
    #elif HLower in made:
        print '[OrionMK2] I was activated on 1st January 2016 by my creator Jez Whitworth. and was ported over by questandachievement7 and transformed me into this form "The Orion AI Project \n Orion questandachievement7mk2\n Jez Withworth & Methieu Rodic Woggle Core \n Mycoft espeak -k 20 -f voice \n Open Assistant Andrew Vavrek, Jezra, Clayton G Hobbs, Jonathan Kulp\n PocketSphinx CMU team \n Google Voice Recognition Alphabet Inc \n Tensorflow Engine 1.7"'
    elif any(HLower.find(s)>=0 for s in jez):
    #elif HLower in jez:
        print ('[OrionMK2] Jez is the creator of this main code ')
        B = 'Jez withworth is the creator of this main code who initialize the project Woggle and mainly focused for chat bot'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    #elif any(HLower.find(s)>=0 for s in questandachievement):
    elif HLower in jez:
        B = '[OrionMK2] questandachievement is team that is lead by Samudro that is the goal of this project that Orion can govern reallife human tasks and other things'
        print(B)
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    elif any(HLower.find(s)>=0 for s in helpme):
    #elif HLower in helpme:
        print '\n> Help menu: \nOffline:\n\n1. Hangman(deprecated) - Start a game of hangman with Woggle.\n2. Take note : just ask it to listen or note this or anything with your language - Create a note for Woggle to save.\n3. Read note or any natural language you can do!- Get Woggle to relay previously saved notes.\n\nOnline:\n\nQuestion (followed by question): Ask Orion any question.\n'
        B = 'Here is my manual or in this case a help menu but probably you dont need it xd'
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    #elif any(HLower.find(s)>=0 for s in greetorion):
    elif HLower in greetorion:
        print '> '+(random.choice(howdy))
        B = (random.choice(howdy))
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    #elif any(HLower.find(s)>=0 for s in thanks):
    elif HLower in thanks:
        print '> '+(random.choice(thanksreply))
        B = (random.choice(thanksreply))
        text_file = open("/Assistant/execmem/voice.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        text_file = open("/Assistant/recieve.txt", "a")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        #lang = detect(B)
        print lang
        os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #os.system("rm /Assistant/execmem/voice.txt")
    elif HLower in game:
        # Words to play in the game - Just keep adding as many as you would like.
        hangmanlist = ['Adult','Aeroplane','Air','Aircraft Carrier','Airforce','Airport','Album','Alphabet','Apple','Arm','Army','Baby','Baby','Backpack','Balloon','Banana','Bank','Barbecue','Bathroom','Bathtub','Bed','Bed','Bee','Bible','Bible','Bird','Bomb','Book','Boss','Bottle','Bowl','Box','Boy','Brain','Bridge','Butterfly','Button','Cappuccino','Car','Carpet','Carrot','Cave','Chair','Chief','Child','Chisel','Chocolates','Church','Church','Circle','Circus','Circus','Clock','Clown','Coffee','Comet','Compact Disc','Compass','Computer','Crystal','Cup','Cycle','Data Base','Desk','Diamond','Dress','Drill','Drink','Drum','Dung','Ears','Earth','Egg','Electricity','Elephant','Eraser','Explosive','Eyes','Family','Fan','Feather','Festival','Film','Finger','Fire','Floodlight','Flower','Foot','Fork','Freeway','Fruit','Fungus','Game','Garden','Gas','Gate','Gemstone','Girl','Gloves','God','Grapes','Guitar','Hammer','Hat','Hieroglyph']
        hangman = random.choice(hangmanlist)
        hangman = hangman.lower()
        print "> Time to play hangman!"
        #time.sleep(1)
        print "> Start guessing..."
        #time.sleep(0.5)
        word = hangman
        guesses = ''
        turns = 10
        while turns > 0:
            failed = 0
            for char in word:
                if char in guesses:
                    print char,
                else:
                    print "_",
                    failed += 1
            if failed == 0:
                print "\n> You won. Well done."
                break
            print
            guess = raw_input("Guess a character:")
            guesses += guess
            if guess not in word:
                turns -= 1
                print "Wrong\n"
                print "You have", + turns, 'more guesses'
                if turns == 0:
                    print "> You Lose. The answer was " + hangman
    else:
        # Thanks to Mathieu Rodic for the below SQLite code. I tried various approaches but I found this simple
               # method online and it did the same job in far fewer lines of code.
        words = get_words(B)
        words_length = sum([n * len(word) for word, n in words])
        sentence_id = get_id('sentence', H)
        for word, n in words:
            word_id = get_id('word', word)
            weight = sqrt(n / float(words_length))
            cursor.execute('INSERT INTO associations VALUES (?, ?, ?)', (word_id, sentence_id, weight))
        connection.commit()
        # retrieve the most likely answer from the database
        cursor.execute('CREATE TEMPORARY TABLE results(sentence_id INT, sentence TEXT, weight REAL)')
        words = get_words(H)
        words_length = sum([n * len(word) for word, n in words])
        for word, n in words:
            weight = sqrt(n / float(words_length))
            cursor.execute('INSERT INTO results SELECT associations.sentence_id, sentences.sentence, ?*associations.weight/(4+sentences.used) FROM words INNER JOIN associations ON associations.word_id=words.rowid INNER JOIN sentences ON sentences.rowid=associations.sentence_id WHERE words.word=?', (weight, word,))
        # if matches were found, give the best one
        cursor.execute('SELECT sentence_id, sentence, SUM(weight) AS sum_weight FROM results GROUP BY sentence_id ORDER BY sum_weight DESC LIMIT 1')
        row = cursor.fetchone()
        cursor.execute('DROP TABLE results')
        # otherwise, just randomly pick one of the least used sentences
        if row is None:
            cursor.execute('SELECT rowid, sentence FROM sentences WHERE used = (SELECT MIN(used) FROM sentences) ORDER BY RANDOM() LIMIT 1')
            row = cursor.fetchone()
            row = 'uhh'
        # tell the database the sentence has been used once more, and prepare the sentence
        B = row[1]
        HUD = '[OrionMK2]:'
        trigger = '0'
        #MOOD = randint(1, 4)
        MOODcurr = str(round(randint(1, 120), 2))
        LOWMOOD = str(round(randint(1, 20), 2))
        #MOODstrck = str(round(randint(1, 10), 2))
        #print(MOOD)
        # repetition
        if B == H :
            B = ''
            trigger = '0'
            HUD = '\r'
            HUDLINE = ', end=""'
            print('neuralwarning> No_data')
            ##time.sleep(2)
            #print('NeuralSystem>if problem still presist please reboot \
        if B == 'h' :
            B = ''
            #HUD = '\r'
            HUDLINE = ', end=""'
            HUD = '\r'
            trigger = '1'
            print('neuraldbg> Learning...')
            ##time.sleep(randint(1, 2))
            #word Dissambler
            #string.split(H, '\n')  # --> ['Line 1', 'Line 2', 'Line 3']
            print('neuraldbg>Splitting Atoms' + H )
            #word Dissasembler END
            #print('NeuralSystem>Connection arent available right now \r')
            ##time.sleep(1)
            #print('NeuralSystem>if problem still presist please reboot \r')
        if MOODcurr < LOWMOOD :
            B = ''
            HUD = '\r'
            HUDLINE = ', end=""'
            trigger = '0'
            print('neuraldbg>Simulatong Low Mood Parameter!' + LOWMOOD )
            print('neuraldbg>Simulating Human Unresponsive State!')
            print('neuraldbg>' + MOODcurr )
        if Blast == B :
            B = 'NAN'
            trigger = '1'
            text_file = open("/Assistant/recieve.txt", "a")
            text_file.write('NAN') #tbh i confuse how to integrate it xd
            text_file.close()
            print('neuraldbg>Repetition error has been detected')
            #print('i dont feel so good')
    if trigger == '0' :
            #print(MOOD)
            #print('mood level are good enough')
            #GPIO.output(16, GPIO.LOW)
            #
        #print('aa')
            ##time.sleep(randint(0, 1))
            #GPIO.output(16, GPIO.HIGH)
            # TTS ENGINE SPEECH
            #engine = pyttsx3.init()
        Bool = B
        if any(Bool.find(s)>=0 for s in badword):
        #elif HLower in swear:
            print 'neuraldbg> badword has been detected and prevented from circulating the net'
        else:
            os.system("play /Assistant/sfx/typingsfx.wav >/dev/null & ")
            print (HUD + B )
            #print ('neuraldbg> Writing Cache Audio File')
            #os.system("echo '' > /Assistant/execmem/voice.txt")
            text_file = open("/Assistant/execmem/voice.txt", "w")
            text_file.write(B) #tbh i confuse how to integrate it xd
            text_file.close()
            text_file = open("/Assistant/recieve.txt", "a")
            text_file.write(B) #tbh i confuse how to integrate it xd
            text_file.close()
            #lang = detect(B)
            print lang
            Blast=B
            os.system("mimic /Assistant/execmem/voice.txt -voice slt &")
        #time.sleep(1)
            #os.system('echo NAN > /Assistant/recieve.txt')
        #text_file = open("/Assistant/recieve.txt", "a")
        #text_file.write('NAN') #tbh i confuse how to integrate it xd
        #text_file.close()
            #os.system("rm /Assistant/execmem/voice.txt")
            #engine.say(B)
            #engine.runAndWait()
        cursor.execute('UPDATE sentences SET used=used+1 WHERE rowid=?', (row[0],))
        #print('Simulating Response delay')
        #print('unread\r')
        #sys.stdout.write("Hello world!")
        #sys.stdout.write(" I'm superman :D")
        #print('read\r')
        #print('Writing Replies\r')
        ##time.sleep(randint(1, 4))
        #print('Simulating Response delay')
#loading Bar
        #print(HUD + B )
        TIME = strftime("%Y-%m-%d %H:%M:%S", gmtime())
        #print(TIME)
        #SKIP = '\n'
        #print(SKIP)
